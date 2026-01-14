import 'package:flutter/material.dart';

sealed class AppTypographyPrimitives {
  static const TextStyle _h1 = TextStyle(fontSize: 36, fontWeight: FontWeight.w600, letterSpacing: -0.72);
  static const TextStyle _h2 = TextStyle(fontSize: 24, fontWeight: FontWeight.w600, letterSpacing: -0.48);
  static const TextStyle _h3 = TextStyle(fontSize: 21, fontWeight: FontWeight.w600);
  static const TextStyle _h4 = TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
  static const TextStyle _body1 = TextStyle(fontSize: 16, fontWeight: FontWeight.w400, height: 1.4);
  static const TextStyle _body2 = TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.4);
  static const TextStyle _caption = TextStyle(fontSize: 12, fontWeight: FontWeight.w400, height: 1.2);
}

class AppFontStyle extends ThemeExtension<AppFontStyle> {
  AppFontStyle()
    : displayLarge = AppTypographyPrimitives._h1,
      displayMedium = AppTypographyPrimitives._h2,
      titleLarge = AppTypographyPrimitives._h3,
      titleMedium = AppTypographyPrimitives._h4,
      bodyLarge = AppTypographyPrimitives._body1,
      bodyMedium = AppTypographyPrimitives._body2,
      label = AppTypographyPrimitives._caption;

  /// fontSize: 36, fontWeight: w600
  final TextStyle displayLarge;

  /// fontSize: 24, fontWeight: w600
  final TextStyle displayMedium;

  /// fontSize: 21, fontWeight: w600
  final TextStyle titleLarge;

  /// fontSize: 18, fontWeight: w600
  final TextStyle titleMedium;

  /// fontSize: 16, fontWeight: w400
  final TextStyle bodyLarge;

  /// fontSize: 14, fontWeight: w400
  final TextStyle bodyMedium;

  /// fontSize: 12, fontWeight: w400
  final TextStyle label;

  @override
  ThemeExtension<AppFontStyle> copyWith() => AppFontStyle();

  @override
  ThemeExtension<AppFontStyle> lerp(covariant ThemeExtension<AppFontStyle>? other, double t) => this;
}
