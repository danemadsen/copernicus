import 'package:copernicus/src/copernicus_enum.dart';

enum CopernicusDemInstance implements CopernicusEnum {
  ten,
  thirty,
  ninety;
  
  @override
  String get value {
    switch (this) {
      case CopernicusDemInstance.ten:
        return 'COPERNICUS';
      case CopernicusDemInstance.thirty:
        return 'COPERNICUS_30';
      case CopernicusDemInstance.ninety:
        return 'COPERNICUS_90';
    }
  }

  String get dem {
    switch (this) {
      case CopernicusDemInstance.ten:
        return 'Copernicus DEM GLO-10';
      case CopernicusDemInstance.thirty:
        return 'Copernicus DEM GLO-30 Public and GLO-90';
      case CopernicusDemInstance.ninety:
        return 'Copernicus DEM GLO-90';
    }
  }

  String get notes {
    switch (this) {
      case CopernicusDemInstance.ten:
        return '10m is infilled with 30m where 10m tiles are not released';
      case CopernicusDemInstance.thirty:
        return '30m is infilled with 90m where 30m tiles are not released';
      case CopernicusDemInstance.ninety:
        return 'Global';
    }
  }

  static CopernicusDemInstance get defaultOption => CopernicusDemInstance.ten;
}