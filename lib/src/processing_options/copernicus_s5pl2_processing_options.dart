import 'package:flutter/material.dart';
import 'package:copernicus/src/options/copernicus_sampling.dart';
import 'package:copernicus/src/satillite/copernicus_satillite.dart';
import 'package:copernicus/src/processing_options/copernicus_processing_options.dart';

class CopernicusS5pl2ProcessingOptions extends CopernicusProcessingOptions {
  @override
  CopernicusSatillite get satillite => CopernicusSatillite.s5pl2;

  final int? minQa;

  const CopernicusS5pl2ProcessingOptions({
    super.upSampling,
    super.downSampling,
    this.minQa
  });

  @override
  Map<String, dynamic> get map {
    Map<String, dynamic> map = super.map;

    if (minQa != null) {
      map['minQa'] = minQa;
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
        if (minQa != null)
          Text(
            'Min QA: $minQa',
          ),
      ],
    );
  }

  factory CopernicusS5pl2ProcessingOptions.fromMap(Map<String, dynamic> map) {
    CopernicusSampling? upSampling;

    if (map.containsKey('upSampling')) {
      upSampling = CopernicusSampling.values.firstWhere((element) => element.value == map['upSampling']);
    }

    CopernicusSampling? downSampling;

    if (map.containsKey('downSampling')) {
      downSampling = CopernicusSampling.values.firstWhere((element) => element.value == map['downSampling']);
    }
    
    int? minQa;

    if (map.containsKey('minQa')) {
      minQa = map['minQa'];
    }

    return CopernicusS5pl2ProcessingOptions(
      upSampling: upSampling,
      downSampling: downSampling,
      minQa: minQa,
    );
  }
}