import 'package:copernicus/src/satillite/copernicus_band.dart';

class CopernicusRequestEvalscript {
  final Map<CopernicusBand, double> bands;

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
}