import 'package:flutter/material.dart';
import 'package:vibe_games/ui/shared/constants/app_text_style.dart';

abstract class AppTextTheme {
  const AppTextTheme();

  static AppTextTheme get fromPlatform => const BaseAppTextTheme();

  /// Font: TTNorms
  String get fontFamily;

  /// H1 Bold TTNorms 44.5
  TextStyle get h0_0;

  /// H1 Bold TTNorms 28
  TextStyle get h1_0;

  /// H1 SemiBold TTNorms 24
  TextStyle get h1_1;

  /// B1 Bold TTNorms 17
  TextStyle get b1_0;

  /// B1 Medium TTNorms 17
  TextStyle get b1;

  /// B1 TTNorms 17
  TextStyle get b1_1;

  /// B1 Regular TTNorms 17
  TextStyle get b1_2;

  /// B2 SemiBold TTNorms 15
  TextStyle get b2_0;

  /// B2 Regular TTNorms 15
  TextStyle get b2_1;

  /// B3 Medium TTNorms 13
  TextStyle get b3_0;

  /// B3 Regular TTNorms 13
  TextStyle get b3_1;

  /// Caption-Mob Regular TTNorms 13
  TextStyle get captionMob;

  /// TTNorms Regular TTNorms 13
  TextStyle get TTNorms;
}

class BaseAppTextTheme extends AppTextTheme {
  const BaseAppTextTheme();

  @override
  String get fontFamily => 'TTNorms';

  @override
  TextStyle get h0_0 => AppTextStyles.h0Bold;

  @override
  TextStyle get h1_0 => AppTextStyles.h1Bold;

  @override
  TextStyle get h1_1 => AppTextStyles.h1SemiBold;

  @override
  TextStyle get b1_0 => AppTextStyles.b1Bold;

  @override
  TextStyle get b1 => AppTextStyles.b1Bold;

  @override
  TextStyle get b1_1 => AppTextStyles.b1;

  @override
  TextStyle get b1_2 => AppTextStyles.b1Regular;

  @override
  TextStyle get b2_0 => AppTextStyles.b2SemiBold;

  @override
  TextStyle get b2_1 => AppTextStyles.b2Regular;

  @override
  TextStyle get b3_0 => AppTextStyles.b3Medium;

  @override
  TextStyle get b3_1 => AppTextStyles.b3Regular;

  @override
  TextStyle get captionMob => AppTextStyles.captionMob;

  @override
  TextStyle get TTNorms => AppTextStyles.TTNorms;
}

extension ThemeX on ThemeData {
  AppTextTheme get appTextTheme => AppTextTheme.fromPlatform;
}
