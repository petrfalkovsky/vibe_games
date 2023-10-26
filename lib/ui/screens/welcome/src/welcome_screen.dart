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
                    Positioned(
                      top: sdpPX(context, 58),
                      right: sdpPX(context, 11),
                      child: GestureDetector(
                        onTap: controller.toggleVisibleHealthSheeld,
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

                                    /// розовый
                                    child: AnimatedProgressBar(
                                      size: sdpPX(context, 10.5),
                                      currentValue: 60,
                                      backgroundColor: AppColors.accent[2]
                                              ?.withOpacity(0.2) ??
                                          Colors.transparent,
                                      progressColor: AppColors.accent[2] ??
                                          Colors.transparent,
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
                                          child: AnimatedProgressBar(
                                            size: sdpPX(context, 10.5),
                                            // наполненность прогресса
                                            currentValue: 30,
                                            backgroundColor: AppColors.accent[3]
                                                    ?.withOpacity(0.2) ??
                                                Colors.transparent,
                                            progressColor:
                                                AppColors.accent[3] ??
                                                    Colors.transparent,
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
                                            width: sdpPX(context, 113),
                                            child: AnimatedProgressBar(
                                              size: sdpPX(context, 10.5),
                                              currentValue: sdpPX(context, 80),
                                              backgroundColor: AppColors
                                                      .accent[4]
                                                      ?.withOpacity(0.2) ??
                                                  Colors.transparent,
                                              progressColor:
                                                  AppColors.accent[4] ??
                                                      Colors.transparent,
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
                                      padding: EdgeInsets.only(
                                          left: sdpPX(context, 17)),
                                      child: Row(
                                        children: [
                                          sdpPX(context, 3).w,
                                          AppIcons.svgWidget(AppIcons.sheeld,
                                              height: sdpPX(context, 26)),
                                          sdpPX(context, 12).w,
                                          SizedBox(
                                            width: sdpPX(context, 113),
                                            child: AnimatedProgressBar(
                                              size: sdpPX(context, 10.5),
                                              currentValue: sdpPX(context, 80),
                                              backgroundColor: AppColors
                                                      .accent[5]
                                                      ?.withOpacity(0.2) ??
                                                  Colors.transparent,
                                              progressColor:
                                                  AppColors.accent[5] ??
                                                      Colors.transparent,
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
