class CopernicusRequestOutput {
  final int width;
  final int height;

  CopernicusRequestOutput({
    required this.width,
    required this.height
  });

  Map<String, dynamic> get map {
    return {
      'width': width,
      'height': height,
      'responses': [
        {
          'format': {
            'type': 'image/png'
          }
        }
      ]
    };
  }

  @override
  operator ==(Object other) {
    if (other is CopernicusRequestOutput) {
      return width == other.width &&
        height == other.height;
    }
    return false;
  }

  @override
  int get hashCode => width.hashCode ^ height.hashCode;
}