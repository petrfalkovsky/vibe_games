import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibe_games/ui/shared/ext.dart';
import 'slide_bar_controller.dart';

class SideBar extends StatelessWidget {
  final SideBarController _sideBarController = Get.put(SideBarController());
  final Widget? customContent; // Пользовательский виджет для содержимого

  SideBar({this.customContent, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width + 13;

    return Obx(() {
      final isSideBarOpened = _sideBarController.isSidebarOpened.value;

      return AnimatedPositioned(
        duration: const Duration(milliseconds: 200),
        top: 0,
        bottom: 0,
        left: isSideBarOpened ? 0 : screenWidth - 45,
        right: isSideBarOpened ? 0 : -screenWidth,
        child: Stack(
          children: <Widget>[
            Expanded(
              child: Row(
                children: [
                  860.w,
                  customContent ??
                      Container(), // Вставка пользовательского контента
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
