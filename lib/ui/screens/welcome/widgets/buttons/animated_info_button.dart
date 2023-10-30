import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';
import 'package:vibe_games/ui/screens/welcome/welcome_exports.dart';
import 'package:vibe_games/ui/shared/exports_shared.dart';

class AnimatedInfoButton extends StatelessWidget {
  const AnimatedInfoButton({
    super.key,
    required this.controller,
  });

  final WelcomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Positioned(
        top: 400,
        left: 100,
        child: SizedBox(
          height: sdpPX(context, 88),
          child: AnimatedProgressBar3(
            progressBarBorder: Border.all(
              color: AppColors.background,
            ),
            borderRadius: BorderRadius.circular(8),
            backgroundColor: Colors.transparent,
            progressColor:
                AppColors.background[1]?.withOpacity(0.2) ?? Colors.transparent,
            height: sdpPX(context, 88),
            width: 500,
            currentValue: controller.isOpen.value
                ? controller.openedState.value.toDouble()
                : controller.closedState.value.toDouble(),
            frontContent: GestureDetector(
              onTap: () => controller.toggleIsOpen(),
              child: SliderButton(
                icon: AppIcons.svgWidget(AppIcons.pad, width: 34),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
