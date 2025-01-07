/// An enumeration representing the resolution levels for Copernicus data.
///
/// Each resolution level has an associated string value and a description
/// providing more details about the resolution.
///
/// - `high`: High resolution with a value of 'HIGH' and a description of
///   '10m/px for IW/SM and 25m/px for EW'.
/// - `medium`: Medium resolution with a value of 'MEDIUM' and a description of
///   '40m/px for IW/SM and EW'.
enum Resolution {
  /// Represents a high resolution setting for Copernicus.
  high,

  /// Represents a medium resolution setting for the Copernicus application.
  /// This can be used to specify a medium level of detail or quality.
  medium;
  
  /// Returns the string representation of the `CopernicusResolution` enum value.
  /// 
  /// The possible return values are:
  /// - 'HIGH' for `CopernicusResolution.high`
  /// - 'MEDIUM' for `CopernicusResolution.medium`
  /// 
  /// Throws an exception if the enum value is not recognized.
  String get value {
    switch (this) {
      case Resolution.high:
        return 'HIGH';
      case Resolution.medium:
        return 'MEDIUM';
    }
  }

  /// Returns a description of the Copernicus resolution.
  /// 
  /// The description provides the resolution in meters per pixel (m/px) for
  /// different modes:
  /// - `CopernicusResolution.high`: '10m/px for IW/SM and 25m/px for EW'
  /// - `CopernicusResolution.medium`: '40m/px for IW/SM and EW'
  /// 
  /// Throws an exception if the resolution is not recognized.
  String get description {
    switch (this) {
      case Resolution.high:
        return '10m/px for IW/SM and 25m/px for EW';
      case Resolution.medium:
        return '40m/px for IW/SM and EW';
    }
  }
}