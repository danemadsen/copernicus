import 'package:copernicus/src/satillite/band.dart';

class CopernicusRequestEvalscript {
  final Map<Band, double> bands;

  CopernicusRequestEvalscript(this.bands);

  @override
  String toString() {
    final input = bands.keys.map((band) => '"${band.value}"').join(', ');

    final eval = bands.keys.map((band) => '${bands[band]!} * sample.${band.value}').join(', ');

    return '''
      //VERSION=3
      function setup() {
        return {
          input: [$input],
          output: {
            bands: ${bands.length},
            sampleType: "AUTO"
          },
        }
      }

      function evaluatePixel(sample) {
        return [$eval]
      }
    ''';
  }

  @override
  operator ==(Object other) {
    if (other is CopernicusRequestEvalscript) {
      return bands == other.bands;
    }
    return false;
  }

  @override
  int get hashCode => bands.hashCode;
}