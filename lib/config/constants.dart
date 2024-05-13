class Constants {
  // Sizes and Spacings
  static const double defaultSpacingH = 20.0;
  static const double defaultSpacingV = 20.0;
  static const double defaultSpacing = 20.0;
  static const double bordersSize = 1;
  static const double bordersRadius = 10;
  static const isProduction = false;

  // // Urls
  static const String apiBaseUrlDev = 'https://xyz/api';
  static const String apiBaseUrlProd = 'https://xyz/api';

  static String get apiBaseUrl => isProduction ? apiBaseUrlProd : apiBaseUrlDev;
}
