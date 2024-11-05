import 'dart:developer';

import 'package:copernicus/src/request/copernicus_request_data.dart';
import 'package:copernicus/src/satillite/copernicus_band.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:copernicus/src/providers/copernicus_tile_provider.dart';

/// A widget that represents a Copernicus layer.
///
/// This widget is used to display data from the Copernicus satellite.
/// It requires a client ID and client secret for authentication, and a list
/// of request data to specify what data to fetch. Optionally, a Dio client
/// can be provided for making HTTP requests, and a map of bands with their
/// corresponding values can be specified.
///
/// The default bands are:
/// - `CopernicusBand.s2b04` with a value of 2.5
/// - `CopernicusBand.s2b03` with a value of 2.5
/// - `CopernicusBand.s2b02` with a value of 2.5
///
/// The `CopernicusLayer` widget is a stateful widget, and its state is managed
/// by the `_CopernicusLayerState` class.
///
/// Parameters:
/// - `dioClient`: An optional Dio client for making HTTP requests.
/// - `clientId`: The client ID for authentication.
/// - `clientSecret`: The client secret for authentication.
/// - `data`: A list of request data specifying what data to fetch.
/// - `bands`: An optional map of bands with their corresponding values.
class CopernicusLayer extends StatefulWidget {
  /// An optional instance of the Dio HTTP client.
  /// This can be used to make network requests within the Copernicus layer.
  final Dio? dioClient;

  /// The client ID used to authenticate requests.
  /// 
  /// This is a unique identifier assigned to each client application
  /// that is used to track and manage API usage.
  final String clientId;

  /// The secret key used to authenticate the client.
  /// 
  /// This key should be kept confidential and not exposed in the source code.
  /// It is used to securely communicate with the server.
  final String clientSecret;

  /// A list of [CopernicusRequestData] objects representing the data for the Copernicus layer.
  final List<CopernicusRequestData> data;

  /// A map that associates each [CopernicusBand] with a corresponding double value.
  /// This can be used to store and retrieve band-specific data for a Copernicus layer.
  final Map<CopernicusBand, double> bands;
  
  /// Creates a new instance of the [CopernicusLayer].
  ///
  /// This constructor initializes the [CopernicusLayer] with the provided
  /// parameters.
  const CopernicusLayer({
    super.key, 
    this.dioClient,
    required this.clientId,
    required this.clientSecret,
    required this.data,
    this.bands = const {CopernicusBand.s2b04 : 2.5, CopernicusBand.s2b03 : 2.5, CopernicusBand.s2b02 : 2.5}
  });

  @override
  State<CopernicusLayer> createState() => _CopernicusLayerState();
}

class _CopernicusLayerState extends State<CopernicusLayer> {
  Future<String> getAuthToken() async {
    final dio = widget.dioClient ?? Dio();
    try {
      final response = await dio.post(
        'https://identity.dataspace.copernicus.eu/auth/realms/CDSE/protocol/openid-connect/token',
        options: Options(
          headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        ),
        data: {
          'grant_type': 'client_credentials',
          'client_id': widget.clientId,
          'client_secret': widget.clientSecret,
        },
      );
  
      if (response.statusCode == 200) {
        final responseData = response.data as Map<String, dynamic>;
        return responseData['access_token'] ?? '';
      } else {
        throw Exception('Failed to get access token: ${response.statusCode}');
      }
    } catch (e) {
      log('Exception in getAuthToken: $e');
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: getAuthToken(),
      builder: buildFutureLayer,
    );
  }

  Widget buildFutureLayer(BuildContext context, AsyncSnapshot<String> snapshot) {
    if (snapshot.hasData && snapshot.data!.isNotEmpty) {
      return buildLayer(context, snapshot.data!);
    } 
    else {
      return const SizedBox.shrink();
    }
  }

  Widget buildLayer(BuildContext context, String authToken) {
    return TileLayer(
      urlTemplate: '{x}.{y}.{z}',
      tileProvider: CopernicusTileProvider(
        authToken: authToken,
        bands: widget.bands,
        data: widget.data
      ),
    );
  }
}