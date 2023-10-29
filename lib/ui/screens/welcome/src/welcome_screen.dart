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
import 'package:vibe_games/ui/screens/welcome/widgets/slide_bar/slide_bar.dart';
import 'package:vibe_games/ui/screens/welcome/widgets/slide_bar/slide_bar_controller.dart';
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

    return Scaffold(
      body: Stack(
        children: [
          const _BackgroundImage(),

          /// кнопка для слайдбара
          GestureDetector(
            onTap: () {
              sideBarController.toggleSidebar();
              // Переключение видимости в зависимости от состояния
              controller.togglePositionedVisibility();
            },
            child: Obx(
              () => Visibility(
                visible: controller.isPositionedVisible.value,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    sdpPX(context, 428).h,
                    Transform.translate(
                      offset: const Offset(15, 0),
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
                        width: 30,
                        height: sdpPX(context, 88),
                        alignment: Alignment.centerLeft,
                        child: Container(
                          transform: Matrix4.skewX(0.2),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: AppColors.accent,
                              size: sdpPX(context, 28.5),
                            ),
                          ),
                        ),
                      ),
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
                      width: 10,
                      height: sdpPX(context, 88),
                      alignment: Alignment.centerLeft,
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// слайдбар
          SideBar(
            customContent: Container(
              height: sdpPX(context, 300),
              width: sdpPX(context, 300),
              padding: EdgeInsets.symmetric(horizontal: sdpPX(context, 20)),
              color: const Color(0xFF262AAA),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Sidebar example",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  50.h,
                  TextButton(
                    onPressed: () {
                      sideBarController.toggleSidebar();
                      controller.togglePositionedVisibility();
                    },
                    child: const Text('кнопка'),
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
          // пока на него вся надежда
          // const Positioned(
          //   left: 100,
          //   top: 100,
          //   child: MyExpansionPanel(),
          // ),
          // HorizontalExpansionTile(
          //   title: const Text('Expandable Content'),
          //   children: const <Widget>[
          //     Text('Child Widget 1'),
          //     Text('Child Widget 2'),
          //     // Добавьте дополнительные виджеты, как вам нужно.
          //   ],
          // ),
          // Positioned(
          //   top: 300,
          //   left: 100,
          //   child: Transform.rotate(
          //     angle: 11,
          //     child: SizedBox(
          //       width: 100,
          //       height: 200,
          //       child: Expanded(
          //         flex: 5,
          //         child: Stack(
          //           children: [
          //             Positioned(
          //               top: 0,
          //               left: 0,
          //               child: Transform.rotate(
          //                 angle: -11,
          //                 child: Padding(
          //                   padding: const EdgeInsets.only(top: 16),
          //                   child: SliderButton(
          //                     icon: AppIcons.svgWidget(AppIcons.pad, width: 34),
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             ExpansionTile(
          //               collapsedIconColor: Colors.transparent,
          //               iconColor: Colors.transparent,
          //               subtitle: null,
          //               leading: null,
          //               trailing: null,
          //               title: const Text(''),
          //               children: <Widget>[
          //                 ListView(
          //                   shrinkWrap: true,
          //                   children: <Widget>[
          //                     Transform.translate(
          //                         offset: const Offset(-18, -20),
          //                         child: Transform.rotate(
          //                             angle: -11,
          //                             child: ButtonAnimator(
          //                               child: Container(
          //                                 width: sdpPX(context, 95),
          //                                 height: sdpPX(context, 88),
          //                                 // искривление для всего контейнера (дети тоже искривляются)
          //                                 transform: Matrix4.skewX(-0.2),
          //                                 decoration: BoxDecoration(
          //                                   border: Border.all(
          //                                     color: AppColors.background,
          //                                   ),
          //                                   color: AppColors.background[1]
          //                                       ?.withOpacity(0.25),
          //                                   borderRadius: BorderRadius.circular(
          //                                       sdpPX(context, 6)),
          //                                 ),
          //                               ),
          //                             ))),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),

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
