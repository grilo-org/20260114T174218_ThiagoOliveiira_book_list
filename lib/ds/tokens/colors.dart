import 'package:flutter/material.dart';

class AppColorScheme extends ThemeExtension<AppColorScheme> {
  final BlueColors blue;
  final NeutralColors neutral;
  final PurpleColors purple;

  const AppColorScheme({required this.blue, required this.neutral, required this.purple});

  factory AppColorScheme.light() {
    return AppColorScheme(blue: BlueColors.light(), neutral: NeutralColors.light(), purple: PurpleColors.light());
  }

  @override
  AppColorScheme copyWith({BlueColors? blue, NeutralColors? neutral, PurpleColors? purple}) {
    return AppColorScheme(blue: blue ?? this.blue, neutral: neutral ?? this.neutral, purple: purple ?? this.purple);
  }

  @override
  ThemeExtension<AppColorScheme> lerp(covariant ThemeExtension<AppColorScheme>? other, double t) => this;
}

class BlueColors {
  final Color darker;
  final Color dark;
  final Color steel;
  final Color mist;
  final Color silver;
  final Color slate;

  const BlueColors._internal({
    required this.darker,
    required this.dark,
    required this.steel,
    required this.mist,
    required this.silver,
    required this.slate,
  });

  factory BlueColors.light() {
    return BlueColors._internal(
      darker: Color(0xFF363F72),
      dark: Color(0xFF3E4784),
      steel: Color(0xFF475467),
      mist: Color(0xFFF8F9FC),
      silver: Color(0xFFD0D5DD),
      slate: Color(0xFF344054),
    );
  }
}

class NeutralColors {
  final Color deepOcean;
  final Color white;
  final Color frostWhite;
  final Color utilityGray;
  final Color lightGray;
  final Color lighterGray;

  const NeutralColors._internal({
    required this.deepOcean,
    required this.white,
    required this.frostWhite,
    required this.utilityGray,
    required this.lightGray,
    required this.lighterGray,
  });

  factory NeutralColors.light() {
    return NeutralColors._internal(
      deepOcean: Color(0xFF101828),
      white: Color(0xFFFFFFFF),
      frostWhite: Color(0xFFF3F4F6),
      utilityGray: Color(0xFF667085),
      lighterGray: Color(0xFFEAECF0),
      lightGray: Color(0xFFF2F4F7),
    );
  }
}

class PurpleColors {
  final Color violet;
  final Color dark;
  final Color lavender;
  final Color icyLilac;

  const PurpleColors._internal({
    required this.violet,
    required this.lavender,
    required this.icyLilac,
    required this.dark,
  });

  factory PurpleColors.light() {
    return PurpleColors._internal(
      violet: Color(0xFF7F56D9),
      lavender: Color(0xFFF9F5FF),
      icyLilac: Color(0xFFE9D7FE),
      dark: Color(0xFF6941C6),
    );
  }
}
