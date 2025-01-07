import 'package:copernicus/src/satillite/satillite.dart';
import 'package:copernicus/src/types/acquisition_mode.dart';
import 'package:copernicus/src/types/dem_instance.dart';
import 'package:copernicus/src/types/mosaicking_order.dart';
import 'package:copernicus/src/types/orbit_direction.dart';
import 'package:copernicus/src/types/polarization.dart';
import 'package:copernicus/src/types/resolution.dart';
import 'package:copernicus/src/types/time_range.dart';
import 'package:copernicus/src/types/timeliness.dart';
import 'package:copernicus/src/types/view.dart';

/// A class representing the filtering options for Copernicus data.
///
/// This class allows you to specify various filtering criteria for querying
/// Copernicus data, including mosaicking order, resolution, acquisition mode,
/// polarization, orbit direction, time range, timeliness, maximum cloud coverage,
/// view, and DEM instance.
///
/// Properties:
/// - `mosaickingOrder`: The order in which mosaicking is performed.
/// - `resolution`: The resolution of the data.
/// - `acquisitionMode`: The mode of data acquisition.
/// - `polarization`: The polarization of the data.
/// - `orbitDirection`: The direction of the satellite's orbit.
/// - `timeRange`: The time range for the data.
/// - `timeliness`: The timeliness of the data.
/// - `maxCloudCoverage`: The maximum allowable cloud coverage.
/// - `view`: The view configuration.
/// - `instance`: The DEM instance.
class FilteringOptions {
  /// The order in which mosaicking is performed.
  /// 
  /// This property determines the sequence in which images are combined
  /// to create a mosaic. It can be set to a specific order or left null
  /// if no specific order is required.
  final MosaickingOrder? mosaickingOrder;
  /// The resolution setting for Copernicus data filtering.
  /// 
  /// This optional parameter allows you to specify the desired resolution
  /// for the data being processed. If not provided, a default resolution
  /// may be used.
  /// 
  /// Possible values are defined in the `Resolution` enum.
  final Resolution? resolution;
  final AcquisitionMode? acquisitionMode;
  final Polarization? polarization;
  final OrbitDirection? orbitDirection;
  final TimeRange? timeRange;
  final Timeliness? timeliness;
  final int? maxCloudCoverage;
  final View? view;
  final DemInstance? instance;

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

  const FilteringOptions({
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
  });

  factory FilteringOptions.fromMap(Map<String, dynamic> map) {
    MosaickingOrder? mosaickingOrder;

    if (map.containsKey('mosaickingOrder')) {
      mosaickingOrder = MosaickingOrder.values.firstWhere((element) => element.value == map['mosaickingOrder']);
    }

    Resolution? resolution;

    if (map.containsKey('resolution')) {
      resolution = Resolution.values.firstWhere((element) => element.value == map['resolution']);
    }

    AcquisitionMode? acquisitionMode;

    if (map.containsKey('acquisitionMode')) {
      acquisitionMode = AcquisitionMode.values.firstWhere((element) => element.value == map['acquisitionMode']);
    }

    Polarization? polarization;

    if (map.containsKey('polarization')) {
      polarization = Polarization.values.firstWhere((element) => element.value == map['polarization']);
    }

    OrbitDirection? orbitDirection;

    if (map.containsKey('orbitDirection')) {
      orbitDirection = OrbitDirection.values.firstWhere((element) => element.value == map['orbitDirection']);
    }

    Timeliness? timeliness;

    if (map.containsKey('timeliness')) {
      timeliness = Timeliness.values.firstWhere((element) => element.value == map['timeliness']);
    }

    int? maxCloudCoverage;

    if (map.containsKey('maxCloudCoverage')) {
      maxCloudCoverage = map['maxCloudCoverage'];
    }

    TimeRange? timeRange;

    if (map.containsKey('timeRange')) {
      timeRange = TimeRange(
        from: DateTime.fromMillisecondsSinceEpoch(map['timeRange']['from']), 
        to: DateTime.fromMillisecondsSinceEpoch(map['timeRange']['to'])
      );
    }

    View? view;

    if (map.containsKey('view')) {
      view = View.values.firstWhere((element) => element.value == map['view']);
    }

    DemInstance? instance;

    if (map.containsKey('instance')) {
      instance = DemInstance.values.firstWhere((element) => element.value == map['instance']);
    }

    return FilteringOptions(
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

  void validate(Satillite satillite) {
    List<String> errors = [];

    if (mosaickingOrder != null && (satillite == Satillite.dem || satillite == Satillite.datafusion)) {
      errors.add('mosaickingOrder');
    }

    if (resolution != null && satillite != Satillite.s1grd) {
      errors.add('resolution');
    }

    if (acquisitionMode != null && satillite != Satillite.s1grd) {
      errors.add('acquisitionMode');
    }

    if (polarization != null && satillite != Satillite.s1grd) {
      errors.add('polarization');
    }

    if (orbitDirection != null && satillite != Satillite.s1grd && satillite != Satillite.s3slstr) {
      errors.add('orbitDirection');
    }

    if (timeRange != null && satillite != Satillite.s5pl2) {
      errors.add('timeRange');
    }

    if (timeliness != null && satillite != Satillite.s1grd && satillite != Satillite.s5pl2) {
      errors.add('timeliness');
    }

    if (maxCloudCoverage != null && satillite != Satillite.s2l1c && satillite != Satillite.s2l2a && satillite != Satillite.s3olcil2) {
      errors.add('maxCloudCoverage');
    }

    if (view != null && satillite != Satillite.s3slstr) {
      errors.add('view');
    }

    if (instance != null && satillite != Satillite.dem) {
      errors.add('instance');
    }

    if (errors.isNotEmpty) {
      throw ArgumentError('The following arguments are not available for the selected satillite ($satillite): ${errors.join(', ')}');
    }
  }

  @override
  operator ==(Object other) {
    if (other is FilteringOptions) {
      return mosaickingOrder == other.mosaickingOrder &&
        resolution == other.resolution &&
        acquisitionMode == other.acquisitionMode &&
        polarization == other.polarization &&
        orbitDirection == other.orbitDirection &&
        timeRange == other.timeRange &&
        timeliness == other.timeliness &&
        maxCloudCoverage == other.maxCloudCoverage &&
        view == other.view &&
        instance == other.instance;
    }
    return false;
  }

  @override
  int get hashCode => mosaickingOrder.hashCode ^ resolution.hashCode ^ acquisitionMode.hashCode ^ polarization.hashCode ^ orbitDirection.hashCode ^ timeRange.hashCode ^ timeliness.hashCode ^ maxCloudCoverage.hashCode ^ view.hashCode ^ instance.hashCode;
}