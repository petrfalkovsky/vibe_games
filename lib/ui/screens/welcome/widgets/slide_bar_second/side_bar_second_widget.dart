import 'package:flutter/material.dart';
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';
import 'package:vibe_games/ui/screens/welcome/welcome_exports.dart';
import 'package:vibe_games/ui/shared/exports_shared.dart';

class SideBarSecondWidget extends StatelessWidget {
  const SideBarSecondWidget({
    super.key,
    required this.sideBarController,
    required this.sideBar2Controller,
  });

  final SideBarController sideBarController;
  final SideBarSecondController sideBar2Controller;

  @override
  Widget build(BuildContext context) {
    return SideBarSecond(
      initiallyOpened: false,
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
    );
  }
}
