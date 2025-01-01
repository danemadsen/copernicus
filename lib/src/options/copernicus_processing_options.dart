import 'package:copernicus/src/satillite/copernicus_satillite.dart';
import 'package:copernicus/src/types/copernicus_back_coefficiency.dart';
import 'package:copernicus/src/types/copernicus_dem_instance.dart';
import 'package:copernicus/src/types/copernicus_speckle_filtering.dart';
import 'package:copernicus/src/types/copernicus_sampling.dart';

/// A class representing the processing options for Copernicus.
/// 
/// This class contains various settings and configurations that can be
/// used to customize the processing behavior of the Copernicus system.
class CopernicusProcessingOptions {
  /// The upSampling option for Copernicus processing.
  /// 
  /// This option specifies the type of up-sampling to be applied during the 
  /// processing of Copernicus data. It can be null, indicating that no 
  /// up-sampling is to be performed.
  /// 
  /// Possible values are defined in the [CopernicusSampling] enum.
  final CopernicusSampling? upSampling;

  /// The downSampling option for Copernicus processing.
  /// 
  /// This option allows specifying the type of down-sampling to be applied
  /// during the processing of Copernicus data. It can be null, indicating
  /// that no down-sampling should be performed.
  /// 
  /// Possible values are defined in the [CopernicusSampling] enum.
  final CopernicusSampling? downSampling;

  /// The backscattering coefficient option for Copernicus processing.
  /// 
  /// This parameter is optional and can be null. It represents the 
  /// backscattering coefficient used in the processing of Copernicus data.
  final CopernicusBackCoefficiency? backCoefficiency;

  /// Indicates whether orthorectification should be applied.
  /// 
  /// Orthorectification is the process of removing geometric distortions
  /// from imagery so that the scale is uniform and the image can be used
  /// as a map. If `true`, orthorectification will be applied. If `false`
  /// or `null`, orthorectification will not be applied.
  final bool? orthorectify;

  /// The digital elevation model (DEM) instance used for processing.
  /// 
  /// This can be `null` if no DEM instance is specified.
  final CopernicusDemInstance? demInstance;

  /// The level of oversampling applied to radiometric terrain processing.
  /// 
  /// This value can be `null`, indicating that no oversampling is applied.
  /// Higher values indicate more oversampling, which can improve the quality
  /// of the processed terrain data at the cost of increased processing time.
  final int? radiometricTerrainOversampling;

  /// The speckle filtering options for Copernicus processing.
  /// 
  /// This parameter allows you to specify the type of speckle filtering to be applied
  /// during the processing of Copernicus data. Speckle filtering is used to reduce
  /// noise in radar images.
  /// 
  /// It can be `null` if no speckle filtering is to be applied.
  final CopernicusSpeckleFiltering? speckleFiltering;

  /// The minimum quality assurance (QA) value.
  /// 
  /// This value is optional and can be null. If provided, it represents the 
  /// minimum acceptable QA value for processing.
  final int? minQa;

  /// Indicates whether the Earth Gravitational Model (EGM) is used.
  /// 
  /// If `true`, the EGM is applied. If `false`, the EGM is not applied.
  /// If `null`, the default behavior is used.
  final bool? egm;

  /// Constructs an instance of [CopernicusProcessingOptions].
  ///
  /// This class holds the processing options for the Copernicus library.
  /// 
  /// Example usage:
  /// 
  /// ```dart
  /// final options = CopernicusProcessingOptions(
  ///   // provide necessary parameters here
  /// );
  /// ```
  const CopernicusProcessingOptions({
    this.upSampling, 
    this.downSampling,
    this.backCoefficiency,
    this.orthorectify,
    this.demInstance,
    this.radiometricTerrainOversampling,
    this.speckleFiltering,
    this.minQa,
    this.egm,
  });

  /// Returns a map representation of the processing options.
  ///
  /// The map contains key-value pairs where the keys are strings
  /// representing the option names and the values are dynamic
  /// representing the option values.
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

  /// Creates an instance of [CopernicusProcessingOptions] from a map.
  ///
  /// The [map] parameter is a [Map] containing key-value pairs that correspond
  /// to the properties of [CopernicusProcessingOptions].
  ///
  /// Returns an instance of [CopernicusProcessingOptions] populated with the
  /// values from the provided [map].
  factory CopernicusProcessingOptions.fromMap(Map<String, dynamic> map) {
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

  /// Validates the given Copernicus satellite.
  ///
  /// This method checks the provided [satillite] to ensure it meets the
  /// necessary criteria for processing.
  ///
  /// Throws an [ArgumentError] if the satellite is not valid.
  ///
  /// - Parameter satillite: The Copernicus satellite to be validated.
  void validate(CopernicusSatillite satillite) {
    List<String> errors = [];

    if (backCoefficiency != null && satillite != CopernicusSatillite.s1grd) {
      errors.add('backCoefficiency');
    }

    if (orthorectify != null && satillite != CopernicusSatillite.s1grd) {
      errors.add('orthorectify');
    }

    if (demInstance != null && satillite != CopernicusSatillite.s1grd) {
      errors.add('demInstance');
    }

    if (radiometricTerrainOversampling != null && satillite != CopernicusSatillite.s1grd) {
      errors.add('radiometricTerrainOversampling');
    }

    if (speckleFiltering != null && satillite != CopernicusSatillite.s1grd) {
      errors.add('speckleFiltering');
    }

    if (minQa != null && satillite != CopernicusSatillite.s5pl2) {
      errors.add('minQa');
    }

    if (egm != null && satillite != CopernicusSatillite.dem) {
      errors.add('egm');
    }

    if (errors.isNotEmpty) {
      throw ArgumentError('The following arguments are not available for the selected satillite ($satillite): ${errors.join(', ')}');
    }
  }

  @override
  operator ==(Object other) {
    if (other is CopernicusProcessingOptions) {
      return upSampling == other.upSampling &&
        downSampling == other.downSampling &&
        backCoefficiency == other.backCoefficiency &&
        orthorectify == other.orthorectify &&
        demInstance == other.demInstance &&
        radiometricTerrainOversampling == other.radiometricTerrainOversampling &&
        speckleFiltering == other.speckleFiltering &&
        minQa == other.minQa &&
        egm == other.egm;
    }
    return false;
  }

  @override
  int get hashCode => upSampling.hashCode ^ downSampling.hashCode ^ backCoefficiency.hashCode ^ orthorectify.hashCode ^ demInstance.hashCode ^ radiometricTerrainOversampling.hashCode ^ speckleFiltering.hashCode ^ minQa.hashCode ^ egm.hashCode;
}