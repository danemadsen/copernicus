enum OrbitDirection {
  ascending,
  descending;
  
  String get value {
    switch (this) {
      case OrbitDirection.ascending:
        return 'ASCENDING';
      case OrbitDirection.descending:
        return 'DESCENDING';
    }
  }

  String get description {
    switch (this) {
      case OrbitDirection.ascending:
        return 'Data acquired when the satellite was traveling approx. towards the Earth\'s North pole.';
      case OrbitDirection.descending:
        return 'Data acquired when the satellite was traveling approx. towards the Earth\'s South pole.';
    }
  }
}