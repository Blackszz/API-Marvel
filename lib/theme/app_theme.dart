import 'package:flutter/material.dart';

class AppTheme {
  // PALETTE
  static const Color primaryRed = Color(0xFFED1D24);
  static const Color primaryDarkRed = Color(0xFFB71C1C);
  static const Color backgroundBlack = Color(0xFF0D0D0D);
  static const Color surfaceBlack = Color(0xFF1A1A1A);
  static const Color textWhite = Colors.white;
  static const Color textLightGray = Color(0xFFCCCCCC);
  static const Color borderGray = Color(0xFF262626);

  // FONTS
  static const TextStyle headlineText = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: textWhite,
    fontFamily: 'Inter',
  );

  static const TextStyle sectionHeaderText = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
    color: textWhite,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
    color: textLightGray,
  );

  static const TextStyle bodyTextBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
    color: textWhite,
  );

  // LIGHT THEME
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryRed,
    scaffoldBackgroundColor: Colors.white,
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryRed,
      foregroundColor: Colors.white,
      elevation: 2,
    ),
    textTheme: const TextTheme(
      headlineLarge: headlineText,
      titleLarge: sectionHeaderText,
      bodyMedium: bodyText,
      bodyLarge: bodyTextBold,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryRed,
      brightness: Brightness.light,
    ),
  );

  // DARK THEME
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryRed,
    scaffoldBackgroundColor: backgroundBlack,
    cardTheme: CardTheme(
      color: surfaceBlack,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      headlineLarge: headlineText,
      titleLarge: sectionHeaderText,
      bodyMedium: bodyText,
      bodyLarge: bodyTextBold,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryRed,
      brightness: Brightness.dark,
    ).copyWith(
      surface: surfaceBlack,
      background: backgroundBlack,
    ),
  );
}