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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: sdpPX(context, 512), vertical: sdpPX(context, 68)),
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
                          width: sdpPX(context, 152),
                          useGradient: true,
                          gradientDirection:
                              GradientDirectionLeftButton.horizontal,
                          hasBorder: false,
                          icon: AppIcons.svgWidget(AppIcons.turnSignalLeft,
                              width: sdpPX(context, 42)),
                        )
                      : LeanLeftButton(
                          borderColor: AppColors.accent,
                          hasBorder: true,
                          width: sdpPX(context, 152),
                          useGradient: true,
                          gradientDirection:
                              GradientDirectionLeftButton.horizontal,
                          gradientColor2: Colors.transparent,
                          gradientColor1:
                              AppColors.background[1]?.withOpacity(0.6),
                          icon: AppIcons.svgWidget(AppIcons.turnSignalLeft,
                              width: sdpPX(context, 42)),
                        ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => switchButtonRight(),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: isButtonRightVisible
                      ? LeanRightButton(
                          width: sdpPX(context, 152),
                          useGradient: true,
                          gradientDirection:
                              GradientDirectionRightButton.horizontal,
                          hasBorder: false,
                          icon: AppIcons.svgWidget(AppIcons.turnSignalRight,
                              width: sdpPX(context, 42)),
                        )
                      : LeanRightButton(
                          borderColor: AppColors.accent,
                          hasBorder: true,
                          width: sdpPX(context, 152),
                          useGradient: true,
                          gradientDirection:
                              GradientDirectionRightButton.horizontal,
                          gradientColor2: Colors.transparent,
                          gradientColor1:
                              AppColors.background[1]?.withOpacity(0.6),
                          icon: AppIcons.svgWidget(AppIcons.turnSignalRight,
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
}
