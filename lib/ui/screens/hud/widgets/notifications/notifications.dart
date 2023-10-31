import 'package:flutter/material.dart';
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';
import 'package:vibe_games/ui/shared/shared_exports.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: sdpPX(context, 44),
          transform: Matrix4.skewX(-0.2),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.background.withOpacity(0.6),
              width: sdpPX(context, 2),
            ),
            color: AppColors.background[1]?.withOpacity(0.25),
            borderRadius: BorderRadius.circular(sdpPX(context, 6)),
          ),
          child: Container(
            transform: Matrix4.skewX(0.2),
            child: Row(
              children: [
                sdpPX(context, 16).w,
                AppIcons.svgWidget(
                  AppIcons.notiRing,
                  width: sdpPX(context, 24),
                ),
                sdpPX(context, 12).w,
                RichText(
                  text: TextSpan(
                    text: 'Новое уведомление!',
                    style: TextStyle(
                      color: AppColors.accent,
                      fontSize: sdpPX(context, 20),
                      fontWeight: FontWeight.w500,
                      fontFamily: AppStyles.ttNorms,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '',
                        style: TextStyle(
                          color: AppColors.text[4],
                          fontSize: sdpPX(context, 20),
                          fontWeight: FontWeight.w700,
                          fontFamily: AppStyles.ttNorms,
                        ),
                      ),
                    ],
                  ),
                ),
                sdpPX(context, 32).w,
                sdpPX(context, 28).w,
              ],
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            transform: Matrix4.skewX(-0.2),
            height: sdpPX(context, 44),
            width: sdpPX(context, 44),
            decoration: BoxDecoration(
              color: AppColors.background[7] ?? Colors.transparent,
              borderRadius: BorderRadius.circular(sdpPX(context, 6)),
            ),
          ),
        ),
        Positioned(
          right: sdpPX(context, 15),
          top: sdpPX(context, 12),
          child: AppIcons.svgWidget(
            AppIcons.notiClick,
            height: sdpPX(context, 24),
          ),
        ),
      ],
    );
  }
}
