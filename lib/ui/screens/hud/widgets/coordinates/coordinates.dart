import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';
import 'package:vibe_games/ui/shared/shared_exports.dart';

class Coordinates extends StatelessWidget {
  const Coordinates({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: '07',
                        style: TextStyle(
                          color: AppColors.accent.withOpacity(0.8),
                          fontSize: sdpPX(context, 20),
                          fontWeight: FontWeight.w500,
                          fontFamily: AppStyles.ttNorms,
                        ),
                        children: const <TextSpan>[
                          TextSpan(
                            text: ' · ID ',
                          ),
                          TextSpan(
                            text: '317',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                sdpPX(context, 10).h,
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: DateFormat(
                          ('dd.MM.yyyy'),
                        ).format(
                          DateTime.now(),
                        ),
                        style: TextStyle(
                          color: AppColors.accent.withOpacity(0.8),
                          fontSize: sdpPX(context, 20),
                          fontWeight: FontWeight.w500,
                          fontFamily: AppStyles.ttNorms,
                        ),
                        children: <TextSpan>[
                          const TextSpan(
                            text: ' · ',
                          ),
                          TextSpan(
                            text: DateFormat.Hm('en_US').format(DateTime.now()),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            sdpPX(context, 57).w,
            Row(
              children: [
                AppIcons.svgWidget(
                  AppIcons.locate,
                  height: sdpPX(context, 27),
                  color: AppColors.accent.withOpacity(0.8),
                ),
                sdpPX(context, 9).w,
                RichText(
                  text: TextSpan(
                    text: '3250',
                    style: TextStyle(
                      color: AppColors.accent.withOpacity(0.8),
                      fontSize: sdpPX(context, 25),
                      fontWeight: FontWeight.w500,
                      fontFamily: AppStyles.ttNorms,
                    ),
                    children: const <TextSpan>[
                      TextSpan(
                        text: ' км',
                      ),
                    ],
                  ),
                ),
                sdpPX(context, 20).w,
                AppIcons.svgWidget(
                  AppIcons.locateNinja,
                  height: sdpPX(context, 28),
                  color: AppColors.accent.withOpacity(0.8),
                ),
                RichText(
                  text: TextSpan(
                    text: '280',
                    style: TextStyle(
                      color: AppColors.accent.withOpacity(0.8),
                      fontSize: sdpPX(context, 25),
                      fontWeight: FontWeight.w500,
                      fontFamily: AppStyles.ttNorms,
                    ),
                    children: const <TextSpan>[
                      TextSpan(
                        text: ' км',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
