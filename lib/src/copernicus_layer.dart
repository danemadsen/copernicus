import 'dart:developer';

import 'package:copernicus/src/request/copernicus_request_data.dart';
import 'package:copernicus/src/satillite/copernicus_band.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:copernicus/src/providers/copernicus_tile_provider.dart';


class CopernicusLayer extends StatefulWidget {
  final Dio? dioClient;
  final String clientId;
  final String clientSecret;
  final List<CopernicusRequestData> data;
  final Map<CopernicusBand, double> bands;
  
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