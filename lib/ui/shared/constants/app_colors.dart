// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

abstract class AppColors {
  const AppColors._();

  static _AccentColors accent = const _AccentColors(
    0xFFFEFEFF,
    <int, Color>{
      // кнопки, элементы таблоиов всяких
      1: Color(0xFF482575),
      // сердечки всякие
      2: Color(0xFFFF2E9F),
      // чашки всякие
      3: Color(0xFFF6980B),
      // воздух например
      4: Color(0xFF00D1FF),
      // неактивный элемент
      5: Color(0xFFA1A1A1),
      // зеленое что-то, типа микрофона
      6: Color(0xFF267B2F),
    },
  );

  static Gradient get accentGradient {
    return LinearGradient(
      colors: [accent.accent1, const Color(0xFF1DB9DD)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );
  }

  static _TextColors text = const _TextColors(
    0xFF222222,
    <int, Color>{
      // primary
      1: Color(0xFFFFFFFF),
      // secondary
      2: Color(0xFFA0A0A1),
      // не активный текст
      3: Color(0xFF7F669E),
      // secondaryTwo
      4: Color(0xFFBDBCDE),
    },
  );
  static _NotificationColors notification = const _NotificationColors(
    0xFFEB5E6C,
    <int, Color>{
      1: Color(0xFFEB5E6C),
      2: Color(0xFFFFF3F4),
      3: Color(0xFF48A36D),
    },
  );
  static _BackgroundColors background = const _BackgroundColors(
    0xFFF9F9FA,
    <int, Color>{
      // светло-фиолетовый
      1: Color(0xFF482575),
      // темно-фиолетовый
      2: Color(0xFF341161),
      3: Color(0xFF5A57AC),
      4: Color(0xFF101113),
      5: Colors.transparent,
      6: Color(0xFF111217),
    },
  );
}

abstract class AbstractAppColors {
  const AbstractAppColors();

  _AccentColors get accent;

  _TextColors get text;

  _NotificationColors get notification;

  _BackgroundColors get background;
}

class AppColorsLight implements AbstractAppColors {
  const AppColorsLight();

  @override
  _AccentColors get accent => AppColors.accent;

  @override
  _BackgroundColors get background => AppColors.background;

  @override
  _NotificationColors get notification => AppColors.notification;

  @override
  _TextColors get text => AppColors.text;
}

class _AccentColors extends ColorSwatch<int> {
  const _AccentColors(int primary, Map<int, Color> swatch)
      : super(primary, swatch);

  Color get accent1 => this[1]!;

  Color get accent2 => this[2]!;
}

class _TextColors extends ColorSwatch<int> {
  const _TextColors(int primary, Map<int, Color> swatch)
      : super(primary, swatch);

  Color get primary => this[1]!;

  Color get secondary => this[2]!;

  Color get card => this[3]!;

  Color get secondaryTwo => this[4]!;
}

class _NotificationColors extends ColorSwatch<int> {
  const _NotificationColors(int primary, Map<int, Color> swatch)
      : super(primary, swatch);

  Color get error => this[1]!;

  Color get errorLight => this[2]!;

  Color get success => this[3]!;
}

class _BackgroundColors extends ColorSwatch<int> {
  const _BackgroundColors(int primary, Map<int, Color> swatch)
      : super(primary, swatch);

  Color get bgB1 => this[1]!;

  Color get bgB2 => this[2]!;

  Color get divider => this[3]!;
}

class OtherColors {
  const OtherColors();

  Color get black => const Color(0xFF101113);

  Color get transparent => Colors.transparent;

  Color get white => Colors.white;

  Color get grey => const Color(0xffA4A8AB);
}
