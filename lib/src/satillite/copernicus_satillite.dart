import 'package:copernicus/src/copernicus_enum.dart';
import 'package:copernicus/src/satillite/copernicus_band.dart';

enum CopernicusSatillite implements CopernicusEnum{
  s1grd,
  s2l1c,
  s2l2a,
  s3olcil1b,
  s3olcil2,
  s3slstr,
  s5pl2,
  dem,
  datafusion;

  @override
  String get value {
    switch (this) {
      case CopernicusSatillite.s1grd:
        return 'sentinel-1-grd';
      case CopernicusSatillite.s2l1c:
        return 'sentinel-2-l1c';
      case CopernicusSatillite.s2l2a:
        return 'sentinel-2-l2a';
      case CopernicusSatillite.s3olcil1b:
        return 'sentinel-3-olci';
      case CopernicusSatillite.s3olcil2:
        return 'sentinel-3-olci';
      case CopernicusSatillite.s3slstr:
        return 'sentinel-3-slstr';
      case CopernicusSatillite.s5pl2:
        return 'sentinel-5p-l2';
      case CopernicusSatillite.dem:
        return 'dem';
      case CopernicusSatillite.datafusion:
        return 'datafusion';
    }
  }

  List<CopernicusBand> get bands {
    switch (this) {
      case CopernicusSatillite.s1grd:
        return [
          CopernicusBand.vv,
          CopernicusBand.vh,
          CopernicusBand.hv,
          CopernicusBand.hh,
          CopernicusBand.localIncidenceAngle,
          CopernicusBand.scatteringArea,
          CopernicusBand.shadowMask,
          CopernicusBand.dataMask
        ];
      case CopernicusSatillite.s2l1c:
        return [
          CopernicusBand.s2b01,
          CopernicusBand.s2b02,
          CopernicusBand.s2b03,
          CopernicusBand.s2b04,
          CopernicusBand.s2b05,
          CopernicusBand.s2b06,
          CopernicusBand.s2b07,
          CopernicusBand.s2b08,
          CopernicusBand.s2b8a,
          CopernicusBand.s2b09,
          CopernicusBand.s2b10,
          CopernicusBand.s2b11,
          CopernicusBand.s2b12,
          CopernicusBand.sunAzimuthAngles, 
          CopernicusBand.sunZenithAngles, 
          CopernicusBand.viewAzimuthMean, 
          CopernicusBand.viewZenithMean, 
          CopernicusBand.dataMask
        ];
      case CopernicusSatillite.s2l2a:
        return [
          CopernicusBand.s2b01,
          CopernicusBand.s2b02,
          CopernicusBand.s2b03,
          CopernicusBand.s2b04,
          CopernicusBand.s2b05,
          CopernicusBand.s2b06,
          CopernicusBand.s2b07,
          CopernicusBand.s2b08,
          CopernicusBand.s2b8a,
          CopernicusBand.s2b09,
          CopernicusBand.s2b10,
          CopernicusBand.s2b11,
          CopernicusBand.s2b12,
          CopernicusBand.aot,
          CopernicusBand.scl,
          CopernicusBand.snw,
          CopernicusBand.cld,
          CopernicusBand.sunAzimuthAngles, 
          CopernicusBand.sunZenithAngles, 
          CopernicusBand.viewAzimuthMean, 
          CopernicusBand.viewZenithMean, 
          CopernicusBand.dataMask
        ];
      case CopernicusSatillite.s3olcil1b:
      case CopernicusSatillite.s3olcil2:
        return [
          CopernicusBand.s3b01,
          CopernicusBand.s3b02,
          CopernicusBand.s3b03,
          CopernicusBand.s3b04,
          CopernicusBand.s3b05,
          CopernicusBand.s3b06,
          CopernicusBand.s3b07,
          CopernicusBand.s3b08,
          CopernicusBand.s3b09,
          CopernicusBand.s3b10,
          CopernicusBand.s3b11,
          CopernicusBand.s3b12,
          CopernicusBand.s3b13,
          CopernicusBand.s3b14,
          CopernicusBand.s3b15,
          CopernicusBand.s3b16,
          CopernicusBand.s3b17,
          CopernicusBand.s3b18,
          CopernicusBand.s3b19,
          CopernicusBand.s3b20,
          CopernicusBand.s3b21,
          CopernicusBand.qualityFlags,
          CopernicusBand.saa,
          CopernicusBand.sza,
          CopernicusBand.vaa,
          CopernicusBand.vza,
          CopernicusBand.humidity,
          CopernicusBand.seaLevelPressure,
          CopernicusBand.totalColumnOzone,
          CopernicusBand.totalColumnWaterVapour,
          CopernicusBand.dataMask
        ];
      case CopernicusSatillite.s3slstr:
        return [
          CopernicusBand.s1,
          CopernicusBand.s2,
          CopernicusBand.s3,
          CopernicusBand.s4,
          CopernicusBand.s5,
          CopernicusBand.s6,
          CopernicusBand.s7,
          CopernicusBand.s8,
          CopernicusBand.s9,
          CopernicusBand.f1,
          CopernicusBand.f2,
          CopernicusBand.dataMask
        ];
      case CopernicusSatillite.s5pl2:
        return [
          CopernicusBand.co,
          CopernicusBand.hcho,
          CopernicusBand.no2,
          CopernicusBand.o3,
          CopernicusBand.so2,
          CopernicusBand.ch4,
          CopernicusBand.aerAi340380,
          CopernicusBand.aerAi354388,
          CopernicusBand.cloudBasePressure,
          CopernicusBand.cloudTopPressure,
          CopernicusBand.cloudBaseHeight,
          CopernicusBand.cloudTopHeight,
          CopernicusBand.cloudOpticalThickness,
          CopernicusBand.cloudFraction,
          CopernicusBand.dataMask
        ];
      case CopernicusSatillite.dem:
        return [
          CopernicusBand.dem,
          CopernicusBand.dataMask
        ];
      case CopernicusSatillite.datafusion:
        return [];
    }
  }
}