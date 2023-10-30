import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';
import 'package:vibe_games/ui/screens/hud/hud_exports.dart';
import 'package:vibe_games/ui/shared/all_shared.dart';
import 'package:vibe_games/ui/shared/constants/app_colors.dart';

class UpperStatusBar extends StatefulWidget {
  const UpperStatusBar({super.key});

  @override
  State<UpperStatusBar> createState() => _UpperStatusBarState();
}

class _UpperStatusBarState extends State<UpperStatusBar> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Visibility(
                visible: Get.find<HudController>().isVisibleStar.value,
                child: Transform.translate(
                  offset: Offset(sdpPX(context, 24), 0),
                  child: Row(
                    children: [
                      Transform.translate(
                        offset: const Offset(8, 0),
                        child: AppIcons.svgWidget(AppIcons.leftPartOfStatusbar,
                            height: sdpPX(context, 58),
                            color: AppColors.background[2]),
                      ),
                      Stack(
                        children: [
                          Container(
                            color: AppColors.background[2],
                            child: SizedBox(
                              height: sdpPX(context, 58),
                              child: Row(
                                children: [
                                  AppIcons.svgWidget(
                                    AppIcons.star,
                                    height: sdpPX(context, 36),
                                  ),
                                  sdpPX(context, 30).w,
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: sdpPX(context, 21),
                                left: sdpPX(context, 12.6)),
                            child: Text(
                              '5',
                              style: TextStyle(
                                  color: AppColors.text,
                                  fontWeight: FontWeight.bold,
                                  fontSize: sdpPX(context, 17),
                                  fontFamily: 'TTNorms'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Transform.translate(
                offset: const Offset(1, 0),
                child: AppIcons.svgWidget(
                  AppIcons.leftPartOfStatusbar,
                  height: sdpPX(context, 58),
                ),
              ),
              GestureDetector(
                onTap: Get.find<HudController>().toggleAreaVisibility,
                child: Container(
                  color: AppColors.accent[1],
                  child: Stack(
                    children: [
                      SizedBox(
                        height: sdpPX(context, 58),
                        child: Row(
                          children: [
                            sdpPX(context, 4).w,
                            AppIcons.svgWidget(
                              AppIcons.rub,
                              height: sdpPX(context, 20),
                              color: AppColors.accent.withOpacity(0.3),
                            ),
                            sdpPX(context, 8).w,
                            BalanceStatusBar(
                              text: '200 000 000',
                              fontSize: sdpPX(context, 24),
                            ),
                            sdpPX(context, 4).w,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Transform.translate(
                offset: const Offset(-1, 0),
                child: AppIcons.svgWidget(
                  AppIcons.rightPartOfStatusbar,
                  height: sdpPX(context, 58),
                  color: AppColors.accent[1],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
