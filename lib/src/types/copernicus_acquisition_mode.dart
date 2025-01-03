import 'package:copernicus/src/types/copernicus_polarization.dart';

enum CopernicusAcquisitionMode {
  sm,
  iw,
  ew,
  wv;
  
  String get value {
    switch (this) {
      case CopernicusAcquisitionMode.sm:
        return 'SM';
      case CopernicusAcquisitionMode.iw:
        return 'IW';
      case CopernicusAcquisitionMode.ew:
        return 'EW';
      case CopernicusAcquisitionMode.wv:
        return 'WV';
    }
  }

  String get description {
    switch (this) {
      case CopernicusAcquisitionMode.sm:
        return 'Stripmap mode';
      case CopernicusAcquisitionMode.iw:
        return 'Interferometric Wide (IW) swath mode';
      case CopernicusAcquisitionMode.ew:
        return 'Extra Wide (EW) swath mode';
      case CopernicusAcquisitionMode.wv:
        return 'Wave mode';
    }
  }

  List<CopernicusPolarization> get polarizationOptions {
    switch (this) {
      case CopernicusAcquisitionMode.wv:
        return [
          CopernicusPolarization.sh, 
          CopernicusPolarization.sv
        ];
      default:
        return [
          CopernicusPolarization.dh, 
          CopernicusPolarization.dv, 
          CopernicusPolarization.sh, 
          CopernicusPolarization.sv
        ];
    }
  }
}