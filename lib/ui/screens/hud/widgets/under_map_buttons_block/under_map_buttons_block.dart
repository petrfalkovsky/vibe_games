import 'package:flutter/material.dart';
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';
import 'package:vibe_games/ui/screens/hud/hud_exports.dart';
import 'package:vibe_games/ui/shared/shared_exports.dart';

class UnderMapButtonsBlock extends StatelessWidget {
  const UnderMapButtonsBlock({
    super.key,
    required this.controller,
  });

  final HudController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// обычные кнопки
        LeanRightButton(
            useGradient: true,
            gradientColor1: AppColors.background[1]?.withOpacity(0.2),
            gradientColor2: AppColors.background[1]?.withOpacity(0.45),
            height: sdpPX(context, 92),
            width: sdpPX(context, 99),
            icon:
                AppIcons.svgWidget(AppIcons.avatar, width: sdpPX(context, 31))),
        sdpPX(context, 16).w,
        LeanRightButton(
            useGradient: true,
            gradientColor1: AppColors.background[1]?.withOpacity(0.2),
            gradientColor2: AppColors.background[1]?.withOpacity(0.45),
            height: sdpPX(context, 92),
            width: sdpPX(context, 99),
            icon:
                AppIcons.svgWidget(AppIcons.radial, width: sdpPX(context, 42))),
        sdpPX(context, 16).w,
        LeanRightButton(
            useGradient: true,
            gradientColor1: AppColors.background[1]?.withOpacity(0.2),
            gradientColor2: AppColors.background[1]?.withOpacity(0.45),
            height: sdpPX(context, 92),
            width: sdpPX(context, 99),
            icon: AppIcons.svgWidget(AppIcons.pad, width: sdpPX(context, 40))),
        sdpPX(context, 16).w,

        /// кнопка с выдвигающимся инфо
        AnimatedInfoButton(controller: controller),
      ],
    );
  }
}
