import 'package:flutter/material.dart';
import 'package:copernicus/src/options/copernicus_sampling.dart';
import 'package:copernicus/src/satillite/copernicus_satillite.dart';
import 'package:copernicus/src/options/copernicus_back_coefficiency.dart';
import 'package:copernicus/src/options/copernicus_dem_instance.dart';
import 'package:copernicus/src/options/copernicus_speckle_filtering.dart';
import 'package:copernicus/src/processing_options/copernicus_processing_options.dart';

class CopernicusS1grdProcessingOptions extends CopernicusProcessingOptions {
  @override
  CopernicusSatillite get satillite => CopernicusSatillite.s1grd;
  
  final CopernicusBackCoefficiency? backCoefficiency;
  final bool? orthorectify;
  final CopernicusDemInstance? demInstance;
  final int? radiometricTerrainOversampling;
  final CopernicusSpeckleFiltering? speckleFiltering;

  const CopernicusS1grdProcessingOptions({
    super.upSampling,
    super.downSampling,
    this.backCoefficiency, 
    this.orthorectify, 
    this.demInstance, 
    this.radiometricTerrainOversampling, 
    this.speckleFiltering
  });

  @override
  Map<String, dynamic> get map {
    Map<String, dynamic> map = super.map;

    if (backCoefficiency != null) {
      map['backCoefficiency'] = backCoefficiency!.value;
    }

    if (orthorectify != null) {
      map['orthorectify'] = orthorectify;
    }

    if (demInstance != null) {
      map['demInstance'] = demInstance!.value;
    }

    if (radiometricTerrainOversampling != null) {
      map['radiometricTerrainOversampling'] = radiometricTerrainOversampling;
    }

    if (speckleFiltering != null) {
      map['speckleFiltering'] = speckleFiltering!.map;
    }

    return map;
  }

  @override
  Widget get widget {
    return Column(
      children: [
        const Text(
          'Processing Options',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (upSampling != null)
          Text(
            'Up Sampling: ${upSampling!.value}',
          ),
        if (downSampling != null)
          Text(
            'Down Sampling: ${downSampling!.value}',
          ),
        if (backCoefficiency != null)
          Text(
            'Back Coefficiency: ${backCoefficiency!.value}',
          ),
        if (orthorectify != null)
          Text(
            'Orthorectify: $orthorectify',
          ),
        if (demInstance != null)
          Text(
            'Dem Instance: ${demInstance!.value}',
          ),
        if (radiometricTerrainOversampling != null)
          Text(
            'Radiometric Terrain Oversampling: $radiometricTerrainOversampling',
          ),
        if (speckleFiltering != null)
          Text(
            'Speckle Filtering: ${speckleFiltering!.value}',
          ),
      ],
    );
  }

  factory CopernicusS1grdProcessingOptions.fromMap(Map<String, dynamic> map) {
    CopernicusSampling? upSampling;

    if (map.containsKey('upSampling')) {
      upSampling = CopernicusSampling.values.firstWhere((element) => element.value == map['upSampling']);
    }

    CopernicusSampling? downSampling;

    if (map.containsKey('downSampling')) {
      downSampling = CopernicusSampling.values.firstWhere((element) => element.value == map['downSampling']);
    }

    CopernicusBackCoefficiency? backCoefficiency;

    if (map.containsKey('backCoefficiency')) {
      backCoefficiency = CopernicusBackCoefficiency.values.firstWhere((element) => element.value == map['backCoefficiency']);
    }

    bool? orthorectify;

    if (map.containsKey('orthorectify')) {
      orthorectify = map['orthorectify'];
    }

    CopernicusDemInstance? demInstance;

    if (map.containsKey('demInstance')) {
      demInstance = CopernicusDemInstance.values.firstWhere((element) => element.value == map['demInstance']);
    }

    int? radiometricTerrainOversampling;

    if (map.containsKey('radiometricTerrainOversampling')) {
      radiometricTerrainOversampling = map['radiometricTerrainOversampling'];
    }

    CopernicusSpeckleFiltering? speckleFiltering;

    if (map.containsKey('speckleFiltering')) {
      speckleFiltering = CopernicusSpeckleFiltering(
        windowSizeX: map['speckleFiltering']['windowSizeX'],
        windowSizeY: map['speckleFiltering']['windowSizeY']
      );
    }

    return CopernicusS1grdProcessingOptions(
      upSampling: upSampling,
      downSampling: downSampling,
      backCoefficiency: backCoefficiency,
      orthorectify: orthorectify,
      demInstance: demInstance,
      radiometricTerrainOversampling: radiometricTerrainOversampling,
      speckleFiltering: speckleFiltering
    );
  }
}