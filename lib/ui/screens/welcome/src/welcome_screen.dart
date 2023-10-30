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
import 'package:vibe_games/ui/screens/welcome/widgets/buttons/gradient_button.dart';
import 'package:vibe_games/ui/screens/welcome/widgets/slide_bar/slide_bar.dart';
import 'package:vibe_games/ui/screens/welcome/widgets/slide_bar/slide_bar_controller.dart';
import 'package:vibe_games/ui/screens/welcome/widgets/slide_bar2/slide_bar.dart';
import 'package:vibe_games/ui/screens/welcome/widgets/slide_bar2/slide_bar_controller.dart';
import 'package:vibe_games/ui/shared/all_shared.dart';
import 'package:vibe_games/ui/shared/button_animator.dart';
import 'package:vibe_games/ui/shared/constants/app_colors.dart';
import 'package:vibe_games/ui/shared/constants/assets.dart';
import 'package:vibe_games/ui/shared/widgets/animated_progress_bar.dart';
import 'package:vibe_games/ui/shared/widgets/animated_progress_bar2.dart';
import 'package:vibe_games/ui/shared/widgets/animated_progress_bar3.dart';
import 'package:vibe_games/ui/shared/widgets/std_button.dart';
import 'package:vibe_games/ui/shared/widgets/std_input.dart';
import 'package:vfx_flutter_common/getx_helpers.dart';

class WelcomeScreen extends StatexWidget<WelcomeController> {
  WelcomeScreen({Key? key}) : super(() => WelcomeController(), key: key) {
    debugPrint('welcome_screen'.tr());
  }

  @override
  Widget buildWidget(BuildContext context) {
    final controller = Get.find<WelcomeController>();
    final sideBarController = Get.put(SideBarController());
    final sideBar2Controller = Get.put(SideBar2Controller());

    return Scaffold(
      body: Stack(
        children: [
          const _BackgroundImage(),

          /// кнопка для слайдбара
          Obx(
            () => GestureDetector(
              onTap: () {
                sideBarController.toggleSidebar(forceValue: false);

                // переключение видимости кнопки сайдбара в зависимости от состояния
                // controller.togglePositionedVisibility();
              },
              child: Visibility(
                visible: controller.isPositionedVisible.value,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    sdpPX(context, 428).h,
                    Stack(
                      children: [
                        Transform.translate(
                          offset: Offset(sdpPX(context, 16), 0),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.background[2] ?? Colors.transparent,
                                  AppColors.background[3] ?? Colors.transparent,
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            transform: Matrix4.skewX(-0.2),
                            width: sdpPX(context, 36),
                            height: sdpPX(context, 88),
                            alignment: Alignment.centerLeft,
                            child: Container(
                              transform: Matrix4.skewX(0.2),
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: sdpPX(context, 12)),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: AppColors.accent,
                                  size: sdpPX(context, 28.5),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: sdpPX(context, 1),
                          left: sdpPX(context, 1),
                          child: Transform.translate(
                            offset: Offset(0, sdpPX(context, -16)),
                            child: Container(
                                width: sdpPX(context, 26),
                                height: sdpPX(context, 26),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFFB11414),
                                      Color(0xFFED3333),
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                  borderRadius:
                                      BorderRadius.circular(sdpPX(context, 30)),
                                ),
                                child: Center(
                                    child: Text(
                                  '!',
                                  style: TextStyle(
                                    color: AppColors.accent,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'TTNorms',
                                    fontSize: sdpPX(context, 18),
                                  ),
                                ))),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.background[2] ?? Colors.transparent,
                            AppColors.background[3] ?? Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      width: sdpPX(context, 12),
                      height: sdpPX(context, 88),
                      alignment: Alignment.centerLeft,
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// первое выдвинувшееся окно слайдбара
          SideBar(
            initiallyOpened: true,
            customContent: Container(
              padding: EdgeInsets.all(sdpPX(context, 30)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(sdpPX(context, 20)),
                    bottomLeft: Radius.circular(sdpPX(context, 20))),
                gradient: LinearGradient(colors: [
                  AppColors.background[5] ?? Colors.transparent,
                  AppColors.background[6] ?? Colors.transparent,
                ], begin: Alignment.centerRight, end: Alignment.centerLeft),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Общественная помощь",
                    style: TextStyle(
                        color: AppColors.accent,
                        fontSize: sdpPX(context, 28),
                        fontFamily: AppStyles.ttNorms,
                        fontWeight: FontWeight.w500),
                  ),
                  sdpPX(context, 23).h,
                  Text(
                    "Проедь 1 полный круг на автобусном\nмаршруте",
                    style: TextStyle(
                      color: AppColors.accent,
                      fontSize: sdpPX(context, 22),
                    ),
                  ),
                  sdpPX(context, 21).h,
                  Row(
                    children: [
                      GradientButton(
                        height: sdpPX(context, 83),
                        width: sdpPX(context, 194),
                        onPressed: () {
                          sideBarController.toggleSidebar();
                          // controller.togglePositionedVisibility();
                        },
                        text: 'Завершить',
                        fontSize: sdpPX(context, 24),
                        leftIcon: const SizedBox(),
                        rightIcon: const SizedBox(),
                      ),
                      sdpPX(context, 12).w,
                      GradientButton(
                        height: sdpPX(context, 83),
                        width: sdpPX(context, 194),
                        onPressed: () async {
                          sideBarController.toggleSidebar(forceValue: false);
                          sideBar2Controller.toggleSidebar(forceValue: false);

                          // controller.togglePositionedVisibility();
                        },
                        text: 'Свернуть',
                        fontSize: sdpPX(context, 24),
                        leftIcon: const SizedBox(),
                        rightIcon: Padding(
                          padding: EdgeInsets.only(
                              left: sdpPX(context, 4), top: sdpPX(context, 2)),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.accent,
                            size: sdpPX(context, 28.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          /// второе выдвинувшееся окно слайдбара
          SideBar2(
            initiallyOpened: false,
            customContent: Container(
              padding: EdgeInsets.all(sdpPX(context, 60)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(sdpPX(context, 20)),
                    bottomLeft: Radius.circular(sdpPX(context, 20))),
                gradient: LinearGradient(colors: [
                  AppColors.background[5]?.withOpacity(0.3) ??
                      Colors.transparent,
                  AppColors.background[6] ?? Colors.transparent,
                ], begin: Alignment.centerRight, end: Alignment.centerLeft),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Общественная помощь",
                    style: TextStyle(
                        color: AppColors.accent,
                        fontSize: sdpPX(context, 28),
                        fontFamily: AppStyles.ttNorms,
                        fontWeight: FontWeight.w500),
                  ),
                  sdpPX(context, 23).h,
                  Text(
                    "Проедь 1 полный круг на автобусном\nмаршруте",
                    style: TextStyle(
                      color: AppColors.accent,
                      fontSize: sdpPX(context, 22),
                    ),
                  ),
                  sdpPX(context, 21).h,
                  Row(
                    children: [
                      GradientButton(
                        height: sdpPX(context, 83),
                        width: sdpPX(context, 194),
                        onPressed: () {
                          sideBarController.toggleSidebar(forceValue: false);
                          sideBar2Controller.toggleSidebar(forceValue: false);
                          // controller.togglePositionedVisibility();
                        },
                        text: 'Завершить',
                        fontSize: sdpPX(context, 24),
                        leftIcon: const SizedBox(),
                        rightIcon: const SizedBox(),
                      ),
                      sdpPX(context, 12).w,
                      GradientButton(
                        height: sdpPX(context, 83),
                        width: sdpPX(context, 194),
                        onPressed: () async {
                          sideBarController.toggleSidebar(forceValue: true);
                          sideBar2Controller.toggleSidebar(forceValue: false);

                          // controller.togglePositionedVisibility();
                        },
                        text: 'Свернуть',
                        fontSize: sdpPX(context, 24),
                        leftIcon: const SizedBox(),
                        rightIcon: Padding(
                          padding: EdgeInsets.only(
                              left: sdpPX(context, 4), top: sdpPX(context, 2)),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.accent,
                            size: sdpPX(context, 28.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          /// кнопка с выдвигающимся инфо
          Obx(
            () => Positioned(
              top: 400,
              left: 100,
              child: SizedBox(
                height: sdpPX(context, 88),
                child: AnimatedProgressBar3(
                  progressBarBorder: Border.all(
                    color: AppColors.background,
                  ),
                  borderRadius: BorderRadius.circular(8),
                  backgroundColor: Colors.transparent,
                  progressColor: AppColors.background[1]?.withOpacity(0.2) ??
                      Colors.transparent,
                  height: sdpPX(context, 88),
                  width: 500,
                  currentValue: controller.isOpen.value
                      ? controller.openedState.value.toDouble()
                      : controller.closedState.value.toDouble(),
                  frontContent: GestureDetector(
                    onTap: () => controller.toggleIsOpen(),
                    child: SliderButton(
                      icon: AppIcons.svgWidget(AppIcons.pad, width: 34),
                    ),
                  ),
                ),
              ),
            ),
          ),

          /// остальная часть экрана
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                  top: sdpPX(context, 20), right: sdpPX(context, 22)),
              child: Stack(
                children: [
                  // кнопка со слайдером под картой
                  Positioned(
                    top: sdpPX(context, 332),
                    left: sdpPX(context, 47),
                    child: Row(
                      children: [
                        SliderButton(
                          icon: AppIcons.svgWidget(AppIcons.avatar, width: 26),
                        ),
                        sdpPX(context, 16).w,
                        SliderButton(
                          icon: AppIcons.svgWidget(AppIcons.radial, width: 34),
                        ),
                        sdpPX(context, 16).w,
                        SliderButton(
                          icon: AppIcons.svgWidget(AppIcons.pad, width: 34),
                        ),
                        sdpPX(context, 16).w,
                        // кнопка будет открывать список справа, просто чтобы посмотреть длинну
                        const SliderButton(
                          icon: Icon(Icons.plus_one,
                              color: Colors.white, size: 34),
                        ),
                      ],
                    ),
                  ),

                  // контейнер для верхней части cтатус бара
                  const Positioned(
                    right: 0,
                    child: UpperStatusBar(),
                  ),
                  // контейнер для нижней части cтатус бара
                  Positioned(
                    top: sdpPX(context, 58),
                    right: sdpPX(context, 11),
                    child: LowerStatusBar(
                      controller: controller,
                    ),
                  ),
                  // кнопка микрофон
                  Positioned(
                    top: sdpPX(context, 360),
                    right: sdpPX(context, 310),
                    child: const MicrophoneButton(),
                  ),
                ],
              ),
            ),
          ),
        ],
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
