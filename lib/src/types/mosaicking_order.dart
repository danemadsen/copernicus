enum MosaickingOrder {
  mostRecent,
  leastRecent,
  leastCC;
  
  String get value {
    switch (this) {
      case MosaickingOrder.mostRecent:
        return 'mostRecent';
      case MosaickingOrder.leastRecent:
        return 'leastRecent';
      case MosaickingOrder.leastCC:
        return 'leastCC';
    }
  }

  String get description {
    switch (this) {
      case MosaickingOrder.mostRecent:
        return 'selected by default. The pixel will be selected from the tile, which was acquired most recently';
      case MosaickingOrder.leastRecent:
        return 'similar to mostRecent but in reverse order';
      case MosaickingOrder.leastCC:
        return 'pixel is selected from tile with the least cloud coverage metadata';
    }
  }

  String? get notes {
    switch (this) {
      case MosaickingOrder.mostRecent:
        return 'In case there are more tiles available with the same timestamp (some tiles are processed by many ground stations, some are reprocessed, etc.), the one, which was downloaded from SciHub later will be used.';
      case MosaickingOrder.leastCC:
        return 'Note that "per tile" information is used here, each covering about a 12,000 sq. km area, so this information is only an estimate.';
      default:
        return null;
    }
  }
}