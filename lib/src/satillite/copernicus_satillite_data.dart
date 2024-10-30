import 'package:copernicus/src/satillite/copernicus_band.dart';
import 'package:copernicus/src/satillite/copernicus_satillite.dart';
import 'package:copernicus/src/copernicus_filtering_options.dart';
import 'package:copernicus/src/copernicus_processing_options.dart';

class CopernicusSatilliteData {
  final CopernicusSatillite satillite;
  final Map<CopernicusBand, double> bands;
  final CopernicusFilteringOptions filteringOptions;
  final CopernicusProcessingOptions? processingOptions;

  const CopernicusSatilliteData({
    required this.satillite, 
    required this.bands,
    required this.filteringOptions, 
    this.processingOptions
  });
}