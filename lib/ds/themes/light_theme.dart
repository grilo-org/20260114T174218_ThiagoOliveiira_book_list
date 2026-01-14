import 'package:flutter/material.dart';

import '../tokens/colors.dart';
import '../tokens/spacing.dart';
import '../tokens/typography.dart';

extension AppThemeContext on BuildContext {
  AppColorScheme get colors => Theme.of(this).extension<AppColorScheme>()!;
  AppFontStyle get fontStyle => Theme.of(this).extension<AppFontStyle>()!;
  AppSpacing get spacing => Theme.of(this).extension<AppSpacing>()!;
  Locale get currentLocale => Localizations.localeOf(this);
}

ThemeData buildLightTheme() {
  final base = ThemeData.light(useMaterial3: true);
  return base.copyWith(extensions: [AppColorScheme.light(), AppFontStyle(), AppSpacing.light()]);
}
