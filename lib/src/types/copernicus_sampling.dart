/// An enumeration representing different types of sampling methods
/// used in the Copernicus library.
///
/// Each sampling method provides a different way of interpolating
/// data points.
///
/// - `nearest`: Nearest neighbor interpolation.
/// - `bilinear`: Bilinear interpolation.
/// - `bicubic`: Bicubic interpolation.
enum CopernicusSampling {
  /// Represents the nearest sampling method.
  nearest,

  /// Represents the bilinear sampling method.
  /// 
  /// Bilinear sampling is a resampling method that uses the distance-weighted 
  /// average of the four nearest pixel values to estimate a new pixel value. 
  /// This method provides smoother results compared to nearest-neighbor sampling.
  bilinear,
  
  /// Represents the bicubic sampling method.
  /// Bicubic sampling is a resampling method that uses the values of the 16 nearest pixels
  /// (4x4 grid) to estimate the new pixel value. It provides smoother and more accurate
  /// results compared to bilinear sampling, especially when resizing images.
  bicubic;

  /// Returns the string representation of the sampling method.
  ///
  /// - `nearest`: Returns 'NEAREST'.
  /// - `bilinear`: Returns 'BILINEAR'.
  /// - `bicubic`: Returns 'BICUBIC'.
  String get value {
    switch (this) {
      case CopernicusSampling.nearest:
        return 'NEAREST';
      case CopernicusSampling.bilinear:
        return 'BILINEAR';
      case CopernicusSampling.bicubic:
        return 'BICUBIC';
    }
  }

  /// Returns a description of the sampling method.
  ///
  /// - `nearest`: Returns 'Nearest neighbor interpolation'.
  /// - `bilinear`: Returns 'Bilinear interpolation'.
  /// - `bicubic`: Returns 'Bicubic interpolation'.
  String get description {
   switch (this) {
      case CopernicusSampling.nearest:
        return 'Nearest neighbor interpolation';
      case CopernicusSampling.bilinear:
        return 'Bilinear interpolation';
      case CopernicusSampling.bicubic:
        return 'Bicubic interpolation';
    }
  }

  /// The default sampling method, which is `nearest`.
  static CopernicusSampling get defaultOption => CopernicusSampling.nearest;
}