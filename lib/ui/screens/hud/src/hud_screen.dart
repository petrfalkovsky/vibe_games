import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';

import 'package:vfx_flutter_common/getx_helpers.dart';
import 'package:vibe_games/ui/screens/hud/hud_exports.dart';
import 'package:vibe_games/ui/screens/hud/widgets/call_animated/call_animated.dart';
import 'package:vibe_games/ui/shared/shared_exports.dart';

class HudScreen extends StatexWidget<HudController> {
  HudScreen({Key? key}) : super(() => HudController(), key: key) {
    debugPrint('welcome_screen');
  }

  @override
  Widget buildWidget(BuildContext context) {
    final controller = Get.find<HudController>();

    return Scaffold(
      body: Stack(
        children: [
          const _BackgroundImage(),

          /// спидометр
          const Speedometer(),

          /// поворотники
          const TurnSignsButton(),

          /// чат
          const Chat(),

          /// анимимрованный сайд бар со статус баром внутри (правая часть худа с хилками и тп)
          SideBarAnimated(context: context),

          // звонок
          CallAnimated(context: context),

          // кнопки обычные под картой
          Positioned(
            top: sdpPX(context, 332 + 20),
            left: sdpPX(context, 47 + 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // кнопки обычные и со слайдером под картой
                // todo заменить на лист, тк список кнопок динамический
                UnderMapButtonsBlock(controller: controller),

                // таймер уведомление
                const NotiTimer(),
              ],
            ),
          ),

          // кнопка микрофон
          Positioned(
            top: sdpPX(context, 360),
            right: sdpPX(context, 310),
            child: const MicrophoneButton(),
          ),

          // кнопка чата
          Positioned(
            top: sdpPX(context, -126 + 20),
            left: sdpPX(context, 34),
            child: const ChatButtonWrapper(),
          ),

          // координаты, время, расстояние
          const Coordinates(),
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
