import 'package:copernicus/src/request/copernicus_request_data.dart';
import 'package:copernicus/src/request/copernicus_request_evalscript.dart';
import 'package:copernicus/src/request/copernicus_request_input.dart';
import 'package:copernicus/src/request/copernicus_request_output.dart';
import 'package:copernicus/src/satillite/band.dart';

class CopernicusRequest {
  final CopernicusRequestInput input;
  final CopernicusRequestOutput output;
  final CopernicusRequestEvalscript evalscript;

  CopernicusRequest({
    required this.input, 
    required this.output,
    required this.evalscript
  }) {
    for (final data in input.data) {
      data.validate();
    }
  }

  factory CopernicusRequest.create({
    required List<num> bbox,
    required List<CopernicusRequestData> data,
    String crs = 'http://www.opengis.net/def/crs/EPSG/0/4326',
    Map<Band, double> bands = const {
      Band.s2b04: 2.5,
      Band.s2b03: 2.5,
      Band.s2b02: 2.5
    },
    int width = 512,
    int height = 512,
  }) {
    return CopernicusRequest(
      input: CopernicusRequestInput(
        bbox: bbox,
        crs: crs,
        data: data
      ),
      output: CopernicusRequestOutput(
        width: width,
        height: height
      ),
      evalscript: CopernicusRequestEvalscript(bands)
    );
  }

  Map<String, dynamic> get map {
    return {
      'input': input.map,
      'output': output.map,
      'evalscript': evalscript.toString()
    };
  }

  @override
  operator ==(Object other) {
    if (other is CopernicusRequest) {
      return input == other.input &&
        output == other.output &&
        evalscript == other.evalscript;
    }
    return false;
  }

  @override
  int get hashCode => input.hashCode ^ output.hashCode ^ evalscript.hashCode;
}