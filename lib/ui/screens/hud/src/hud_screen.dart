import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';
import 'package:vibe_games/ui/screens/hud/hud_exports.dart';
import 'package:vfx_flutter_common/getx_helpers.dart';
import 'package:vibe_games/ui/screens/hud/widgets/buttons/side_bar_battun.dart';
import 'package:vibe_games/ui/shared/exports_shared.dart';

class HudScreen extends StatexWidget<HudController> {
  HudScreen({Key? key}) : super(() => HudController(), key: key) {
    debugPrint('welcome_screen'.tr());
  }

  @override
  Widget buildWidget(BuildContext context) {
    final controller = Get.find<HudController>();
    final sideBarController = Get.put(SideBarController());
    final sideBar2Controller = Get.put(SideBarSecondController());

    return Scaffold(
      body: Stack(
        children: [
          const _BackgroundImage(),

          /// кнопка для слайдбара
          SideBarButton(
            sideBarController: sideBarController,
            sideBar2Controller: sideBar2Controller,
            controller: controller,
          ),

          // cтатус бар
          SideBar(
            initiallyOpened: true,
            customContent: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // контейнер для верхней части cтатус бара
                Padding(
                  padding: EdgeInsets.only(right: sdpPX(context, 11)),
                  child: const UpperStatusBar(),
                ),

                // контейнер для нижней части cтатус бара
                Padding(
                  padding: EdgeInsets.only(right: sdpPX(context, 22)),
                  child: LowerStatusBar(
                    controller: controller,
                  ),
                ),
              ],
            ),
          ),

          /// первое выдвинувшееся окно слайдбара
          SideBarSecondWidget(
            sideBarController: sideBarController,
            sideBar2Controller: sideBar2Controller,
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

                        /// кнопка с выдвигающимся инфо
                        AnimatedInfoButton(controller: controller),
                      ],
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
