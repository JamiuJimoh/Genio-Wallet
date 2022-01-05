import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  // 1
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.nunito(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: AppColors.kOnprimaryColor,
    ),
    bodyText2: GoogleFonts.nunito(
      fontSize: 15.0,
      fontWeight: FontWeight.w700,
      color: AppColors.kSubtitleTextColor,
    ),
    subtitle1: GoogleFonts.nunito(
      fontSize: 13.0,
      fontWeight: FontWeight.w700,
      color: AppColors.kSubtitleTextColor,
    ),
    subtitle2: GoogleFonts.nunito(
      fontSize: 11.0,
      fontWeight: FontWeight.w700,
      color: AppColors.kOnsecondaryColor,
    ),
    headline1: GoogleFonts.nunito(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: AppColors.kOnprimaryColor,
    ),
    headline2: GoogleFonts.nunito(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: AppColors.kOnprimaryColor,
    ),
    headline3: GoogleFonts.nunito(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: AppColors.kOnprimaryColor,
    ),
    headline6: GoogleFonts.nunito(
      fontSize: 20.0,
      fontWeight: FontWeight.w800,
      color: AppColors.kOnprimaryColor,
    ),
  );

  // 2
  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.nunito(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    subtitle1: GoogleFonts.nunito(
      fontSize: 11.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline1: GoogleFonts.nunito(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline2: GoogleFonts.nunito(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline3: GoogleFonts.nunito(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline6: GoogleFonts.nunito(
      fontSize: 20.0,
      color: Colors.white,
    ),
  );

  // 3
  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        foregroundColor: AppColors.kPrimaryColor,
        backgroundColor: AppColors.kPrimaryColor,
        elevation: 0.1,
      ),
      colorScheme: const ColorScheme(
        primary: AppColors.kPrimaryColor,
        background: AppColors.kOnprimaryColor,
        brightness: Brightness.light,
        onBackground: AppColors.kOnprimaryColor,
        secondary: AppColors.kSecondaryColor,
        surface: AppColors.kSecondaryColor,
        onPrimary: AppColors.kOnprimaryColor,
        onSurface: AppColors.kOnsecondaryColor,
        onSecondary: AppColors.kOnsecondaryColor,
        error: Colors.red,
        secondaryVariant: AppColors.kAccentColor2,
        onError: AppColors.kOnsecondaryColor,
        primaryVariant: AppColors.kSubtitleTextColor,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        // selectedItemColor:
        selectedIconTheme: IconThemeData(
          color: AppColors.kOnprimaryColor,
        ),
        unselectedIconTheme: IconThemeData(
          color: AppColors.kSubtitleTextColor,
        ),
      ),
      textTheme: lightTextTheme,
    );
  }

  // 4
  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey[900],
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.green,
      ),
      textTheme: darkTextTheme,
    );
  }
}
