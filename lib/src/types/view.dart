enum View {
  nadir,
  oblique;
  
  String get value {
    switch (this) {
      case View.nadir:
        return 'NADIR';
      case View.oblique:
        return 'OBLIQUE';
    }
  }

  String get description {
    switch (this) {
      case View.nadir:
        return 'The image acquired by the nadir viewing scanner will be selected';
      case View.oblique:
        return 'The image acquired by the oblique (rear) viewing scanner will be selected';
    }
  }
}