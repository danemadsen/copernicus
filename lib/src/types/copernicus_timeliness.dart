enum CopernicusTimeliness {
  nrt10m,
  nrt1h,
  nrt3h,
  fast24h,
  offline,
  reprocessing,
  archNormal;
  
  String get value {
    switch (this) {
      case CopernicusTimeliness.nrt10m:
        return 'NRT10m';
      case CopernicusTimeliness.nrt1h: 
        return 'NRT1h';
      case CopernicusTimeliness.nrt3h:
        return 'NRT3h';
      case CopernicusTimeliness.fast24h:
        return 'Fast24h';
      case CopernicusTimeliness.offline:
        return 'Offline';
      case CopernicusTimeliness.reprocessing:
        return 'Reprocessing';
      case CopernicusTimeliness.archNormal:
        return 'ArchNormal'; 
    }
  }

  Duration get duration {
    switch (this) {
      case CopernicusTimeliness.nrt10m:
        return const Duration(minutes: 10);
      case CopernicusTimeliness.nrt1h:
        return const Duration(hours: 1);
      case CopernicusTimeliness.nrt3h:
        return const Duration(hours: 3);
      case CopernicusTimeliness.fast24h:
        return const Duration(hours: 24);
      default:
        return const Duration();
    }
  }
}