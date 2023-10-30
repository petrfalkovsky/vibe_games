import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';
import 'package:vibe_games/ui/shared/ext.dart';
import 'slide_bar_controller.dart';

class SideBar extends StatelessWidget {
  final SideBarController _sideBarController = Get.put(SideBarController());
  final Widget? customContent;
  final bool initiallyOpened;

  SideBar({this.customContent, this.initiallyOpened = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width + 13;

    // инициализация состояния сайдбара
    _sideBarController.isSidebarOpened.value = initiallyOpened;

    return Obx(() {
      final isSideBarOpened = _sideBarController.isSidebarOpened.value;

      return AnimatedPositioned(
        duration: const Duration(milliseconds: 250),
        top: 0,
        left: isSideBarOpened ? 0 : screenWidth - 45,
        right: isSideBarOpened ? 0 : -screenWidth,
        child: Column(
          children: <Widget>[
            sdpPX(context, 20).h,
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
