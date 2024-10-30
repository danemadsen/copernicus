import 'package:copernicus/src/types/copernicus_back_coefficiency.dart';
import 'package:copernicus/src/types/copernicus_dem_instance.dart';
import 'package:copernicus/src/types/copernicus_speckle_filtering.dart';
import 'package:copernicus/src/satillite/copernicus_satillite.dart';
import 'package:copernicus/src/types/copernicus_sampling.dart';

class CopernicusProcessingOptions {
  final CopernicusSatillite satillite;
  final CopernicusSampling? upSampling;
  final CopernicusSampling? downSampling;
  final CopernicusBackCoefficiency? backCoefficiency;
  final bool? orthorectify;
  final CopernicusDemInstance? demInstance;
  final int? radiometricTerrainOversampling;
  final CopernicusSpeckleFiltering? speckleFiltering;
  final int? minQa;
  final bool? egm;

  CopernicusProcessingOptions({
    required this.satillite,
    this.upSampling, 
    this.downSampling,
    this.backCoefficiency,
    this.orthorectify,
    this.demInstance,
    this.radiometricTerrainOversampling,
    this.speckleFiltering,
    this.minQa,
    this.egm,
  }) {
    if (backCoefficiency != null && satillite != CopernicusSatillite.s1grd) {
      throw ArgumentError('backCoefficiency is only available for Sentinel-1 GRD');
    }

    if (orthorectify != null && satillite != CopernicusSatillite.s1grd) {
      throw ArgumentError('orthorectify is only available for Sentinel-1 GRD');
    }

    if (demInstance != null && satillite != CopernicusSatillite.s1grd) {
      throw ArgumentError('demInstance is only available for Sentinel-1 GRD');
    }

    if (radiometricTerrainOversampling != null && satillite != CopernicusSatillite.s1grd) {
      throw ArgumentError('radiometricTerrainOversampling is only available for Sentinel-1 GRD');
    }

    if (speckleFiltering != null && satillite != CopernicusSatillite.s1grd) {
      throw ArgumentError('speckleFiltering is only available for Sentinel-1 GRD');
    }

    if (minQa != null && satillite != CopernicusSatillite.s5pl2) {
      throw ArgumentError('minQa is only available for Sentinel-5P L2');
    }

    if (egm != null && satillite != CopernicusSatillite.dem) {
      throw ArgumentError('egm is only available for DEM');
    }
  }

  Map<String, dynamic> get map {
    Map<String, dynamic> map = {};

    if (upSampling != null) {
      map['upsampling'] = upSampling!.value;
    }

    if (downSampling != null) {
      map['downsampling'] = downSampling!.value;
    }

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

    if (minQa != null) {
      map['minQa'] = minQa;
    }

    if (egm != null) {
      map['egm'] = egm;
    }

    return map;
  }

  factory CopernicusProcessingOptions.fromMap(CopernicusSatillite satillite, Map<String, dynamic> map) {
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

    int? minQa;

    if (map.containsKey('minQa')) {
      minQa = map['minQa'];
    }

    bool? egm;

    if (map.containsKey('egm')) {
      egm = map['egm'];
    }

    return CopernicusProcessingOptions(
      satillite: satillite,
      upSampling: upSampling,
      downSampling: downSampling,
      backCoefficiency: backCoefficiency,
      orthorectify: orthorectify,
      demInstance: demInstance,
      radiometricTerrainOversampling: radiometricTerrainOversampling,
      speckleFiltering: speckleFiltering,
      minQa: minQa,
      egm: egm
    );
  }
}