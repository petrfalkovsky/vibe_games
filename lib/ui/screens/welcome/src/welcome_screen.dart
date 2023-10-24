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
                padding: const EdgeInsets.all(24.0),
                child: Stack(
                  children: [
                    // второй контейнер для верхней части cтатус бара
                    const UpperStatusBar(),
                    // контейнер для нижней части cтатус бара
                    Positioned(
                      top: 57,
                      right: 63.4,
                      child: GestureDetector(
                        onTap: controller.toggleVisibleHealthSheeld,
                        child: SizedBox(
                            child: Stack(
                          children: [
                            AppIcons.svgWidget(AppIcons.statusBarFrame),
                            Positioned(
                              top: 44,
                              right: 31,
                              child: Row(
                                children: [
                                  // желтый виджет
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 4,
                                      bottom: 4,
                                      left: 0,
                                    ),
                                    child: Row(
                                      children: [
                                        AppIcons.svgWidget(AppIcons.cup,
                                            width: 26),
                                        12.w,
                                        SizedBox(
                                          width: controller
                                                      .currentState.value ==
                                                  0
                                              ? 250 // ширина, если синий и серый виджеты скрыты
                                              : 98, // ширина по дефолту
                                          child: AnimatedProgressBar(
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
                                      padding: const EdgeInsets.only(left: 17),
                                      child: Row(
                                        children: [
                                          AppIcons.svgWidget(AppIcons.o2,
                                              width: 26),
                                          11.w,
                                          SizedBox(
                                            width: 98,
                                            child: AnimatedProgressBar(
                                              currentValue: 80,
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
                                      padding: const EdgeInsets.only(left: 17),
                                      child: Row(
                                        children: [
                                          3.w,
                                          AppIcons.svgWidget(AppIcons.sheeld,
                                              height: 26),
                                          11.w,
                                          SizedBox(
                                            width: 98,
                                            child: AnimatedProgressBar(
                                              currentValue: 80,
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
                            Positioned(
                              top: 15,
                              right: 23,
                              child: Row(
                                children: [
                                  AppIcons.svgWidget(AppIcons.heart, width: 26),
                                  11.w,
                                  SizedBox(
                                    width: 250,

                                    /// розовый
                                    child: AnimatedProgressBar(
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
                          ],
                        )),
                      ),
                    ),
                    // // микрофон
                    Row(
                      children: [
                        Column(
                          children: [
                            200.h,
                            const ButtonAnimator(
                              childWidget: MicrophoneButton(),
                            ),
                          ],
                        ),
                        const Spacer(),
                      ],
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

class _Title extends StatelessWidget {
  const _Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Text(
        maxLines: 2,
        'welcome_to'.tr(),
        style: AppStyles.headline.andColor(AppColors.accent),
        textAlign: TextAlign.center,
      ),
    );
  }
}
