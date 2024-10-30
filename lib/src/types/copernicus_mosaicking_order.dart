import 'package:copernicus/src/types/copernicus_enum.dart';

enum CopernicusMosaickingOrder implements CopernicusEnum {
  mostRecent,
  leastRecent,
  leastCC;
  
  @override
  String get value {
    switch (this) {
      case CopernicusMosaickingOrder.mostRecent:
        return 'mostRecent';
      case CopernicusMosaickingOrder.leastRecent:
        return 'leastRecent';
      case CopernicusMosaickingOrder.leastCC:
        return 'leastCC';
    }
  }

  String get description {
    switch (this) {
      case CopernicusMosaickingOrder.mostRecent:
        return 'selected by default. The pixel will be selected from the tile, which was acquired most recently';
      case CopernicusMosaickingOrder.leastRecent:
        return 'similar to mostRecent but in reverse order';
      case CopernicusMosaickingOrder.leastCC:
        return 'pixel is selected from tile with the least cloud coverage metadata';
    }
  }

  String? get notes {
    switch (this) {
      case CopernicusMosaickingOrder.mostRecent:
        return 'In case there are more tiles available with the same timestamp (some tiles are processed by many ground stations, some are reprocessed, etc.), the one, which was downloaded from SciHub later will be used.';
      case CopernicusMosaickingOrder.leastCC:
        return 'Note that "per tile" information is used here, each covering about a 12,000 sq. km area, so this information is only an estimate.';
      default:
        return null;
    }
  }
}