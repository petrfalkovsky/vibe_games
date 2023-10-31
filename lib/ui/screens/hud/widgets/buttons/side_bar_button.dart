import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';
import 'package:vibe_games/ui/screens/hud/hud_exports.dart';
import 'package:vibe_games/ui/shared/shared_exports.dart';

class SideBarButton extends StatelessWidget {
  const SideBarButton({
    super.key,
    required this.sideBarController,
    required this.sideBar2Controller,
    required this.controller,
  });

  final SideBarController sideBarController;
  final SideBarSecondController sideBar2Controller;
  final HudController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          sideBarController.toggleSidebar(forceValue: false);
          sideBar2Controller.toggleSidebar(forceValue: true);

          // переключение видимости кнопки сайдбара в зависимости от состояния
          // controller.togglePositionedVisibility();
        },
        child: Visibility(
          visible: controller.isPositionedVisible.value,
          child: Padding(
            padding: EdgeInsets.only(top: sdpPX(context, 166 + 16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    Transform.translate(
                      offset: Offset(sdpPX(context, 26), 0),
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
                        width: sdpPX(context, 46),
                        height: sdpPX(context, 88),
                        alignment: Alignment.centerLeft,
                        child: Container(
                          transform: Matrix4.skewX(0.2),
                          child: Padding(
                            padding: EdgeInsets.only(left: sdpPX(context, 12)),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: AppColors.accent,
                              size: sdpPX(context, 28.5),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: sdpPX(context, 4),
                      left: sdpPX(context, 4),
                      child: Transform.translate(
                        offset: Offset(sdpPX(context, 12), sdpPX(context, -16)),
                        child: Container(
                            width: sdpPX(context, 26),
                            height: sdpPX(context, 26),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFFB11414),
                                  Color(0xFFED3333),
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                              borderRadius:
                                  BorderRadius.circular(sdpPX(context, 30)),
                            ),
                            child: Center(
                                child: Text(
                              '!',
                              style: TextStyle(
                                color: AppColors.accent,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'TTNorms',
                                fontSize: sdpPX(context, 18),
                              ),
                            ))),
                      ),
                    ),
                  ],
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
                  width: sdpPX(context, 12),
                  height: sdpPX(context, 88),
                  alignment: Alignment.centerLeft,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
