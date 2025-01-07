import 'package:copernicus/src/satillite/band.dart';
import 'package:copernicus/src/satillite/satillite.dart';
import 'package:copernicus/src/options/filtering_options.dart';
import 'package:copernicus/src/options/processing_options.dart';

class SatilliteData {
  final Satillite satillite;
  final Map<Band, double> bands;
  final FilteringOptions filteringOptions;
  final ProcessingOptions? processingOptions;

  const SatilliteData({
    required this.satillite, 
    required this.bands,
    required this.filteringOptions, 
    this.processingOptions
  });

  @override
  operator ==(Object other) {
    if (other is SatilliteData) {
      return satillite == other.satillite &&
        bands == other.bands &&
        filteringOptions == other.filteringOptions &&
        processingOptions == other.processingOptions;
    }
    return false;
  }
  
  @override
  int get hashCode => satillite.hashCode ^ bands.hashCode ^ filteringOptions.hashCode ^ processingOptions.hashCode;
}