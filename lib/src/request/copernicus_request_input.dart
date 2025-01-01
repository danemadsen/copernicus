import 'package:copernicus/src/request/copernicus_request_data.dart';

class CopernicusRequestInput {
  final List<num> bbox;
  final String crs;
  final List<CopernicusRequestData> data;

  CopernicusRequestInput({
    required this.bbox, 
    this.crs = 'http://www.opengis.net/def/crs/EPSG/0/4326', 
    required this.data
  });

  Map<String, dynamic> get map {
    return {
      'bounds': {
        'bbox': bbox,
        'properties': {
          'crs': crs
        }
      },
      'data': data.map((requestData) => requestData.map).toList()
    };
  }

  @override
  operator ==(Object other) {
    if (other is CopernicusRequestInput) {
      return bbox == other.bbox &&
        crs == other.crs &&
        data == other.data;
    }
    return false;
  }

  @override
  int get hashCode => bbox.hashCode ^ crs.hashCode ^ data.hashCode;
}