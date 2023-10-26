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

  // пока вместо этого используется sdp
  // double calculateFontSize() {
  //   if (text.length > 25) {
  //     return 12.0;
  //   } else if (text.length > 21) {
  //     return 16.0;
  //   } else if (text.length > 18) {
  //     return 20.0;
  //   } else {
  //     return 26.0;
  //   }
  // }

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
