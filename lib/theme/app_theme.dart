import 'package:flutter/material.dart';

/// Colour tokens. Change them here and the whole site follows.
class AppColors {
  AppColors._();

  static const midnight = Color(0xFF0C1220); // page background
  static const surface = Color(0xFF131B2E); // cards, raised areas
  static const line = Color(0xFF243049); // borders and dividers
  static const text = Color(0xFFE9EEF7); // primary text
  static const muted = Color(0xFF9BA8C0); // secondary text
  static const accent = Color(0xFF54C5F8); // Flutter light blue
  static const accentSoft = Color(0x2954C5F8); // tinted backgrounds
  static const selection = Color(0x6654C5F8); // text selection highlight
}

class AppTheme {
  AppTheme._();

  /// One family for the whole site. To swap the font, change this name and
  /// the family in pubspec.yaml.
  static const fontFamily = 'Inter';

  static ThemeData get dark {
    final scheme = ColorScheme.dark(
      primary: AppColors.accent,
      onPrimary: AppColors.midnight,
      surface: AppColors.midnight,
      onSurface: AppColors.text,
      outline: AppColors.line,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: scheme,
      scaffoldBackgroundColor: AppColors.midnight,
      fontFamily: fontFamily,
      textTheme: _textTheme,
      dividerColor: AppColors.line,
      splashFactory: NoSplash.splashFactory,
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: AppColors.selection,
        cursorColor: AppColors.accent,
      ),
    );
  }

  // Type scale: tight tracking on large sizes, relaxed line height on body
  // text. Body line length is capped by the layout (about 70 characters).
  static const TextTheme _textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 72,
      height: 1.02,
      fontWeight: FontWeight.w700,
      letterSpacing: -2.5,
      color: AppColors.text,
    ),
    displayMedium: TextStyle(
      fontSize: 52,
      height: 1.05,
      fontWeight: FontWeight.w700,
      letterSpacing: -1.8,
      color: AppColors.text,
    ),
    headlineMedium: TextStyle(
      fontSize: 34,
      height: 1.15,
      fontWeight: FontWeight.w700,
      letterSpacing: -1,
      color: AppColors.text,
    ),
    headlineSmall: TextStyle(
      fontSize: 26,
      height: 1.2,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.6,
      color: AppColors.text,
    ),
    titleLarge: TextStyle(
      fontSize: 21,
      height: 1.3,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.3,
      color: AppColors.text,
    ),
    titleMedium: TextStyle(
      fontSize: 17,
      height: 1.35,
      fontWeight: FontWeight.w600,
      color: AppColors.text,
    ),
    bodyLarge: TextStyle(
      fontSize: 18,
      height: 1.65,
      fontWeight: FontWeight.w400,
      color: AppColors.text,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      height: 1.6,
      fontWeight: FontWeight.w400,
      color: AppColors.text,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      height: 1.5,
      fontWeight: FontWeight.w400,
      color: AppColors.muted,
    ),
    labelLarge: TextStyle(
      fontSize: 15,
      height: 1.2,
      fontWeight: FontWeight.w600,
      color: AppColors.text,
    ),
  );
}
