import 'package:flutter/material.dart';
import 'package:vibe_games/ui/shared/constants/app_colors.dart';

class BalanceStatusBar extends StatelessWidget {
  final String text;
  final double? fontSize;

  const BalanceStatusBar({
    Key? key,
    required this.text,
    this.fontSize,
  }) : super(key: key);

  String formatText() {
    if (text.length > 17) {
      return '${text.substring(0, 16)}..';
    } else {
      return text;
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedText = formatText();

    return Text(
      formattedText,
      style: TextStyle(
          color: AppColors.text[1],
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
          fontFamily: 'TTNorms'),
    );
  }
}
