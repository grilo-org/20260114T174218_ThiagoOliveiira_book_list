import 'package:flutter/material.dart';

class AppSpacing extends ThemeExtension<AppSpacing> {
  const AppSpacing._internal({
    required this.spacingXS,
    required this.spacingSM,
    required this.spacingMD,
    required this.spacingLG,
    required this.spacingXL,
    required this.spacing2XL,
    required this.spacing3XL,
    required this.spacing4XL,
    required this.spacing5XL,
    required this.spacing6XL,
    required this.spacing7XL,
    required this.spacing8XL,
    required this.spacing9XL,
    required this.spacing10XL,
    required this.spacing11XL,
  });

  factory AppSpacing.light() {
    return AppSpacing._internal(
      spacingXS: Size(4, 4),
      spacingSM: Size(6, 6),
      spacingMD: Size(8, 8),
      spacingLG: Size(12, 12),
      spacingXL: Size(16, 16),
      spacing2XL: Size(20, 20),
      spacing3XL: Size(24, 24),
      spacing4XL: Size(32, 32),
      spacing5XL: Size(40, 40),
      spacing6XL: Size(48, 48),
      spacing7XL: Size(64, 64),
      spacing8XL: Size(80, 80),
      spacing9XL: Size(96, 96),
      spacing10XL: Size(128, 128),
      spacing11XL: Size(160, 160),
    );
  }

  /// Size: (4, 4)
  final Size spacingXS;

  /// Size: (6, 6)
  final Size spacingSM;

  /// Size: (8, 8)
  final Size spacingMD;

  /// Size: (12, 12)
  final Size spacingLG;

  /// Size: (16, 16)
  final Size spacingXL;

  /// Size: (20, 20)
  final Size spacing2XL;

  /// Size: (24, 24)
  final Size spacing3XL;

  /// Size: (32, 32)
  final Size spacing4XL;

  /// Size: (40, 40)
  final Size spacing5XL;

  /// Size: (48, 48)
  final Size spacing6XL;

  /// Size: (64, 64)
  final Size spacing7XL;

  /// Size: (80, 80)
  final Size spacing8XL;

  /// Size: (96, 96)
  final Size spacing9XL;

  /// Size: (128, 128)
  final Size spacing10XL;

  /// Size: (160, 160)
  final Size spacing11XL;

  @override
  ThemeExtension<AppSpacing> copyWith() => AppSpacing.light();

  @override
  ThemeExtension<AppSpacing> lerp(covariant ThemeExtension<AppSpacing>? other, double t) => this;
}
