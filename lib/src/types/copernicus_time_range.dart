class CopernicusTimeRange {
  final DateTime to;
  final DateTime from;

  const CopernicusTimeRange({
    required this.to,
    required this.from,
  });

  Map<String, String> get map {
    return {
      'from': from.toUtc().toIso8601String(),
      'to': to.toUtc().toIso8601String(),
    };
  }

  String get value {
    return 'From: ${from.toUtc().toIso8601String()}, To: ${to.toUtc().toIso8601String()}';
  }
}