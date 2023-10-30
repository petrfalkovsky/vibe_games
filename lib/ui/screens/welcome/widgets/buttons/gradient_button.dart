import 'package:flutter/material.dart';
import 'package:vibe_games/ui/shared/constants/app_colors.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final double borderRadius;
  final double fontSize;
  final Widget leftIcon;
  final Widget rightIcon;

  const GradientButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.borderRadius = 12.0,
    this.fontSize = 16.0,
    required this.leftIcon,
    required this.rightIcon,
  });

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
              AppColors.background[3] ?? Colors.transparent
            ]),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
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


/// пример использования
// GradientButton(
//   height: sdpPX(context, 83),
//   width: sdpPX(context, 194),
//   onPressed: () {
//     sideBarController.toggleSidebar();
//     controller.togglePositionedVisibility();
//   },
//   text: 'Завершить',
//   fontSize: sdpPX(context, 24),
//   leftIcon: const SizedBox(),
//   rightIcon: const SizedBox(),
// ),