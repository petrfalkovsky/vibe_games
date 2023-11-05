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

        /// кнопка с выдвигающимся инфо
        StaggerInfoButton(
          icon: AppIcons.svgWidget(
            AppIcons.parashute,
            width: sdpPX(context, 42),
          ),
          isCloseLeftArrow: false,
          textOpen: RichText(
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
          // использовать без sdpPX(context, 25) потому ранее реализовано в виджете
          widthInfo: 318,
        ),

        sdpPX(context, 16).w,

        /// кнопка с выдвигающимся инфо
        StaggerInfoButton(
          icon: AppIcons.svgWidget(
            AppIcons.pad,
            width: sdpPX(context, 42),
          ),
          isCloseLeftArrow: true,
          textOpen: RichText(
            text: TextSpan(
              text: '',
              style: TextStyle(
                color: AppColors.accent,
                fontSize: sdpPX(context, 20),
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '10:32',
                  style: TextStyle(
                      color: AppColors.accent,
                      fontSize: sdpPX(context, 25),
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          // использовать без sdpPX(context, 25) потому ранее реализовано в виджете
          widthInfo: 220,
        ),

        // старый вариант, вдруг понадобится, оставляем
        // AnimatedInfoButton(
        //   controller: controller,
        // ),
      ],
    );
  }
}
