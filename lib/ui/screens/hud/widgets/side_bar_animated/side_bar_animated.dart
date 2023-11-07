// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';
import 'package:vibe_games/ui/screens/hud/hud_exports.dart';
import 'package:vibe_games/ui/shared/shared_exports.dart';

class SideBarAnimated extends StatefulWidget {
  final BuildContext context;
  const SideBarAnimated({Key? key, required this.context}) : super(key: key);

  @override
  State<SideBarAnimated> createState() => _SideBarAnimatedState();
}

class _SideBarAnimatedState extends State<SideBarAnimated>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> _positionFirstContainer;
  late Animation<double> _positionSecondContainer;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _positionFirstContainer = Tween<double>(
      begin: 0,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.150, curve: Curves.easeOutCubic),
      ),
    );

    _positionSecondContainer = Tween<double>(
      begin: -600,
      end: -600,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.99, curve: Curves.easeOutCubic),
      ),
    );
    _positionFirstContainer.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  void _changeContainerSize(
    double positionFirstContainer,
    double positionSecondContainer,
  ) {
    if (controller.isAnimating) {
      controller.stop();
    }
    setState(() {
      _positionFirstContainer = Tween<double>(
        begin: _positionFirstContainer.value,
        end: positionFirstContainer,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.0, 0.8, curve: Curves.easeOutCubic),
        ),
      );
    });

    setState(() {
      _positionSecondContainer = Tween<double>(
        begin: _positionSecondContainer.value,
        end: positionSecondContainer,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.0, 0.8, curve: Curves.easeOutCubic),
        ),
      );
    });

    controller.reset();
    controller.forward();
  }

  /// базовый контейнер
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HudController>();

    return Stack(children: [
      /// статус бар
      Positioned(
        right: _positionFirstContainer.value,
        top: sdpPX(context, 20),
        child: Column(
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

            // кнопки под статус баром и кнопка для сайдбара
            Padding(
              padding: EdgeInsets.only(top: sdpPX(context, 14)),
              child: Row(
                children: [
                  // кнопки  под статус баром
                  Transform.translate(
                    offset: Offset(sdpPX(context, 3), 0),
                    child: Row(
                      children: [
                        LeanRightButton(
                          useGradient: true,
                          gradientColor1:
                              AppColors.background[1]?.withOpacity(0.2),
                          gradientColor2:
                              AppColors.background[1]?.withOpacity(0.45),
                          height: sdpPX(context, 92),
                          width: sdpPX(context, 99),
                          showBadge: true,
                          isGradientBadge: true,
                          textBadge: 'x2',
                          icon: AppIcons.svgWidget(AppIcons.crown,
                              width: sdpPX(context, 38)),
                        ),
                        sdpPX(context, 15).w,
                        LeanRightButton(
                          useGradient: true,
                          gradientColor1:
                              AppColors.background[1]?.withOpacity(0.2),
                          gradientColor2:
                              AppColors.background[1]?.withOpacity(0.45),
                          height: sdpPX(context, 92),
                          width: sdpPX(context, 99),
                          showBadge: true,
                          icon: AppIcons.svgWidget(AppIcons.cart,
                              width: sdpPX(context, 34)),
                        ),
                        sdpPX(context, 15).w,
                        const GunsButtonBlock(),
                      ],
                    ),
                  ),

                  // кнопка для сайдбара
                  InkWell(
                    onTap: () => handleTap(),
                    child: Padding(
                      padding: EdgeInsets.only(top: sdpPX(context, 0 + 0)),
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
                                        AppColors.background[2] ??
                                            Colors.transparent,
                                        AppColors.background[3] ??
                                            Colors.transparent,
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  transform: Matrix4.skewX(-0.2),
                                  width: sdpPX(context, 46),
                                  height: sdpPX(context, 92),
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    transform: Matrix4.skewX(0.2),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: sdpPX(context, 12)),
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
                                  offset: Offset(
                                      sdpPX(context, 12), sdpPX(context, -16)),
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
                                        borderRadius: BorderRadius.circular(
                                            sdpPX(context, 30)),
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
                            height: sdpPX(context, 92),
                            alignment: Alignment.centerLeft,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // уведомление новое
            const NotificationWidget(),
          ],
        ),
      ),

      /// выдвигающееся окно
      Positioned(
        right: _positionSecondContainer.value,
        top: sdpPX(context, 20),
        child:

            /// первое выдвинувшееся окно сайдбара
            Container(
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
                    padding: EdgeInsets.symmetric(
                        vertical: sdpPX(context, 15),
                        horizontal: sdpPX(context, 20)),
                    borderRadius: sdpPX(context, 12),
                    height: sdpPX(context, 83),
                    width: sdpPX(context, 194),
                    onPressed: () {},
                    text: 'Завершить',
                    fontSize: sdpPX(context, 24),
                    leftIcon: const SizedBox(),
                    rightIcon: const SizedBox(),
                  ),
                  sdpPX(context, 12).w,
                  GradientButton(
                    padding: EdgeInsets.symmetric(
                        vertical: sdpPX(context, 15),
                        horizontal: sdpPX(context, 20)),
                    borderRadius: sdpPX(context, 12),
                    height: sdpPX(context, 83),
                    width: sdpPX(context, 194),
                    onPressed: () => handleTap(),
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
      ),
    ]);
  }

  // счетчик кликов
  int clickCount = 0;

  void handleTap() {
    if (clickCount == 0) {
      // первый клик
      // задвинут первый, выдвинут второй
      _changeContainerSize(
        -400,
        0,
      );
      clickCount = 1;
    } else if (clickCount == 1) {
      // второй клик
      // задвинут второй, выдвинут первый
      _changeContainerSize(
        0,
        -600,
      );
      clickCount = 2;
    } else {
      // третий клик и далее
      // задвинут первый, выдвинут второй
      _changeContainerSize(
        -400,
        0,
      );
      clickCount = 1; // вернуть счетчик на второе состояние
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
