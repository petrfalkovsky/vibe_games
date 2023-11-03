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
  final Color? borderColorForGradient;
  final bool useGradient;
  final Color? gradientColor1;
  final Color? gradientColor2;
  final GradientDirectionRightButton gradientDirection;
  final bool showBadge;
  final bool isGradientBadge;
  final String? textBadge;

  const LeanRightButton({
    Key? key,
    this.icon,
    this.width = 99,
    this.height = 92,
    this.borderColor,
    this.hasBorder = true,
    this.borderColorForGradient,
    this.useGradient = false,
    this.gradientColor1,
    this.gradientColor2,
    this.gradientDirection = GradientDirectionRightButton.vertical,
    this.backgroundColor,
    this.showBadge = false,
    this.isGradientBadge = false,
    this.textBadge,
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
                color: borderColorForGradient ?? Colors.white,
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
      child: Stack(
        children: [
          Container(
            width: width,
            height: height,
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

          /// инфо-бейдж, новинка / x2
          if (showBadge)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                transform: Matrix4.skewX(-0.2),
                decoration: BoxDecoration(
                  color: isGradientBadge ? null : AppColors.background,
                  gradient: isGradientBadge
                      ? const LinearGradient(
                          colors: [
                            Color(0xFF0085FF),
                            Color(0xFFA700FF),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        )
                      : null,
                  borderRadius: BorderRadius.circular(
                    sdpPX(context, 6),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: sdpPX(context, 4),
                    right: sdpPX(context, 8),
                    bottom: sdpPX(context, 4),
                  ),
                  child: Container(
                    transform: Matrix4.skewX(0.2),
                    child: Text(
                      textBadge ?? 'new',
                      style: TextStyle(
                        color: isGradientBadge
                            ? AppColors.accent
                            : AppColors.accent[1],
                        fontSize: sdpPX(context, 20),
                        fontWeight: FontWeight.bold,
                        fontFamily: AppStyles.ttNorms,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
