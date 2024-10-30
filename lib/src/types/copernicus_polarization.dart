import 'package:copernicus/src/types/copernicus_enum.dart';

enum CopernicusPolarization implements CopernicusEnum {
  sh,
  sv,
  dh,
  dv,
  hh,
  hv,
  vv,
  vh;
  
  @override
  String get value {
    switch (this) {
      case CopernicusPolarization.sh:
        return 'SH';
      case CopernicusPolarization.sv:
        return 'SV';
      case CopernicusPolarization.dh:
        return 'DH';
      case CopernicusPolarization.dv:
        return 'DV';
      case CopernicusPolarization.hh:
        return 'HH';
      case CopernicusPolarization.hv:
        return 'HV';
      case CopernicusPolarization.vv:
        return 'VV';
      case CopernicusPolarization.vh:
        return 'VH';
    }
  }

  String get description {
    switch (this) {
      case CopernicusPolarization.sh:
        return 'HH';
      case CopernicusPolarization.sv:
        return 'VV';
      case CopernicusPolarization.dh:
        return 'HH+HV';
      case CopernicusPolarization.dv:
        return 'VV+VH';
      case CopernicusPolarization.hh:
        return 'Partial Dual, HH only';
      case CopernicusPolarization.hv:
        return 'Partial Dual, HV only';
      case CopernicusPolarization.vv:
        return 'Partial Dual, VV only';
      case CopernicusPolarization.vh:
        return 'Partial Dual, VH only';
    }
  }

  String? get notes {
    switch (this) {
      case CopernicusPolarization.dh:
        return 'Typical for EW acquisitions';
      case CopernicusPolarization.dv:
        return 'Typical for IW acquisitions';
      case CopernicusPolarization.hh:
        return 'HH+HV was acquired, only HH is available in this product';
      case CopernicusPolarization.hv:
        return 'HH+HV was acquired, only HV is available in this product';
      case CopernicusPolarization.vv:
        return 'VV+VH was acquired, only VV is available in this product';
      case CopernicusPolarization.vh:
        return 'VV+VH was acquired, only VH is available in this product';
      default:
        return null;
    }
  }
}