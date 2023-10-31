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

          /// чат
          CustomScrollbarWidget(),

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
                    SliderButton(
                      icon: AppIcons.svgWidget(AppIcons.avatar, width: 26),
                    ),
                    sdpPX(context, 15).w,
                    SliderButton(
                      icon: AppIcons.svgWidget(AppIcons.radial, width: 34),
                    ),
                    sdpPX(context, 15).w,
                    SliderButton(
                      icon: AppIcons.svgWidget(AppIcons.pad, width: 34),
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
                      children: [
                        // кнопки обычные и со слайдером под картой
                        // todo заменить на лист, тк список динамический
                        Row(
                          children: [
                            /// обычные кнопки
                            SliderButton(
                                icon: AppIcons.svgWidget(AppIcons.avatar,
                                    width: 26)),
                            sdpPX(context, 16).w,
                            SliderButton(
                                icon: AppIcons.svgWidget(AppIcons.radial,
                                    width: 34)),
                            sdpPX(context, 16).w,
                            SliderButton(
                                icon: AppIcons.svgWidget(AppIcons.pad,
                                    width: 34)),
                            sdpPX(context, 16).w,

                            /// кнопка с выдвигающимся инфо
                            AnimatedInfoButton(controller: controller),
                          ],
                        ),
                      ],
                    ),
                  ),

                  /// таймер уведомление
                  Positioned(
                    top: sdpPX(context, 420 + 12),
                    left: sdpPX(context, 47),
                    child: const NotiTimer(),
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
                  const Coordinates()
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

class CustomScrollbarWidget extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  CustomScrollbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 600),
      child: Column(
        children: [
          RawScrollbar(
            controller: _scrollController,
            thumbVisibility: true,
            trackVisibility: true,
            thickness: sdpPX(context, 16),
            radius: Radius.circular(sdpPX(context, 30)),
            trackRadius: Radius.circular(sdpPX(context, 30)),
            trackColor: AppColors.background[8],
            thumbColor: AppColors.background,
            child: Padding(
              padding: EdgeInsets.only(
                  right: sdpPX(context, 32),
                  top: sdpPX(context, 0),
                  bottom: sdpPX(context, 0)),
              child: Container(
                decoration: BoxDecoration(
                  // border: Border.all(
                  //   color: AppColors.background.withOpacity(0.6),
                  //   width: sdpPX(context, 2),
                  // ),
                  color: AppColors.background[8],
                  borderRadius: BorderRadius.circular(sdpPX(context, 30)),
                ),
                height: sdpPX(context, 310),
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context)
                          .copyWith(scrollbars: false),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 400),
                        child: ListTile(
                          title: Text(
                            'Элемент $index',
                            style: TextStyle(color: AppColors.accent),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
