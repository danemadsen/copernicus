import 'package:copernicus/src/satillite/satillite.dart';
import 'package:copernicus/src/options/filtering_options.dart';
import 'package:copernicus/src/options/processing_options.dart';
import 'package:copernicus/src/satillite/satillite_data.dart';

class CopernicusRequestData {
  final Satillite satillite;
  final FilteringOptions filteringOptions;
  final ProcessingOptions? processingOptions;

  const CopernicusRequestData({
    required this.satillite, 
    required this.filteringOptions, 
    this.processingOptions
  });

  factory CopernicusRequestData.fromSatilliteData(SatilliteData data) {
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

  void validate() {
    filteringOptions.validate(satillite);
    processingOptions?.validate(satillite);
  }

  @override
  operator ==(Object other) {
    if (other is CopernicusRequestData) {
      return satillite == other.satillite &&
        filteringOptions == other.filteringOptions &&
        processingOptions == other.processingOptions;
    }
    return false;
  }

  @override
  int get hashCode => satillite.hashCode ^ filteringOptions.hashCode ^ processingOptions.hashCode;
}