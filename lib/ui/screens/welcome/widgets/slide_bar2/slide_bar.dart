import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';
import 'package:vibe_games/ui/shared/ext.dart';
import 'slide_bar_controller.dart';

class SideBar2 extends StatelessWidget {
  final SideBar2Controller _sideBar2Controller = Get.put(SideBar2Controller());
  final Widget? customContent;
  final bool initiallyOpened;

  SideBar2({this.customContent, this.initiallyOpened = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width + 13;

    // Инициализация состояния сайдбара
    _sideBar2Controller.isSidebarOpened.value = initiallyOpened;

    return Obx(() {
      final isSideBarOpened = _sideBar2Controller.isSidebarOpened.value;

      return AnimatedPositioned(
        duration: const Duration(milliseconds: 250),
        top: 0,
        bottom: 0,
        left: isSideBarOpened ? 0 : screenWidth - 45,
        right: isSideBarOpened ? 0 : -screenWidth,
        child: Column(
          children: <Widget>[
            sdpPX(context, 50).h,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                customContent ?? Container(),
              ],
            ),
          ],
        ),
      );
    });
  }
}
