import 'package:copernicus/src/copernicus_enum.dart';

enum CopernicusBackCoefficiency implements CopernicusEnum {
  betaZero,
  sigmaZeroEllipsoid,
  gammaZeroEllipsoid,
  gammaZeroTerrain;
  
  @override
  String get value {
    switch (this) {
      case CopernicusBackCoefficiency.betaZero:
        return 'BETA0';
      case CopernicusBackCoefficiency.sigmaZeroEllipsoid:
        return 'SIGMA0_ELLIPSOID';
      case CopernicusBackCoefficiency.gammaZeroEllipsoid:
        return 'GAMMA0_ELLIPSOID';
      case CopernicusBackCoefficiency.gammaZeroTerrain:
        return 'GAMMA0_TERRAIN';
    }
  }

  String get description {
    switch (this) {
      case CopernicusBackCoefficiency.betaZero:
        return 'Beta Zero';
      case CopernicusBackCoefficiency.sigmaZeroEllipsoid:
        return 'Sigma Zero (Ellipsoid)';
      case CopernicusBackCoefficiency.gammaZeroEllipsoid:
        return 'Gamma Zero (Ellipsoid)';
      case CopernicusBackCoefficiency.gammaZeroTerrain:
        return 'Gamma Zero (Terrain)';
    }
  }

  static CopernicusBackCoefficiency get defaultOption => CopernicusBackCoefficiency.gammaZeroEllipsoid;
}