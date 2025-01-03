enum CopernicusView {
  nadir,
  oblique;
  
  String get value {
    switch (this) {
      case CopernicusView.nadir:
        return 'NADIR';
      case CopernicusView.oblique:
        return 'OBLIQUE';
    }
  }

  String get description {
    switch (this) {
      case CopernicusView.nadir:
        return 'The image acquired by the nadir viewing scanner will be selected';
      case CopernicusView.oblique:
        return 'The image acquired by the oblique (rear) viewing scanner will be selected';
    }
  }
}