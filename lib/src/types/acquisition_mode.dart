import 'package:copernicus/src/types/polarization.dart';

enum AcquisitionMode {
  sm,
  iw,
  ew,
  wv;
  
  String get value {
    switch (this) {
      case AcquisitionMode.sm:
        return 'SM';
      case AcquisitionMode.iw:
        return 'IW';
      case AcquisitionMode.ew:
        return 'EW';
      case AcquisitionMode.wv:
        return 'WV';
    }
  }

  String get description {
    switch (this) {
      case AcquisitionMode.sm:
        return 'Stripmap mode';
      case AcquisitionMode.iw:
        return 'Interferometric Wide (IW) swath mode';
      case AcquisitionMode.ew:
        return 'Extra Wide (EW) swath mode';
      case AcquisitionMode.wv:
        return 'Wave mode';
    }
  }

  List<Polarization> get polarizationOptions {
    switch (this) {
      case AcquisitionMode.wv:
        return [
          Polarization.sh, 
          Polarization.sv
        ];
      default:
        return [
          Polarization.dh, 
          Polarization.dv, 
          Polarization.sh, 
          Polarization.sv
        ];
    }
  }
}