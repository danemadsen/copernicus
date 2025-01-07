import 'package:copernicus/src/satillite/band.dart';

enum Satillite {
  s1grd,
  s2l1c,
  s2l2a,
  s3olcil1b,
  s3olcil2,
  s3slstr,
  s5pl2,
  dem,
  datafusion;

  String get value {
    switch (this) {
      case Satillite.s1grd:
        return 'sentinel-1-grd';
      case Satillite.s2l1c:
        return 'sentinel-2-l1c';
      case Satillite.s2l2a:
        return 'sentinel-2-l2a';
      case Satillite.s3olcil1b:
        return 'sentinel-3-olci';
      case Satillite.s3olcil2:
        return 'sentinel-3-olci';
      case Satillite.s3slstr:
        return 'sentinel-3-slstr';
      case Satillite.s5pl2:
        return 'sentinel-5p-l2';
      case Satillite.dem:
        return 'dem';
      case Satillite.datafusion:
        return 'datafusion';
    }
  }

  List<Band> get bands {
    switch (this) {
      case Satillite.s1grd:
        return [
          Band.vv,
          Band.vh,
          Band.hv,
          Band.hh,
          Band.localIncidenceAngle,
          Band.scatteringArea,
          Band.shadowMask,
          Band.dataMask
        ];
      case Satillite.s2l1c:
        return [
          Band.s2b01,
          Band.s2b02,
          Band.s2b03,
          Band.s2b04,
          Band.s2b05,
          Band.s2b06,
          Band.s2b07,
          Band.s2b08,
          Band.s2b8a,
          Band.s2b09,
          Band.s2b10,
          Band.s2b11,
          Band.s2b12,
          Band.sunAzimuthAngles, 
          Band.sunZenithAngles, 
          Band.viewAzimuthMean, 
          Band.viewZenithMean, 
          Band.dataMask
        ];
      case Satillite.s2l2a:
        return [
          Band.s2b01,
          Band.s2b02,
          Band.s2b03,
          Band.s2b04,
          Band.s2b05,
          Band.s2b06,
          Band.s2b07,
          Band.s2b08,
          Band.s2b8a,
          Band.s2b09,
          Band.s2b10,
          Band.s2b11,
          Band.s2b12,
          Band.aot,
          Band.scl,
          Band.snw,
          Band.cld,
          Band.sunAzimuthAngles, 
          Band.sunZenithAngles, 
          Band.viewAzimuthMean, 
          Band.viewZenithMean, 
          Band.dataMask
        ];
      case Satillite.s3olcil1b:
      case Satillite.s3olcil2:
        return [
          Band.s3b01,
          Band.s3b02,
          Band.s3b03,
          Band.s3b04,
          Band.s3b05,
          Band.s3b06,
          Band.s3b07,
          Band.s3b08,
          Band.s3b09,
          Band.s3b10,
          Band.s3b11,
          Band.s3b12,
          Band.s3b13,
          Band.s3b14,
          Band.s3b15,
          Band.s3b16,
          Band.s3b17,
          Band.s3b18,
          Band.s3b19,
          Band.s3b20,
          Band.s3b21,
          Band.qualityFlags,
          Band.saa,
          Band.sza,
          Band.vaa,
          Band.vza,
          Band.humidity,
          Band.seaLevelPressure,
          Band.totalColumnOzone,
          Band.totalColumnWaterVapour,
          Band.dataMask
        ];
      case Satillite.s3slstr:
        return [
          Band.s1,
          Band.s2,
          Band.s3,
          Band.s4,
          Band.s5,
          Band.s6,
          Band.s7,
          Band.s8,
          Band.s9,
          Band.f1,
          Band.f2,
          Band.dataMask
        ];
      case Satillite.s5pl2:
        return [
          Band.co,
          Band.hcho,
          Band.no2,
          Band.o3,
          Band.so2,
          Band.ch4,
          Band.aerAi340380,
          Band.aerAi354388,
          Band.cloudBasePressure,
          Band.cloudTopPressure,
          Band.cloudBaseHeight,
          Band.cloudTopHeight,
          Band.cloudOpticalThickness,
          Band.cloudFraction,
          Band.dataMask
        ];
      case Satillite.dem:
        return [
          Band.dem,
          Band.dataMask
        ];
      case Satillite.datafusion:
        return [];
    }
  }
}