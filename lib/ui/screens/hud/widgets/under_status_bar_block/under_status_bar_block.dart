import 'package:flutter/material.dart';
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';
import 'package:vibe_games/ui/screens/hud/hud_exports.dart';
import 'package:vibe_games/ui/shared/shared_exports.dart';

class UnderStatusBarBlock extends StatelessWidget {
  const UnderStatusBarBlock({
    super.key,
    required this.controller,
  });

  final HudController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: sdpPX(context, 14)),
      child: Row(
        children: [
          // кнопки  под статус баром
          Transform.translate(
            offset: Offset(sdpPX(context, 3), sdpPX(context, 0)),
            child: Row(
              children: [
                LeanRightButton(
                  useGradient: true,
                  gradientColor1: AppColors.background[1]?.withOpacity(0.2),
                  gradientColor2: AppColors.background[1]?.withOpacity(0.45),
                  height: sdpPX(context, 92),
                  width: sdpPX(context, 99),
                  showBadge: true,
                  isGradientBadge: true,
                  textBadge: 'x2',
                  icon: AppIcons.svgWidget(AppIcons.crown,
                      width: sdpPX(context, 38)),
                ),
                sdpPX(context, 15).w,
                LeanRightButton(
                  useGradient: true,
                  gradientColor1: AppColors.background[1]?.withOpacity(0.2),
                  gradientColor2: AppColors.background[1]?.withOpacity(0.45),
                  height: sdpPX(context, 92),
                  width: sdpPX(context, 99),
                  showBadge: true,
                  icon: AppIcons.svgWidget(AppIcons.cart,
                      width: sdpPX(context, 34)),
                ),
                sdpPX(context, 15).w,
                const GunsButtonBlock(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
