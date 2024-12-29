enum CopernicusOrbitDirection {
  ascending,
  descending;
  
  String get value {
    switch (this) {
      case CopernicusOrbitDirection.ascending:
        return 'ASCENDING';
      case CopernicusOrbitDirection.descending:
        return 'DESCENDING';
    }
  }

  String get description {
    switch (this) {
      case CopernicusOrbitDirection.ascending:
        return 'Data acquired when the satellite was traveling approx. towards the Earth\'s North pole.';
      case CopernicusOrbitDirection.descending:
        return 'Data acquired when the satellite was traveling approx. towards the Earth\'s South pole.';
    }
  }
}