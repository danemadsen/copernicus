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
}