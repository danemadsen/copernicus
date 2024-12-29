enum CopernicusSampling {
  nearest,
  bilinear,
  bicubic;
  
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

  static CopernicusSampling get defaultOption => CopernicusSampling.nearest;
}