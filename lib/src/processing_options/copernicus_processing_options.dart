import 'package:flutter/material.dart';
import 'package:copernicus/src/satillite/copernicus_satillite.dart';
import 'package:copernicus/src/options/copernicus_sampling.dart';

abstract class CopernicusProcessingOptions {
  CopernicusSatillite get satillite;

  final CopernicusSampling? upSampling;
  final CopernicusSampling? downSampling;

  const CopernicusProcessingOptions({
    this.upSampling, 
    this.downSampling
  });

  Map<String, dynamic> get map {
    Map<String, dynamic> map = {};

    if (upSampling != null) {
      map['upsampling'] = upSampling!.value;
    }

    if (downSampling != null) {
      map['downsampling'] = downSampling!.value;
    }

    return map;
  }

  Widget get widget;
}