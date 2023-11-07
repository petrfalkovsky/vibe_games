import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';
import 'package:vibe_games/ui/shared/all_shared.dart';
import 'package:vibe_games/ui/shared/constants/app_colors.dart';
import 'package:vibe_games/ui/shared/widgets/animated_progress_bar2.dart';

import '../../../hud_exports.dart';

class LowerStatusBar extends StatelessWidget {
  const LowerStatusBar({
    super.key,
    required this.controller,
  });

  final HudController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: controller.toggleVisibleHealthSheeld,
        child: Transform.translate(
          offset: Offset(sdpPX(context, 0), sdpPX(context, -1)),
          child: SizedBox(
              child: Stack(
            children: [
              /// контейнер
              AppIcons.svgWidget(AppIcons.statusBarFrame,
                  height: sdpPX(context, 83)),

              /// розовый
              Positioned(
                top: sdpPX(context, 15),
                right: sdpPX(context, 23),
                child: Row(
                  children: [
                    AppIcons.svgWidget(AppIcons.heart,
                        width: sdpPX(context, 26)),
                    sdpPX(context, 11).w,
                    SizedBox(
                      width: sdpPX(context, 248),
                      child: AnimatedProgressBar2(
                        borderRadius: BorderRadius.circular(sdpPX(context, 3)),
                        icon: Transform.translate(
                          offset:
                              Offset(sdpPX(context, -28), sdpPX(context, 0)),
                          child: AppIcons.svgWidget(
                            AppIcons.leftPartProgressBar,
                            height: sdpPX(context, 9),
                            color: AppColors.accent[2]!,
                          ),
                        ),
                        size: sdpPX(context, 9),
                        progressColor: AppColors.accent[2]!,
                        backgroundColor: const Color(0xFF6A1D5E),
                        currentValue: 60,
                      ),
                    ),
                  ],
                ),
              ),

              /// желтый, синий, серый виджеты
              Positioned(
                top: sdpPX(context, 44),
                right: sdpPX(context, 31),
                child: Row(
                  children: [
                    // желтый виджет
                    Padding(
                      padding: EdgeInsets.only(
                        top: sdpPX(context, 4),
                        bottom: sdpPX(context, 4),
                      ),
                      child: Row(
                        children: [
                          AppIcons.svgWidget(AppIcons.cup,
                              width: sdpPX(context, 26)),
                          sdpPX(context, 12).w,
                          SizedBox(
                            width: controller.currentState.value == 0
                                ?
                                // ширина, если синий и серый виджеты скрыты
                                sdpPX(context, 248)
                                // ширина по дефолту
                                : sdpPX(context, 97),
                            child: AnimatedProgressBar2(
                              borderRadius:
                                  BorderRadius.circular(sdpPX(context, 3)),
                              icon: Transform.translate(
                                offset: Offset(
                                    sdpPX(context, -28), sdpPX(context, 0)),
                                child: AppIcons.svgWidget(
                                  AppIcons.leftPartProgressBar,
                                  height: sdpPX(context, 9),
                                  color:
                                      AppColors.accent[3] ?? Colors.transparent,
                                ),
                              ),
                              size: sdpPX(context, 9),
                              progressColor:
                                  AppColors.accent[3] ?? Colors.transparent,
                              backgroundColor: const Color(0xFF2C1A22),
                              currentValue: 60,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // синий виджет
                    Visibility(
                      visible: controller.currentState.value == 1,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: sdpPX(context, 17),
                        ),
                        child: Row(
                          children: [
                            AppIcons.svgWidget(
                              AppIcons.o2,
                              width: sdpPX(context, 26),
                            ),
                            sdpPX(context, 11).w,
                            SizedBox(
                              width: sdpPX(context, 97),
                              child: AnimatedProgressBar2(
                                borderRadius:
                                    BorderRadius.circular(sdpPX(context, 3)),
                                icon: Transform.translate(
                                  offset: Offset(
                                      sdpPX(context, -28), sdpPX(context, 0)),
                                  child: AppIcons.svgWidget(
                                    AppIcons.leftPartProgressBar,
                                    height: sdpPX(context, 9),
                                    color: AppColors.accent[4] ??
                                        Colors.transparent,
                                  ),
                                ),
                                size: sdpPX(context, 9),
                                progressColor:
                                    AppColors.accent[4] ?? Colors.transparent,
                                backgroundColor: const Color(0xFF21274F),
                                currentValue: 60,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // серый виджет
                    Visibility(
                      visible: controller.currentState.value == 2,
                      child: Padding(
                        padding: EdgeInsets.only(left: sdpPX(context, 17)),
                        child: Row(
                          children: [
                            sdpPX(context, 2.5).w,
                            AppIcons.svgWidget(AppIcons.sheeld,
                                height: sdpPX(context, 26)),
                            sdpPX(context, 12).w,
                            SizedBox(
                              width: sdpPX(context, 97),
                              child: AnimatedProgressBar2(
                                borderRadius:
                                    BorderRadius.circular(sdpPX(context, 3)),
                                icon: Transform.translate(
                                  offset: Offset(
                                      sdpPX(context, -28), sdpPX(context, 0)),
                                  child: AppIcons.svgWidget(
                                    AppIcons.leftPartProgressBar,
                                    height: sdpPX(context, 9),
                                    color: AppColors.accent[5] ??
                                        Colors.transparent,
                                  ),
                                ),
                                size: sdpPX(context, 9),
                                progressColor:
                                    AppColors.accent[5] ?? Colors.transparent,
                                backgroundColor: const Color(0xFF312144),
                                currentValue: 60,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
