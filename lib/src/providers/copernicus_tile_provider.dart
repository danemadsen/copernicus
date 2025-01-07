import 'dart:async';
import 'dart:collection';
import 'dart:math' as math;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:copernicus/src/providers/copernicus_image_provider.dart';
import 'package:copernicus/src/request/copernicus_request.dart';
import 'package:copernicus/src/request/copernicus_request_data.dart';
import 'package:copernicus/src/satillite/band.dart';

class CopernicusTileProvider extends TileProvider {
  final HashMap<TileCoordinates, Completer<void>> _tilesInProgress = HashMap();
  final Dio _dioClient;
  final String authToken;
  final List<CopernicusRequestData> data;
  final Map<Band, double> bands;

  CopernicusTileProvider({
    super.headers,
    Dio? dioClient,
    required this.authToken,
    required this.data,
    required this.bands,
  }) : _dioClient = dioClient ?? Dio();

  @override
  ImageProvider getImage(TileCoordinates coordinates, TileLayer options) {
    final request = CopernicusRequest.create(
      bbox: _getTileBoundBox(coordinates),
      data: data,
      bands: bands,
    );

    _tilesInProgress[coordinates] = Completer();

    return CopernicusImageProvider(
      authToken: authToken,
      headers: headers,
      request: request,
      dioClient: _dioClient,
      cancelLoading: _tilesInProgress[coordinates]!.future,
      startedLoading: () => _tilesInProgress[coordinates] = Completer(),
      finishedLoadingBytes: () {
        _tilesInProgress[coordinates]!.complete();
        _tilesInProgress.remove(coordinates);
      },
      silenceExceptions: false, // Set to true if you want to suppress exceptions
    );
  }

  List<double> _getTileBoundBox(TileCoordinates coords) {
    final z = coords.z.toDouble();
    final x = coords.x.toDouble();
    final y = coords.y.toDouble();

    final n = math.pow(2.0, z);

    final lonDegLeft = x / n * 360.0 - 180.0;
    final lonDegRight = (x + 1) / n * 360.0 - 180.0;

    final latRadTop = math.atan(_sinh(math.pi * (1 - 2 * y / n)));
    final latDegTop = latRadTop * 180.0 / math.pi;

    final latRadBottom = math.atan(_sinh(math.pi * (1 - 2 * (y + 1) / n)));
    final latDegBottom = latRadBottom * 180.0 / math.pi;

    // Return [min_lon, min_lat, max_lon, max_lat]
    return [lonDegLeft, latDegBottom, lonDegRight, latDegTop];
  }

  double _sinh(double x) {
    return (math.exp(x) - math.exp(-x)) / 2.0;
  }
}
