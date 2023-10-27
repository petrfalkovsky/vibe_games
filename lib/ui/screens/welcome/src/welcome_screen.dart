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
    return Scaffold(
      body: Stack(
        children: [
          const _BackgroundImage(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                  top: sdpPX(context, 20), right: sdpPX(context, 22)),
              child: Stack(
                children: [
                  Positioned(top: 500, child: MyAnimatedContainer()),
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
