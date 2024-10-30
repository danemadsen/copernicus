import 'package:flutter/material.dart';
import 'package:copernicus/src/options/copernicus_sampling.dart';
import 'package:copernicus/src/satillite/copernicus_satillite.dart';
import 'package:copernicus/src/processing_options/copernicus_processing_options.dart';

class CopernicusS3olcil1bProcessingOptions extends CopernicusProcessingOptions {
  @override
  CopernicusSatillite get satillite => CopernicusSatillite.s3olcil1b;

  const CopernicusS3olcil1bProcessingOptions({
    super.upSampling,
    super.downSampling,
  });

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
      ],
    );
  }

  factory CopernicusS3olcil1bProcessingOptions.fromMap(Map<String, dynamic> map) {
    CopernicusSampling? upSampling;

    if (map.containsKey('upSampling')) {
      upSampling = CopernicusSampling.values.firstWhere((element) => element.value == map['upSampling']);
    }

    CopernicusSampling? downSampling;

    if (map.containsKey('downSampling')) {
      downSampling = CopernicusSampling.values.firstWhere((element) => element.value == map['downSampling']);
    }

    return CopernicusS3olcil1bProcessingOptions(
      upSampling: upSampling,
      downSampling: downSampling,
    );
  }
}