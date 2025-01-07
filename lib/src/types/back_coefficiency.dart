enum BackCoefficiency {
  betaZero,
  sigmaZeroEllipsoid,
  gammaZeroEllipsoid,
  gammaZeroTerrain;
  
  String get value {
    switch (this) {
      case BackCoefficiency.betaZero:
        return 'BETA0';
      case BackCoefficiency.sigmaZeroEllipsoid:
        return 'SIGMA0_ELLIPSOID';
      case BackCoefficiency.gammaZeroEllipsoid:
        return 'GAMMA0_ELLIPSOID';
      case BackCoefficiency.gammaZeroTerrain:
        return 'GAMMA0_TERRAIN';
    }
  }

  String get description {
    switch (this) {
      case BackCoefficiency.betaZero:
        return 'Beta Zero';
      case BackCoefficiency.sigmaZeroEllipsoid:
        return 'Sigma Zero (Ellipsoid)';
      case BackCoefficiency.gammaZeroEllipsoid:
        return 'Gamma Zero (Ellipsoid)';
      case BackCoefficiency.gammaZeroTerrain:
        return 'Gamma Zero (Terrain)';
    }
  }

  static BackCoefficiency get defaultOption => BackCoefficiency.gammaZeroEllipsoid;
}