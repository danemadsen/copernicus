import 'package:copernicus/src/satillite/copernicus_satillite.dart';
import 'package:copernicus/src/copernicus_filtering_options.dart';
import 'package:copernicus/src/copernicus_processing_options.dart';
import 'package:copernicus/src/satillite/copernicus_satillite_data.dart';

class CopernicusRequestData {
  final CopernicusSatillite satillite;
  final CopernicusFilteringOptions filteringOptions;
  final CopernicusProcessingOptions? processingOptions;

  const CopernicusRequestData({
    required this.satillite, 
    required this.filteringOptions, 
    this.processingOptions
  });

  factory CopernicusRequestData.fromSatilliteData(CopernicusSatilliteData data) {
    return CopernicusRequestData(
      satillite: data.satillite,
      filteringOptions: data.filteringOptions,
      processingOptions: data.processingOptions
    );
  }

  Map<String, dynamic> get map {
    Map<String, dynamic> map = {
      'type': satillite.value,
      'dataFilter': filteringOptions.map
    };

    if (processingOptions != null) {
      map['processing'] = processingOptions!.map;
    }

    return map;
  }
}