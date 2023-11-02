import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';
import 'package:vibe_games/ui/screens/hud/hud_exports.dart';
import 'package:vfx_flutter_common/getx_helpers.dart';
import 'package:vibe_games/ui/shared/shared_exports.dart';

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

          /// спидометр
          const Speedometer(),

          /// поворотники
          const TurnSigns(),

          /// чат
          const Chat(),

          /// кнопка для сайдбара
          SideBarButton(
            sideBarController: sideBarController,
            sideBar2Controller: sideBar2Controller,
            controller: controller,
          ),

          Positioned(
            top: sdpPX(context, 166 + 16),
            right: sdpPX(context, 32 + 23),
            child: Column(
              children: [
                // кнопки обычные и со слайдером под картой
                Row(
                  children: [
                    /// обычные кнопки
                    LeanRightButton(
                      icon: AppIcons.svgWidget(AppIcons.crown,
                          width: sdpPX(context, 38)),
                    ),
                    sdpPX(context, 15).w,
                    LeanRightButton(
                      icon: AppIcons.svgWidget(AppIcons.cart,
                          width: sdpPX(context, 34)),
                    ),
                    sdpPX(context, 15).w,
                    LeanRightButton(
                      icon: AppIcons.svgWidget(AppIcons.car,
                          width: sdpPX(context, 42)),
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// уведомления новые
          Positioned(
            top: sdpPX(context, 270 + 12),
            right: sdpPX(context, 78),
            child: const NotificationWidget(),
          ),

          // cтатус бар
          SideBar(
            initiallyOpened: true,
            customContent: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // контейнер для верхней части cтатус бара
                Padding(
                  padding: EdgeInsets.only(right: sdpPX(context, 19.4)),
                  child: const UpperStatusBar(),
                ),

                // контейнер для нижней части cтатус бара
                Padding(
                  padding: EdgeInsets.only(right: sdpPX(context, 30)),
                  child: LowerStatusBar(
                    controller: controller,
                  ),
                ),
              ],
            ),
          ),

          /// первое выдвинувшееся окно сайдбара
          SideBarSecondWidget(
            sideBarController: sideBarController,
            sideBar2Controller: sideBar2Controller,
          ),

          /// остальная часть экрана
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                top: sdpPX(context, 20),
                bottom: sdpPX(context, 32),
                right: sdpPX(context, 22),
                left: sdpPX(context, 38),
              ),
              child: Stack(
                children: [
                  // кнопки обычные и со слайдером под картой
                  Positioned(
                    top: sdpPX(context, 332),
                    left: sdpPX(context, 47),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // кнопки обычные и со слайдером под картой
                        // todo заменить на лист, тк список динамический
                        Row(
                          children: [
                            /// обычные кнопки
                            LeanRightButton(
                                icon: AppIcons.svgWidget(AppIcons.avatar,
                                    width: sdpPX(context, 31))),
                            sdpPX(context, 16).w,
                            LeanRightButton(
                                icon: AppIcons.svgWidget(AppIcons.radial,
                                    width: sdpPX(context, 42))),
                            sdpPX(context, 16).w,
                            LeanRightButton(
                                icon: AppIcons.svgWidget(AppIcons.pad,
                                    width: sdpPX(context, 40))),
                            sdpPX(context, 16).w,

                            /// кнопка с выдвигающимся инфо
                            AnimatedInfoButton(controller: controller),
                          ],
                        ),

                        /// таймер уведомление
                        const NotiTimer(),

                        /// звонок
                        const Call(),
                      ],
                    ),
                  ),

                  /// кнопка микрофон
                  Positioned(
                    top: sdpPX(context, 360),
                    right: sdpPX(context, 310),
                    child: const MicrophoneButton(),
                  ),

                  /// кнопка чата
                  Positioned(
                    top: sdpPX(context, -126),
                    left: sdpPX(context, 28),
                    child: const ChatButtonWrapper(),
                  ),

                  /// координаты, время, расстояние
                  const Coordinates(),
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
    return Container();

    // Image(
    //   image: AssetImage(Assets.images.welcomeScreenBg),
    //   fit: BoxFit.fill,
    //   width: MediaQuery.of(context).size.width,
    //   height: MediaQuery.of(context).size.height,
    // );
  }
}
