import 'package:copernicus/src/types/copernicus_acquisition_mode.dart';
import 'package:copernicus/src/types/copernicus_dem_instance.dart';
import 'package:copernicus/src/types/copernicus_mosaicking_order.dart';
import 'package:copernicus/src/types/copernicus_orbit_direction.dart';
import 'package:copernicus/src/types/copernicus_polarization.dart';
import 'package:copernicus/src/types/copernicus_resolution.dart';
import 'package:copernicus/src/types/copernicus_time_range.dart';
import 'package:copernicus/src/types/copernicus_timeliness.dart';
import 'package:copernicus/src/types/copernicus_view.dart';
import 'package:copernicus/src/satillite/copernicus_satillite.dart';

class CopernicusFilteringOptions {
  final CopernicusSatillite satillite;
  final CopernicusMosaickingOrder? mosaickingOrder;
  final CopernicusResolution? resolution;
  final CopernicusAcquisitionMode? acquisitionMode;
  final CopernicusPolarization? polarization;
  final CopernicusOrbitDirection? orbitDirection;
  final CopernicusTimeRange? timeRange;
  final CopernicusTimeliness? timeliness;
  final int? maxCloudCoverage;
  final CopernicusView? view;
  final CopernicusDemInstance? instance;

  Map<String, dynamic> get map {
    Map<String, dynamic> map = {};

    if (mosaickingOrder != null) {
      map['mosaickingOrder'] = mosaickingOrder!.value;
    }

    if (resolution != null) {
      map['resolution'] = resolution!.value;
    }

    if (acquisitionMode != null) {
      map['acquisitionMode'] = acquisitionMode!.value;
    }

    if (polarization != null) {
      map['polarization'] = polarization!.value;
    }

    if (orbitDirection != null) {
      map['orbitDirection'] = orbitDirection!.value;
    }

    if (timeRange != null) {
      map['timeRange'] = timeRange!.map;
    }

    if (timeliness != null) {
      map['timeliness'] = timeliness!.value;
    }

    if (maxCloudCoverage != null) {
      map['maxCloudCoverage'] = maxCloudCoverage;
    }

    if (view != null) {
      map['view'] = view!.value;
    }

    if (instance != null) {
      map['instance'] = instance!.value;
    }

    return map;
  }

  CopernicusFilteringOptions({
    required this.satillite,
    this.mosaickingOrder,
    this.resolution,
    this.acquisitionMode,
    this.polarization,
    this.orbitDirection,
    this.timeliness,
    this.maxCloudCoverage,
    this.timeRange,
    this.view,
    this.instance,
  }) {
    if (mosaickingOrder != null && (satillite == CopernicusSatillite.dem || satillite == CopernicusSatillite.datafusion)) {
      throw ArgumentError('Mosaicking Order is not available for $satillite');
    }

    if (resolution != null && satillite != CopernicusSatillite.s1grd) {
      throw ArgumentError('Resolution is not available for $satillite');
    }

    if (acquisitionMode != null && satillite != CopernicusSatillite.s1grd) {
      throw ArgumentError('Acquisition Mode is not available for $satillite');
    }

    if (polarization != null && satillite != CopernicusSatillite.s1grd) {
      throw ArgumentError('Polarization is not available for $satillite');
    }

    if (orbitDirection != null && satillite != CopernicusSatillite.s1grd && satillite != CopernicusSatillite.s3slstr) {
      throw ArgumentError('Orbit Direction is not available for $satillite');
    }

    if (timeRange != null && satillite != CopernicusSatillite.s5pl2) {
      throw ArgumentError('Time Range is not available for $satillite');
    }

    if (timeliness != null && satillite != CopernicusSatillite.s1grd && satillite != CopernicusSatillite.s5pl2) {
      throw ArgumentError('Timeliness is not available for $satillite');
    }

    if (maxCloudCoverage != null && satillite != CopernicusSatillite.s2l1c && satillite != CopernicusSatillite.s2l2a && satillite != CopernicusSatillite.s3olcil2) {
      throw ArgumentError('Max Cloud Coverage is not available for $satillite');
    }

    if (view != null && satillite != CopernicusSatillite.s3slstr) {
      throw ArgumentError('View is not available for $satillite');
    }

    if (instance != null && satillite != CopernicusSatillite.dem) {
      throw ArgumentError('Instance is not available for $satillite');
    }
  }

  factory CopernicusFilteringOptions.fromMap(CopernicusSatillite satillite, Map<String, dynamic> map) {
    CopernicusMosaickingOrder? mosaickingOrder;

    if (map.containsKey('mosaickingOrder')) {
      mosaickingOrder = CopernicusMosaickingOrder.values.firstWhere((element) => element.value == map['mosaickingOrder']);
    }

    CopernicusResolution? resolution;

    if (map.containsKey('resolution')) {
      resolution = CopernicusResolution.values.firstWhere((element) => element.value == map['resolution']);
    }

    CopernicusAcquisitionMode? acquisitionMode;

    if (map.containsKey('acquisitionMode')) {
      acquisitionMode = CopernicusAcquisitionMode.values.firstWhere((element) => element.value == map['acquisitionMode']);
    }

    CopernicusPolarization? polarization;

    if (map.containsKey('polarization')) {
      polarization = CopernicusPolarization.values.firstWhere((element) => element.value == map['polarization']);
    }

    CopernicusOrbitDirection? orbitDirection;

    if (map.containsKey('orbitDirection')) {
      orbitDirection = CopernicusOrbitDirection.values.firstWhere((element) => element.value == map['orbitDirection']);
    }

    CopernicusTimeliness? timeliness;

    if (map.containsKey('timeliness')) {
      timeliness = CopernicusTimeliness.values.firstWhere((element) => element.value == map['timeliness']);
    }

    int? maxCloudCoverage;

    if (map.containsKey('maxCloudCoverage')) {
      maxCloudCoverage = map['maxCloudCoverage'];
    }

    CopernicusTimeRange? timeRange;

    if (map.containsKey('timeRange')) {
      timeRange = CopernicusTimeRange(
        from: DateTime.fromMillisecondsSinceEpoch(map['timeRange']['from']), 
        to: DateTime.fromMillisecondsSinceEpoch(map['timeRange']['to'])
      );
    }

    CopernicusView? view;

    if (map.containsKey('view')) {
      view = CopernicusView.values.firstWhere((element) => element.value == map['view']);
    }

    CopernicusDemInstance? instance;

    if (map.containsKey('instance')) {
      instance = CopernicusDemInstance.values.firstWhere((element) => element.value == map['instance']);
    }

    return CopernicusFilteringOptions(
      satillite: satillite,
      mosaickingOrder: mosaickingOrder,
      resolution: resolution,
      acquisitionMode: acquisitionMode,
      polarization: polarization,
      orbitDirection: orbitDirection,
      timeliness: timeliness,
      maxCloudCoverage: maxCloudCoverage,
      timeRange: timeRange,
      view: view,
      instance: instance
    );
  }
}