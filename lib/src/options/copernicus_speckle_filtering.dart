class CopernicusSpeckleFiltering {
  final int? windowSizeX;
  final int? windowSizeY;

  CopernicusSpeckleFiltering({
    this.windowSizeX, 
    this.windowSizeY
  }) {
    if ((windowSizeX == null) ^ (windowSizeY == null)) {
      throw ArgumentError('Both windowSizeX and windowSizeY must be provided');
    }
  }

  Map<String, dynamic> get map {
    Map<String, dynamic> map = {};

    if (windowSizeX != null && windowSizeY != null) {
      map['type'] = 'Lee';
      map['windowSizeX'] = windowSizeX;
      map['windowSizeY'] = windowSizeY;
    }
    else {
      map['type'] = 'None';
    }

    return map;
  }

  String get value {
    if (windowSizeX != null && windowSizeY != null) {
      return 'Lee: $windowSizeX x $windowSizeY';
    }
    else {
      return 'None';
    }
  }
}