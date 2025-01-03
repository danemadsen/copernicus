enum CopernicusResolution {
  high,
  medium;
  
  String get value {
    switch (this) {
      case CopernicusResolution.high:
        return 'HIGH';
      case CopernicusResolution.medium:
        return 'MEDIUM';
    }
  }

  String get description {
    switch (this) {
      case CopernicusResolution.high:
        return '10m/px for IW/SM and 25m/px for EW';
      case CopernicusResolution.medium:
        return '40m/px for IW/SM and EW';
    }
  }
}