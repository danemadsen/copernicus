enum Polarization {
  sh,
  sv,
  dh,
  dv,
  hh,
  hv,
  vv,
  vh;
  
  String get value {
    switch (this) {
      case Polarization.sh:
        return 'SH';
      case Polarization.sv:
        return 'SV';
      case Polarization.dh:
        return 'DH';
      case Polarization.dv:
        return 'DV';
      case Polarization.hh:
        return 'HH';
      case Polarization.hv:
        return 'HV';
      case Polarization.vv:
        return 'VV';
      case Polarization.vh:
        return 'VH';
    }
  }

  String get description {
    switch (this) {
      case Polarization.sh:
        return 'HH';
      case Polarization.sv:
        return 'VV';
      case Polarization.dh:
        return 'HH+HV';
      case Polarization.dv:
        return 'VV+VH';
      case Polarization.hh:
        return 'Partial Dual, HH only';
      case Polarization.hv:
        return 'Partial Dual, HV only';
      case Polarization.vv:
        return 'Partial Dual, VV only';
      case Polarization.vh:
        return 'Partial Dual, VH only';
    }
  }

  String? get notes {
    switch (this) {
      case Polarization.dh:
        return 'Typical for EW acquisitions';
      case Polarization.dv:
        return 'Typical for IW acquisitions';
      case Polarization.hh:
        return 'HH+HV was acquired, only HH is available in this product';
      case Polarization.hv:
        return 'HH+HV was acquired, only HV is available in this product';
      case Polarization.vv:
        return 'VV+VH was acquired, only VV is available in this product';
      case Polarization.vh:
        return 'VV+VH was acquired, only VH is available in this product';
      default:
        return null;
    }
  }
}