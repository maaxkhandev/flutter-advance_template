import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

final ThemeData baseLigth = ThemeData.light(useMaterial3: true);
final ThemeData baseDark = ThemeData.dark(
  useMaterial3: true,
);

ColorScheme colorSchemeLight = ColorScheme.fromSeed(
    seedColor: Colors.blue,
    brightness: Brightness.light,
    primary: AppColors.primaryColor);
ColorScheme colorSchemeDark = ColorScheme.fromSeed(
  seedColor: AppColors.primaryColor,
  brightness: Brightness.dark,
);

ThemeData lightTheme() {
  return baseLigth.copyWith(
    brightness: Brightness.light,
    colorScheme: colorSchemeLight.copyWith(
      brightness: Brightness.light,
      background: AppColors.lightThemeBackground,
      surface: baseLigth.colorScheme.background,
    ),
    textTheme: GoogleFonts.getTextTheme(
      'Ubuntu',
      baseLigth.textTheme,
    ).copyWith(
        labelLarge: const TextStyle(color: Colors.grey),
        labelMedium: const TextStyle(color: Colors.grey),
        labelSmall: const TextStyle(color: Colors.grey)),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightThemeBackground,
      foregroundColor: baseLigth.colorScheme.onSurface,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
    ),
    primaryColor: AppColors.primaryColor,
    canvasColor: Colors.black,
    scaffoldBackgroundColor: AppColors.lightThemeBackground,
    cardTheme: baseLigth.cardTheme.copyWith(
      color: AppColors.lightThemeBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      shadowColor: Colors.transparent,
    ),
    bottomSheetTheme: baseLigth.bottomSheetTheme.copyWith(
      backgroundColor: AppColors.lightThemeBackground,
    ),
    navigationRailTheme: baseLigth.navigationRailTheme.copyWith(
      backgroundColor: AppColors.lightThemeBackground,
    ),
    navigationBarTheme: baseLigth.navigationBarTheme.copyWith(
      backgroundColor: AppColors.lightThemeBackground,
      labelTextStyle: MaterialStateProperty.all(
        const TextStyle(overflow: TextOverflow.ellipsis, fontSize: 12),
      ),
    ),
    inputDecorationTheme: baseLigth.inputDecorationTheme.copyWith(
      labelStyle: MaterialStateTextStyle.resolveWith(
        (Set<MaterialState> states) {
          return const TextStyle(fontSize: 14);
        },
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          color: baseLigth.disabledColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          color: baseLigth.disabledColor,
        ),
      ),
    ),
  );
}

ThemeData darkTheme() {
  return baseDark.copyWith(
    brightness: Brightness.dark,
    colorScheme: colorSchemeDark.copyWith(
      brightness: Brightness.dark,
      background: AppColors.darkThemeBackground,
      surface: baseDark.colorScheme.background,
    ),
    textTheme: GoogleFonts.getTextTheme('Arimo', baseDark.textTheme).copyWith(
        labelLarge: const TextStyle(color: Colors.grey),
        labelMedium: const TextStyle(color: Colors.grey),
        labelSmall: const TextStyle(color: Colors.grey)),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkThemeBackground,
      foregroundColor: Colors.white,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
    ),
    dividerColor: AppColors.primaryColor,
    dividerTheme: baseDark.dividerTheme.copyWith(thickness: 2),
    primaryColor: AppColors.primaryColor,
    canvasColor: Colors.white,
    scaffoldBackgroundColor: AppColors.darkThemeBackground,
    cardTheme: baseDark.cardTheme.copyWith(
      color: AppColors.containerBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      shadowColor: Colors.transparent,
    ),
    bottomSheetTheme: baseDark.bottomSheetTheme.copyWith(
      backgroundColor: AppColors.darkThemeBackground,
    ),
    navigationRailTheme: baseDark.navigationRailTheme.copyWith(
      backgroundColor: AppColors.darkThemeBackground,
    ),
    navigationBarTheme: baseDark.navigationBarTheme.copyWith(
      backgroundColor: AppColors.darkThemeBackground,
      labelTextStyle: MaterialStateProperty.all(
        const TextStyle(overflow: TextOverflow.ellipsis, fontSize: 12),
      ),
    ),
    inputDecorationTheme: baseDark.inputDecorationTheme.copyWith(
      labelStyle: MaterialStateTextStyle.resolveWith(
        (Set<MaterialState> states) {
          return const TextStyle(fontSize: 14);
        },
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
    ),
  );
}
