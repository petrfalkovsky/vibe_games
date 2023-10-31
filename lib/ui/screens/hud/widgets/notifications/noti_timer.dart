import 'package:flutter/material.dart';
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';
import 'package:vibe_games/ui/shared/shared_exports.dart';

class NotiTimer extends StatelessWidget {
  const NotiTimer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sdpPX(context, 71),
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
              AppIcons.giftBox,
              width: sdpPX(context, 28),
            ),
            sdpPX(context, 28).w,
            RichText(
              text: TextSpan(
                text: 'Получи ежедневный\nбонус через ',
                style: TextStyle(
                  color: AppColors.accent,
                  fontSize: sdpPX(context, 20),
                  fontWeight: FontWeight.w700,
                  fontFamily: AppStyles.ttNorms,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '12 мин',
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
            sdpPX(context, 28).w,
            GestureDetector(
              onTap: () {},
              child: AppIcons.svgWidget(
                AppIcons.notiClose,
                width: sdpPX(context, 18),
              ),
            ),
            sdpPX(context, 28).w,
          ],
        ),
      ),
    );
  }
}
