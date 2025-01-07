enum DemInstance {
  ten,
  thirty,
  ninety;
  
  String get value {
    switch (this) {
      case DemInstance.ten:
        return 'COPERNICUS';
      case DemInstance.thirty:
        return 'COPERNICUS_30';
      case DemInstance.ninety:
        return 'COPERNICUS_90';
    }
  }

  String get dem {
    switch (this) {
      case DemInstance.ten:
        return 'Copernicus DEM GLO-10';
      case DemInstance.thirty:
        return 'Copernicus DEM GLO-30 Public and GLO-90';
      case DemInstance.ninety:
        return 'Copernicus DEM GLO-90';
    }
  }

  String get notes {
    switch (this) {
      case DemInstance.ten:
        return '10m is infilled with 30m where 10m tiles are not released';
      case DemInstance.thirty:
        return '30m is infilled with 90m where 30m tiles are not released';
      case DemInstance.ninety:
        return 'Global';
    }
  }

  static DemInstance get defaultOption => DemInstance.ten;
}