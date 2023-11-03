import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';
import 'package:vibe_games/ui/screens/hud/hud_exports.dart';
import 'package:vibe_games/ui/shared/shared_exports.dart';

class AnimatedInfoButton extends StatelessWidget {
  const AnimatedInfoButton({
    super.key,
    required this.controller,
  });

  final HudController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: sdpPX(context, 92),
        child: AnimatedProgressBar3(
          optionalField: Transform(
            transform: Matrix4.skewX(0.2),
            child: RichText(
              text: TextSpan(
                text: 'До конца задания\nосталось ',
                style: TextStyle(
                  color: AppColors.accent,
                  fontSize: sdpPX(context, 20),
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '10:32',
                    style: TextStyle(
                        color: AppColors.accent,
                        fontSize: sdpPX(context, 20),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          progressBarBorder: Border.all(
            color: AppColors.background.withOpacity(0.6),
            width: sdpPX(context, 2),
          ),
          progressGradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.background[1]?.withOpacity(0.2) ?? Colors.transparent,
              AppColors.background[1]?.withOpacity(0.45) ?? Colors.transparent,
            ],
          ),
          borderRadius: BorderRadius.circular(sdpPX(context, 8)),
          backgroundColor: Colors.transparent,
          progressColor:
              AppColors.background[1]?.withOpacity(0.2) ?? Colors.transparent,
          height: sdpPX(context, 92),
          width: sdpPX(context, 480),
          currentValue: controller.isOpen.value
              ? controller.openedState.value.toDouble()
              : controller.closedState.value.toDouble(),
          frontContent: GestureDetector(
            onTap: () => controller.toggleIsOpen(),
            child: LeanRightButton(
              useGradient: true,
              gradientColor1: AppColors.background[1]?.withOpacity(0.2),
              gradientColor2: AppColors.background[1]?.withOpacity(0.45),
              height: sdpPX(context, 92),
              width: sdpPX(context, 99),
              icon: AppIcons.svgWidget(AppIcons.parashute,
                  width: sdpPX(context, 42)),
            ),
          ),
        ),
      ),
    );
  }
}
