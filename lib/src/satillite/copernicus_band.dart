enum CopernicusBand {
  // DEM Band
  dem,

  // Sentinel 1 Bands
  vv,
  vh,
  hh,
  hv,
  localIncidenceAngle,
  scatteringArea,
  shadowMask,
  dataMask,

  // Sentinel 2 L1C Bands
  s2b01,
  s2b02,
  s2b03,
  s2b04,
  s2b05,
  s2b06,
  s2b07,
  s2b08,
  s2b8a,
  s2b09,
  s2b10,
  s2b11,
  s2b12,
  sunAzimuthAngles, 
  sunZenithAngles, 
  viewAzimuthMean, 
  viewZenithMean, 
  // dataMask

  // Sentinel 2 L2A Bands
  // As Above
  aot,
  scl,
  snw,
  cld,

  // Sentinel 3 OLCI L1B Bands
  s3b01,
  s3b02,
  s3b03,
  s3b04,
  s3b05,
  s3b06,
  s3b07,
  s3b08,
  s3b09,
  s3b10,
  s3b11,
  s3b12,
  s3b13,
  s3b14,
  s3b15,
  s3b16,
  s3b17,
  s3b18,
  s3b19,
  s3b20,
  s3b21,
  qualityFlags,
  saa,
  sza,
  vaa,
  vza,
  humidity,
  seaLevelPressure,
  totalColumnOzone,
  totalColumnWaterVapour,
  // dataMask

  // Sentinel 3 OLCI L2 Bands
  // As Above

  // Sentinel 3 SLSTR Bands
  s1,
  s2,
  s3,
  s4,
  s5,
  s6,
  s7,
  s8,
  s9,
  f1,
  f2,
  // dataMask

  // Sentinel 5PL2 Bands
  co,
  hcho,
  no2,
  o3,
  so2,
  ch4,
  aerAi340380,
  aerAi354388,
  cloudBasePressure,
  cloudTopPressure,
  cloudBaseHeight,
  cloudTopHeight,
  cloudOpticalThickness,
  cloudFraction;
  // dataMask

  String get value {
    switch (this) {
      case CopernicusBand.dem:
        return 'DEM';
      case CopernicusBand.vv:
        return 'VV';
      case CopernicusBand.vh:
        return 'VH';
      case CopernicusBand.hh:
        return 'HH';
      case CopernicusBand.hv:
        return 'HV';
      case CopernicusBand.localIncidenceAngle:
        return 'localIncidenceAngle';
      case CopernicusBand.scatteringArea:
        return 'scatteringArea';
      case CopernicusBand.shadowMask:
        return 'shadowMask';
      case CopernicusBand.dataMask:
        return 'dataMask';
      case CopernicusBand.s2b01:
      case CopernicusBand.s3b01:
        return 'B01';
      case CopernicusBand.s2b02:
      case CopernicusBand.s3b02:
        return 'B02';
      case CopernicusBand.s2b03:
      case CopernicusBand.s3b03:
        return 'B03';
      case CopernicusBand.s2b04:
      case CopernicusBand.s3b04:
        return 'B04';
      case CopernicusBand.s2b05:
      case CopernicusBand.s3b05:
        return 'B05';
      case CopernicusBand.s2b06:
      case CopernicusBand.s3b06:
        return 'B06';
      case CopernicusBand.s2b07:
      case CopernicusBand.s3b07:
        return 'B07';
      case CopernicusBand.s2b08:
      case CopernicusBand.s3b08:
        return 'B08';
      case CopernicusBand.s2b8a:
        return 'B8A';
      case CopernicusBand.s2b09:
      case CopernicusBand.s3b09:
        return 'B09';
      case CopernicusBand.s2b10:
      case CopernicusBand.s3b10:
        return 'B10';
      case CopernicusBand.s2b11:
      case CopernicusBand.s3b11:
        return 'B11';
      case CopernicusBand.s2b12:
      case CopernicusBand.s3b12:
        return 'B12';
      case CopernicusBand.s3b13:
        return 'B13';
      case CopernicusBand.s3b14:
        return 'B14';
      case CopernicusBand.s3b15:
        return 'B15';
      case CopernicusBand.s3b16:
        return 'B16';
      case CopernicusBand.s3b17:
        return 'B17';
      case CopernicusBand.s3b18:
        return 'B18';
      case CopernicusBand.s3b19:
        return 'B19';
      case CopernicusBand.s3b20:
        return 'B20';
      case CopernicusBand.s3b21:
        return 'B21';
      case CopernicusBand.aot:
        return 'AOT';
      case CopernicusBand.scl:
        return 'SCL';
      case CopernicusBand.snw:
        return 'SNW';
      case CopernicusBand.cld:
        return 'CLD';
      case CopernicusBand.sunAzimuthAngles:
        return 'sunAzimuthAngles';
      case CopernicusBand.sunZenithAngles:
        return 'sunZenithAngles';
      case CopernicusBand.viewAzimuthMean:
        return 'viewAzimuthMean';
      case CopernicusBand.viewZenithMean:
        return 'viewZenithMean';
      case CopernicusBand.qualityFlags:
        return 'QUALITY_FLAGS';
      case CopernicusBand.saa:
        return 'SAA';
      case CopernicusBand.sza:
        return 'SZA';
      case CopernicusBand.vaa:
        return 'VAA';
      case CopernicusBand.vza:
        return 'VZA';
      case CopernicusBand.humidity:
        return 'HUMIDITY';
      case CopernicusBand.seaLevelPressure:
        return 'SEA_LEVEL_PRESSURE';
      case CopernicusBand.totalColumnOzone:
        return 'TOTAL_COLUMN_OZONE';
      case CopernicusBand.totalColumnWaterVapour:
        return 'TOTAL_COLUMN_WATER_VAPOUR';
      case CopernicusBand.s1:
        return 'S1';
      case CopernicusBand.s2:
        return 'S2';
      case CopernicusBand.s3:
        return 'S3';
      case CopernicusBand.s4:
        return 'S4';
      case CopernicusBand.s5:
        return 'S5';
      case CopernicusBand.s6:
        return 'S6';
      case CopernicusBand.s7:
        return 'S7';
      case CopernicusBand.s8:
        return 'S8';
      case CopernicusBand.s9:
        return 'S9';
      case CopernicusBand.f1:
        return 'F1';
      case CopernicusBand.f2:
        return 'F2';
      case CopernicusBand.co:
        return 'CO';
      case CopernicusBand.hcho:
        return 'HCHO';
      case CopernicusBand.no2:
        return 'NO2';
      case CopernicusBand.o3:
        return 'O3';
      case CopernicusBand.so2:
        return 'SO2';
      case CopernicusBand.ch4:
        return 'CH4';
      case CopernicusBand.aerAi340380:
        return 'AER_AI_340_380';
      case CopernicusBand.aerAi354388:
        return 'AER_AI_354_388';
      case CopernicusBand.cloudBasePressure:
        return 'CLOUD_BASE_PRESSURE';
      case CopernicusBand.cloudTopPressure:
        return 'CLOUD_TOP_PRESSURE';
      case CopernicusBand.cloudBaseHeight:
        return 'CLOUD_BASE_HEIGHT';
      case CopernicusBand.cloudTopHeight:
        return 'CLOUD_TOP_HEIGHT';
      case CopernicusBand.cloudOpticalThickness:
        return 'CLOUD_OPTICAL_THICKNESS';
      case CopernicusBand.cloudFraction:
        return 'CLOUD_FRACTION';
    }
  }

  String get description {
    switch (this) {
      case CopernicusBand.dem:
        return 'Heights in meters';
      case CopernicusBand.vv:
        return 'Present when the product polarization type is one of SV, DV or VV.';
      case CopernicusBand.vh:
        return 'Present when the product polarization type is VH or DV.';
      case CopernicusBand.hh:
        return 'Present when the product polarization type is HV or DH.';
      case CopernicusBand.hv:
        return 'Present when the product polarization type is one of SH, DH or HH.';
      case CopernicusBand.localIncidenceAngle:
        return 'The local incidence angle for each output pixel. Only available if orthorectification is enabled.';
      case CopernicusBand.scatteringArea:
        return 'The normalized scattering area for each output pixel. Used for conversion of beta0 to terrain corrected gamma0. Only available if radiometric terrain correction is performed.';
      case CopernicusBand.shadowMask:
        return 'Flags output pixels which are in or near radar shadow. Is true if the nearest GRD source pixel is at most one GRD pixel away from a GRD pixel with a scatteringArea of less than 0.05. Only available if radiometric terrain correction is performed.';
      case CopernicusBand.dataMask:
        return 'The mask of data/nodata pixels.';
      case CopernicusBand.s2b01:
        return 'Coastal aerosol, 442.7 nm (S2A), 442.3 nm (S2B)';
      case CopernicusBand.s2b02:
        return 'Blue, 492.4 nm (S2A), 492.1 nm (S2B)';
      case CopernicusBand.s2b03:
        return 'Green, 559.8 nm (S2A), 559.0 nm (S2B)';
      case CopernicusBand.s2b04:
        return 'Red, 664.6 nm (S2A), 665.0 nm (S2B)';
      case CopernicusBand.s2b05:
        return 'Vegetation red edge, 704.1 nm (S2A), 703.8 nm (S2B)';
      case CopernicusBand.s2b06:
        return 'Vegetation red edge, 740.5 nm (S2A), 739.1 nm (S2B)';
      case CopernicusBand.s2b07:
        return 'Vegetation red edge, 782.8 nm (S2A), 779.7 nm (S2B)';
      case CopernicusBand.s2b08:
        return 'NIR, 832.8 nm (S2A), 833.0 nm (S2B)';
      case CopernicusBand.s2b8a:
        return 'Narrow NIR, 864.7 nm (S2A), 864.0 nm (S2B)';
      case CopernicusBand.s2b09:
        return 'Water vapour, 945.1 nm (S2A), 943.2 nm (S2B)';
      case CopernicusBand.s2b10:
        return 'SWIR – Cirrus, 1373.5 nm (S2A), 1376.9 nm (S2B)';
      case CopernicusBand.s2b11:
        return 'SWIR, 1613.7 nm (S2A), 1610.4 nm (S2B)';
      case CopernicusBand.s2b12:
        return 'SWIR, 2202.4 nm (S2A), 2185.7 nm (S2B)';
      case CopernicusBand.aot:
        return 'Aerosol Optical Thickness map, based on Sen2Cor processor';
      case CopernicusBand.scl:
        return 'Scene classification data, based on Sen2Cor processor, codelist';
      case CopernicusBand.snw:
        return 'Snow probability, based on Sen2Cor processor';
      case CopernicusBand.cld:
        return 'Cloud probability, based on Sen2Cor processor';
      case CopernicusBand.sunAzimuthAngles:
        return 'Sun azimuth angle.';
      case CopernicusBand.sunZenithAngles:
        return 'Sun zenith angle.';
      case CopernicusBand.viewAzimuthMean:
        return 'Viewing azimuth angle.';
      case CopernicusBand.viewZenithMean:
        return 'Viewing zenith angle.';
      case CopernicusBand.s3b01:
        return 'Aerosol correction, improved water constituent retrieval, 400 nm';
      case CopernicusBand.s3b02:
        return 'Yellow substance and detrital pigments (turbidity), 412.5 nm';
      case CopernicusBand.s3b03:
        return 'Chlorophyll absorption maximum, biogeochemistry, vegetation, 442.5 nm';
      case CopernicusBand.s3b04:
        return 'Chlorophyll, 490 nm';
      case CopernicusBand.s3b05:
        return 'Chlorophyll, sediment, turbidity, red tide, 510 nm';
      case CopernicusBand.s3b06:
        return 'Chlorophyll reference (minimum), 560 nm';
      case CopernicusBand.s3b07:
        return 'Sediment loading, 620 nm';
      case CopernicusBand.s3b08:
        return '2nd Chlorophyll absorption maximum, sediment, yellow substance / vegetation, 665 nm';
      case CopernicusBand.s3b09:
        return 'Improved fluorescence retrieval, 673.75 nm';
      case CopernicusBand.s3b10:
        return 'Chlorophyll fluorescence peak, red edge, 681.25 nm';
      case CopernicusBand.s3b11:
        return 'Chlorophyll fluorescence baseline, red edge transition, 708.75 nm';
      case CopernicusBand.s3b12:
        return 'O2 absorption / clouds, vegetation, 753.75 nm';
      case CopernicusBand.s3b13:
        return 'O2 absorption / aerosol correction, 761.25 nm';
      case CopernicusBand.s3b14:
        return 'Atmospheric correction, 764.375 nm';
      case CopernicusBand.s3b15:
        return 'O2 absorption used for cloud top pressure, fluorescence over land, 767.5 nm';
      case CopernicusBand.s3b16:
        return 'Atmospheric / aerosol correction, 778.75 nm';
      case CopernicusBand.s3b17:
        return 'Atmospheric / aerosol correction, clouds, pixel co-registration, 865 nm';
      case CopernicusBand.s3b18:
        return 'Water vapour absorption reference. Common reference band with SLSTR. Vegetation monitoring, 885 nm';
      case CopernicusBand.s3b19:
        return 'Water vapour absorption, vegetation monitoring (maximum REFLECTANCE), 900 nm';
      case CopernicusBand.s3b20:
        return 'Water vapour absorption, atmospheric / aerosol correction, 940 nm';
      case CopernicusBand.s3b21:
        return 'Atmospheric / aerosol correction, snow grain size, 1020 nm';
      case CopernicusBand.qualityFlags:
        return 'Classification and quality flags';
      case CopernicusBand.saa:
        return 'Sun azimuth angle';
      case CopernicusBand.sza:
        return 'Sun zenith angle';
      case CopernicusBand.vaa:
        return 'Viewing (observation) azimuth angle';
      case CopernicusBand.vza:
        return 'Viewing (observation) zenith angle';
      case CopernicusBand.humidity:
        return 'Relative humidity (meteo band)';
      case CopernicusBand.seaLevelPressure:
        return 'Mean sea level pressure (meteo band)';
      case CopernicusBand.totalColumnOzone:
        return 'Total column ozone (meteo band)';
      case CopernicusBand.totalColumnWaterVapour:
        return 'Total column water vapour (meteo band)';
      case CopernicusBand.s1:
        return 'Cloud screening, vegetation monitoring, aerosol';
      case CopernicusBand.s2:
        return 'NDVI, vegetation monitoring, aerosol';
      case CopernicusBand.s3:
        return 'NDVI, cloud flagging, pixel co-registration';
      case CopernicusBand.s4:
        return 'Cirrus detection over land';
      case CopernicusBand.s5:
        return 'Cloud clearing, ice, snow, vegetation monitoring';
      case CopernicusBand.s6:
        return 'Vegetation state and cloud clearing';
      case CopernicusBand.s7:
        return 'SST, LST, Active fire';
      case CopernicusBand.s8:
        return 'SST, LST, Active fire';
      case CopernicusBand.s9:
        return 'SST, LST';
      case CopernicusBand.f1:
        return 'Active fire';
      case CopernicusBand.f2:
        return 'Active fire';
      case CopernicusBand.co:
        return 'Carbon monoxide';
      case CopernicusBand.hcho:
        return 'Formaldehyde';
      case CopernicusBand.no2:
        return 'Nitrogen oxide';
      case CopernicusBand.o3:
        return 'Ozone';
      case CopernicusBand.so2:
        return 'Sulphur dioxide';
      case CopernicusBand.ch4:
        return 'Methane';
      case CopernicusBand.aerAi340380:
        return 'UV (Ultraviolet) Aerosol Index calculated based on wavelengths of 340 nm and 380 nm';
      case CopernicusBand.aerAi354388:
        return 'UV (Ultraviolet) Aerosol Index calculated based on wavelengths of 354 nm and 388 nm';
      case CopernicusBand.cloudBasePressure:
        return 'Cloud base pressure';
      case CopernicusBand.cloudTopPressure:
        return 'Cloud top pressure';
      case CopernicusBand.cloudBaseHeight:
        return 'Cloud base height';
      case CopernicusBand.cloudTopHeight:
        return 'Cloud top height';
      case CopernicusBand.cloudOpticalThickness:
        return 'Cloud optical thickness';
      case CopernicusBand.cloudFraction:
        return 'Effective radiometric cloud fraction';
    }
  }
}

extension CopernicusBandMap on Map<CopernicusBand, double> {
  Map<String, double> stringMap() {
    return map((key, value) => MapEntry(key.value, value));
  }
}