import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppStyles {
  static const ttNorms = 'TTNorms';

  static const largeTitle = TextStyle(
    fontSize: 72,
    fontFamily: ttNorms,
  );

  static const title = TextStyle(
    fontSize: 32,
    fontFamily: ttNorms,
  );

  static const title2 = TextStyle(
    fontSize: 28,
    fontFamily: ttNorms,
    fontWeight: FontWeight.w600,
  );

  static const headline = TextStyle(
    fontSize: 20,
    fontFamily: ttNorms,
    fontWeight: FontWeight.w600,
  );

  static const headline2 = TextStyle(
    fontSize: 22,
    fontFamily: ttNorms,
    fontWeight: FontWeight.w600,
    height: 1.5,
  );

  static const body = TextStyle(
    fontSize: 16,
    fontFamily: ttNorms,
    fontWeight: FontWeight.w600,
  );

  static const plainText = TextStyle(
    fontSize: 16,
    fontFamily: ttNorms,
  );

  static const plainTextMedium = TextStyle(
    fontSize: 14,
    fontFamily: ttNorms,
  );

  static const plainTextSmall = TextStyle(
    fontSize: 12,
    fontFamily: ttNorms,
  );

  static const text22 = TextStyle(
    fontSize: 22,
    fontFamily: ttNorms,
  );

  static const text24 = TextStyle(
    fontSize: 24,
    fontFamily: ttNorms,
  );
  static const text30 = TextStyle(
    fontSize: 30,
    fontFamily: ttNorms,
  );
  static const input = TextStyle(
    fontSize: 16,
    fontFamily: ttNorms,
  );
  static const button = TextStyle(
    fontSize: 16,
    fontFamily: ttNorms,
  );
}

extension TextStyleX on TextStyle {
  TextStyle andSize(double size) => copyWith(fontSize: size);
  TextStyle andWeight(FontWeight weight) => copyWith(fontWeight: weight);
  TextStyle andColor(Color color) => copyWith(color: color);
  TextStyle andHeight(double height) => copyWith(height: height);
}
