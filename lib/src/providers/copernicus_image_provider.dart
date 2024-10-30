import 'dart:async';
import 'dart:convert' as convert;
import 'dart:developer';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:copernicus/src/request/copernicus_request.dart';

class CopernicusImageProvider extends ImageProvider<CopernicusImageProvider> {
  final String _apiUrl = 'https://sh.dataspace.copernicus.eu/api/v1/process';
  final String authToken;
  final Map<String, String> headers;
  final CopernicusRequest request;
  final Dio dioClient;
  final Future<void> cancelLoading;
  final void Function() startedLoading;
  final void Function() finishedLoadingBytes;
  final bool silenceExceptions;

  const CopernicusImageProvider({
    required this.authToken,
    required this.headers,
    required this.request,
    required this.dioClient,
    required this.cancelLoading,
    required this.startedLoading,
    required this.finishedLoadingBytes,
    this.silenceExceptions = true,
  });

  @override
  Future<CopernicusImageProvider> obtainKey(ImageConfiguration configuration) {
    return SynchronousFuture<CopernicusImageProvider>(this);
  }

  @override
  ImageStreamCompleter loadImage(
    CopernicusImageProvider key,
    ImageDecoderCallback decode,
  ) {
    return MultiFrameImageStreamCompleter(
      codec: _loadWithRetries(key, decode),
      scale: 1,
      debugLabel: _apiUrl,
      informationCollector: () => [
        DiagnosticsProperty('URL', _apiUrl),
        DiagnosticsProperty('Current provider', key),
      ],
    );
  }

  Future<Codec> _loadWithRetries(
    CopernicusImageProvider key,
    ImageDecoderCallback decode,
  ) async {
    const int maxRetries = 10;
    int attempt = 0;

    while (attempt < maxRetries) {
      try {
        return await _load(key, decode);
      } 
      catch (e) {
        log("Error loading image: $e\nAttempt: $attempt");

        attempt++;

        if (attempt >= maxRetries) {
          return _handleError(key, decode, e);
        }
        
        await Future.delayed(Duration(seconds: 1 * attempt)); // Optional delay between retries
      }
    }

    // Fallback to a transparent image after retries
    return _handleError(key, decode, 'Maximum retries reached');
  }

  Future<Codec> _load(
    CopernicusImageProvider key,
    ImageDecoderCallback decode,
  ) async {
    startedLoading();

    final cancelToken = CancelToken();
    unawaited(cancelLoading.then((_) => cancelToken.cancel()));

    // Make the Dio request
    final response = await dioClient.postUri<Uint8List>(
      Uri.parse(_apiUrl),
      data: convert.jsonEncode(request.map),
      options: Options(
        headers: {
          ...headers,
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $authToken',
        },
        responseType: ResponseType.bytes,
      ),
      cancelToken: cancelToken,
    );

    // Call finishedLoadingBytes after the response
    finishedLoadingBytes();

    // Decode the image
    final buffer = await ImmutableBuffer.fromUint8List(response.data!);

    return decode(buffer);
  }

  Future<Codec> _handleError(
    CopernicusImageProvider key,
    ImageDecoderCallback decode,
    dynamic error,
  ) async {
    // Evict from image cache
    scheduleMicrotask(() => PaintingBinding.instance.imageCache.evict(key));

    // Check for cancellation
    if (error is DioException && CancelToken.isCancel(error)) {
      // Return a transparent image
      final buffer = await ImmutableBuffer.fromUint8List(Uint8List(0));
      return decode(buffer);
    }

    // Handle other errors
    if (!silenceExceptions) {
      throw error;
    }

    // Fallback to a transparent image
    final buffer = await ImmutableBuffer.fromUint8List(Uint8List(0));
    return decode(buffer);
  }
}
