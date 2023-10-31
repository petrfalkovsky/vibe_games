// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:vibe_games/ui/shared/shared_exports.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final double borderRadius;
  final double fontSize;
  final Widget leftIcon;
  final Widget rightIcon;
  final EdgeInsets? padding;
  const GradientButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.borderRadius = 12.0,
    this.fontSize = 16.0,
    required this.leftIcon,
    required this.rightIcon,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            AppColors.background[4] ?? Colors.transparent,
            AppColors.background[3] ?? Colors.transparent,
          ],
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          padding: MaterialStateProperty.all(
            padding ??
                const EdgeInsets.symmetric(
                    vertical: 15, horizontal: 20), // Используем padding
          ),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius))),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (leftIcon != null) Row(children: [leftIcon]),
            Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: fontSize),
            ),
            if (rightIcon != null) Row(children: [rightIcon]),
          ],
        ),
      ),
    );
  }
}
