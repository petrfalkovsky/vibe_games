// ignore_for_file: unused_import, unnecessary_import, unused_element

import 'dart:math';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';
import 'package:vibe_games/ui/router/routing.dart';
import 'package:vibe_games/ui/screens/welcome/src/welcome_controller.dart';
import 'package:vibe_games/ui/screens/welcome/welcome_exports.dart';
import 'package:vibe_games/ui/shared/all_shared.dart';
import 'package:vibe_games/ui/shared/button_animator.dart';
import 'package:vibe_games/ui/shared/constants/app_colors.dart';
import 'package:vibe_games/ui/shared/constants/assets.dart';
import 'package:vibe_games/ui/shared/widgets/animated_progress_bar.dart';
import 'package:vibe_games/ui/shared/widgets/animated_progress_bar2.dart';
import 'package:vibe_games/ui/shared/widgets/std_button.dart';
import 'package:vibe_games/ui/shared/widgets/std_input.dart';
import 'package:vfx_flutter_common/getx_helpers.dart';

class WelcomeScreen extends StatexWidget<WelcomeController> {
  WelcomeScreen({Key? key}) : super(() => WelcomeController(), key: key) {
    debugPrint('welcome_screen'.tr());
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Stack(
          children: [
            const _BackgroundImage(),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.all(sdpPX(context, 24)),
                child: Stack(
                  children: [
                    // второй контейнер для верхней части cтатус бара
                    const UpperStatusBar(),
                    // контейнер для нижней части cтатус бара
                    SizedBox(
                      width: 200,
                      child: AnimatedProgressBar2(
                        icon: Transform.translate(
                          offset: const Offset(-28, 0),
                          child: AppIcons.svgWidget(
                            AppIcons.leftPartProgressBar,
                            height: 9,
                            color: Colors.black,
                          ),
                        ),
                        size: 9,
                        progressColor: Colors.black,
                        backgroundColor: Colors.white,
                        currentValue: 40,
                      ),
                    ),
                    Positioned(
                      top: sdpPX(context, 58),
                      right: sdpPX(context, 11),
                      child: GestureDetector(
                        onTap: controller.toggleVisibleHealthSheeld,
                        child: Transform.translate(
                          offset: const Offset(0, -1),
                          child: SizedBox(
                              child: Stack(
                            children: [
                              /// контейнер
                              AppIcons.svgWidget(AppIcons.statusBarFrame,
                                  width: sdpPX(context, 370)),

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
                                      width: sdpPX(context, 280),
                                      child: AnimatedProgressBar2(
                                        icon: Transform.translate(
                                          offset:
                                              Offset(sdpPX(context, -28), 0),
                                          child: AppIcons.svgWidget(
                                            AppIcons.leftPartProgressBar,
                                            height: sdpPX(context, 9),
                                            color: AppColors.accent[2]!,
                                          ),
                                        ),
                                        size: sdpPX(context, 9),
                                        progressColor: AppColors.accent[2]!,
                                        backgroundColor:
                                            const Color(0xFF6A1D5E),
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
                                            width: controller
                                                        .currentState.value ==
                                                    0
                                                ?
                                                // ширина, если синий и серый виджеты скрыты
                                                sdpPX(context, 280)
                                                // ширина по дефолту
                                                : sdpPX(context, 113),
                                            child: AnimatedProgressBar2(
                                              icon: Transform.translate(
                                                offset: Offset(
                                                    sdpPX(context, -28), 0),
                                                child: AppIcons.svgWidget(
                                                  AppIcons.leftPartProgressBar,
                                                  height: sdpPX(context, 9),
                                                  color: AppColors.accent[3] ??
                                                      Colors.transparent,
                                                ),
                                              ),
                                              size: sdpPX(context, 9),
                                              progressColor:
                                                  AppColors.accent[3] ??
                                                      Colors.transparent,
                                              backgroundColor:
                                                  const Color(0xFF2C1A22),
                                              currentValue: 60,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // синий виджет
                                    Visibility(
                                      visible:
                                          controller.currentState.value == 1,
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
                                              width: sdpPX(context, 113),
                                              child: AnimatedProgressBar2(
                                                icon: Transform.translate(
                                                  offset: Offset(
                                                      sdpPX(context, -28), 0),
                                                  child: AppIcons.svgWidget(
                                                    AppIcons
                                                        .leftPartProgressBar,
                                                    height: sdpPX(context, 9),
                                                    color:
                                                        AppColors.accent[4] ??
                                                            Colors.transparent,
                                                  ),
                                                ),
                                                size: sdpPX(context, 9),
                                                progressColor:
                                                    AppColors.accent[4] ??
                                                        Colors.transparent,
                                                backgroundColor:
                                                    const Color(0xFF21274F),
                                                currentValue: 60,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    // серый виджет
                                    Visibility(
                                      visible:
                                          controller.currentState.value == 2,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: sdpPX(context, 17)),
                                        child: Row(
                                          children: [
                                            sdpPX(context, 3).w,
                                            AppIcons.svgWidget(AppIcons.sheeld,
                                                height: sdpPX(context, 26)),
                                            sdpPX(context, 11).w,
                                            SizedBox(
                                              width: sdpPX(context, 113),
                                              child: AnimatedProgressBar2(
                                                icon: Transform.translate(
                                                  offset: Offset(
                                                      sdpPX(context, -28), 0),
                                                  child: AppIcons.svgWidget(
                                                    AppIcons
                                                        .leftPartProgressBar,
                                                    height: sdpPX(context, 9),
                                                    color:
                                                        AppColors.accent[5] ??
                                                            Colors.transparent,
                                                  ),
                                                ),
                                                size: sdpPX(context, 9),
                                                progressColor:
                                                    AppColors.accent[5] ??
                                                        Colors.transparent,
                                                backgroundColor:
                                                    const Color(0xFF312144),
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
                    ),

                    /// микрофон
                    const ButtonAnimator(
                      childWidget: MicrophoneButton(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(Assets.images.welcomeScreenBg),
      fit: BoxFit.fill,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
    );
  }
}
