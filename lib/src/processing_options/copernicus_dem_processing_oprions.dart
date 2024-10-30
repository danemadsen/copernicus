import 'package:flutter/material.dart';
import 'package:copernicus/src/options/copernicus_sampling.dart';
import 'package:copernicus/src/satillite/copernicus_satillite.dart';
import 'package:copernicus/src/processing_options/copernicus_processing_options.dart';

class CopernicusDemProcessingOptions extends CopernicusProcessingOptions {
  @override
  CopernicusSatillite get satillite => CopernicusSatillite.dem;

  final bool? egm;

  const CopernicusDemProcessingOptions({
    super.upSampling,
    super.downSampling,
    this.egm,
  });

  @override
  Map<String, dynamic> get map {
    Map<String, dynamic> map = super.map;

    if (egm != null) {
      map['egm'] = egm;
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
        if (egm != null)
          Text(
            'Egm: $egm',
          ),
      ],
    );
  }

  factory CopernicusDemProcessingOptions.fromMap(Map<String, dynamic> map) {
    CopernicusSampling? upSampling;

    if (map.containsKey('upSampling')) {
      upSampling = CopernicusSampling.values.firstWhere((element) => element.value == map['upSampling']);
    }

    CopernicusSampling? downSampling;

    if (map.containsKey('downSampling')) {
      downSampling = CopernicusSampling.values.firstWhere((element) => element.value == map['downSampling']);
    }

    bool? egm;

    if (map.containsKey('egm')) {
      egm = map['egm'];
    }

    return CopernicusDemProcessingOptions(
      upSampling: upSampling,
      downSampling: downSampling,
      egm: egm
    );
  }
}