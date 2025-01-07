class SpeckleFiltering {
  final int? windowSizeX;
  final int? windowSizeY;

  SpeckleFiltering({
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

  @override
  operator ==(Object other) {
    if (other is SpeckleFiltering) {
      return windowSizeX == other.windowSizeX &&
        windowSizeY == other.windowSizeY;
    }
    return false;
  }

  @override
  int get hashCode => windowSizeX.hashCode ^ windowSizeY.hashCode;
}