import 'package:flutter/material.dart';
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';
import 'package:vibe_games/ui/screens/hud/hud_exports.dart';
import 'package:vibe_games/ui/shared/shared_exports.dart';

class TurnSigns extends StatefulWidget {
  const TurnSigns({super.key});

  @override
  State<TurnSigns> createState() => _TurnSignsState();
}

class _TurnSignsState extends State<TurnSigns> {
  bool isButtonLeftVisible = true;
  bool isButtonRightVisible = true;
  bool isGasIconVisible = true;
  bool isHeartIconVisible = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: sdpPX(context, 68)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => switchButtonLeft(),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: isButtonLeftVisible
                      ? LeanLeftButton(
                          height: sdpPX(context, 92),
                          width: sdpPX(context, 132),
                          useGradient: true,
                          gradientDirection:
                              GradientDirectionLeftButton.horizontal,
                          hasBorder: false,
                          gradientColor2:
                              AppColors.background[1]?.withOpacity(0.6),
                          gradientColor1:
                              AppColors.background[1]?.withOpacity(0.4),
                          icon: Image.asset(AppIcons.turnSignalLeftPNG,
                              width: sdpPX(context, 42)),
                        )
                      : LeanLeftButton(
                          height: sdpPX(context, 92),
                          borderColor: AppColors.accent,
                          hasBorder: true,
                          width: sdpPX(context, 132),
                          useGradient: true,
                          gradientDirection:
                              GradientDirectionLeftButton.horizontal,
                          gradientColor2:
                              AppColors.background[1]?.withOpacity(0.6),
                          gradientColor1: AppColors.background.withOpacity(0.3),
                          icon: Image.asset(AppIcons.turnSignalLeftPNG,
                              width: sdpPX(context, 42)),
                        ),
                ),
              ),
              sdpPX(context, 12).w,
              GestureDetector(
                onTap: () => switchGasIcon(),
                child: LeanLeftButton(
                  height: sdpPX(context, 92),
                  width: sdpPX(context, 92),
                  backgroundColor: AppColors.background[1]?.withOpacity(0.3),
                  gradientDirection: GradientDirectionLeftButton.horizontal,
                  hasBorder: false,
                  icon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppIcons.svgWidget(
                        AppIcons.gasStation,
                        width: sdpPX(context, 25),
                        color: isGasIconVisible
                            ? AppColors.accent[9]
                            : AppColors.accent,
                      ),
                      sdpPX(context, 11).h,
                      Text(
                        isGasIconVisible ? '8' : '100',
                        style: TextStyle(
                          color: AppColors.accent,
                          fontSize: sdpPX(context, 18),
                          fontWeight: FontWeight.bold,
                          fontFamily: AppStyles.ttNorms,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              sdpPX(context, 380).w,
              GestureDetector(
                onTap: () => switchHeartIcon(),
                child: LeanRightButton(
                  height: sdpPX(context, 92),
                  width: sdpPX(context, 92),
                  backgroundColor: AppColors.background[1]?.withOpacity(0.3),
                  gradientDirection: GradientDirectionRightButton.horizontal,
                  hasBorder: false,
                  icon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppIcons.svgWidget(
                        AppIcons.breakHeartProcent,
                        width: sdpPX(context, 35.5),
                        color: isHeartIconVisible
                            ? AppColors.accent[9]
                            : AppColors.accent,
                      ),
                      sdpPX(context, 11).h,
                      Text(
                        isHeartIconVisible ? '25' : '94',
                        style: TextStyle(
                          color: AppColors.accent,
                          fontSize: sdpPX(context, 18),
                          fontWeight: FontWeight.bold,
                          fontFamily: AppStyles.ttNorms,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              sdpPX(context, 12).w,
              GestureDetector(
                onTap: () => switchButtonRight(),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: isButtonRightVisible
                      ? LeanRightButton(
                          height: sdpPX(context, 92),
                          width: sdpPX(context, 132),
                          useGradient: true,
                          gradientDirection:
                              GradientDirectionRightButton.horizontal,
                          hasBorder: false,
                          gradientColor2:
                              AppColors.background[1]?.withOpacity(0.4),
                          gradientColor1:
                              AppColors.background[1]?.withOpacity(0.6),
                          icon: Image.asset(AppIcons.turnSignalRightPNG,
                              width: sdpPX(context, 42)),
                        )
                      : LeanRightButton(
                          height: sdpPX(context, 92),
                          width: sdpPX(context, 132),
                          borderColor: AppColors.accent,
                          hasBorder: true,
                          useGradient: true,
                          gradientDirection:
                              GradientDirectionRightButton.horizontal,
                          gradientColor2: AppColors.background.withOpacity(0.3),
                          gradientColor1:
                              AppColors.background[1]?.withOpacity(0.6),
                          icon: Image.asset(AppIcons.turnSignalRightPNG,
                              width: sdpPX(context, 42)),
                        ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  /// переключаеют поворотники
  void switchButtonLeft() {
    setState(() {
      isButtonLeftVisible = !isButtonLeftVisible;
    });
  }

  void switchButtonRight() {
    setState(() {
      isButtonRightVisible = !isButtonRightVisible;
    });
  }

  /// переключает топливо
  void switchGasIcon() {
    setState(() {
      isGasIconVisible = !isGasIconVisible;
    });
  }

  void switchHeartIcon() {
    setState(() {
      isHeartIconVisible = !isHeartIconVisible;
    });
  }
}
