import 'package:flutter/material.dart';
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';
import 'package:vibe_games/ui/shared/shared_exports.dart';

enum GradientDirectionRightButton {
  vertical,
  horizontal,
}

class LeanRightButton extends StatelessWidget {
  final Widget? icon;
  final double width;
  final double height;
  final Color? backgroundColor;
  final Color? borderColor;
  final bool hasBorder;
  final Color?
      borderColorForGradient; // Новый параметр для цвета бордера при использовании градиента
  final bool useGradient;
  final Color? gradientColor1;
  final Color? gradientColor2;
  final GradientDirectionRightButton gradientDirection;

  const LeanRightButton({
    Key? key,
    this.icon,
    this.width = 95,
    this.height = 92,
    this.borderColor,
    this.hasBorder = true,
    this.borderColorForGradient, // Добавлен новый параметр
    this.useGradient = false,
    this.gradientColor1,
    this.gradientColor2,
    this.gradientDirection = GradientDirectionRightButton.vertical,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BoxDecoration decoration;
    if (useGradient) {
      decoration = BoxDecoration(
        gradient: LinearGradient(
          colors: [
            gradientColor1 ?? const Color(0xFF402861),
            gradientColor2 ?? const Color(0xFF392A4D),
          ],
          begin: gradientDirection == GradientDirectionRightButton.vertical
              ? Alignment.topCenter
              : Alignment.centerLeft,
          end: gradientDirection == GradientDirectionRightButton.vertical
              ? Alignment.bottomCenter
              : Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(sdpPX(context, 6)),
        border: hasBorder
            ? Border.all(
                color: borderColorForGradient ??
                    Colors.white, // Используйте цвет бордера для градиента
                width: sdpPX(context, 2),
              )
            : null,
      );
    } else {
      decoration = BoxDecoration(
        border: hasBorder
            ? Border.all(
                color: borderColor ?? AppColors.background.withOpacity(0.6),
                width: sdpPX(context, 2),
              )
            : null,
        color: backgroundColor ?? AppColors.background[1]?.withOpacity(0.25),
        borderRadius: BorderRadius.circular(sdpPX(context, 6)),
      );
    }

    return ButtonAnimator(
      child: Container(
        width: sdpPX(context, width),
        height: sdpPX(context, height),
        transform: Matrix4.skewX(-0.2),
        decoration: decoration,
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.skewX(0.2),
          child: Center(
            child: icon,
          ),
        ),
      ),
    );
  }
}
