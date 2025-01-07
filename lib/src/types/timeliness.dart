enum Timeliness {
  nrt10m,
  nrt1h,
  nrt3h,
  fast24h,
  offline,
  reprocessing,
  archNormal;
  
  String get value {
    switch (this) {
      case Timeliness.nrt10m:
        return 'NRT10m';
      case Timeliness.nrt1h: 
        return 'NRT1h';
      case Timeliness.nrt3h:
        return 'NRT3h';
      case Timeliness.fast24h:
        return 'Fast24h';
      case Timeliness.offline:
        return 'Offline';
      case Timeliness.reprocessing:
        return 'Reprocessing';
      case Timeliness.archNormal:
        return 'ArchNormal'; 
    }
  }

  Duration get duration {
    switch (this) {
      case Timeliness.nrt10m:
        return const Duration(minutes: 10);
      case Timeliness.nrt1h:
        return const Duration(hours: 1);
      case Timeliness.nrt3h:
        return const Duration(hours: 3);
      case Timeliness.fast24h:
        return const Duration(hours: 24);
      default:
        return const Duration();
    }
  }
}