// ignore_for_file: unused_element

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';
import 'package:vibe_games/ui/shared/shared_exports.dart';

class CallStaggeredAnimationWidget extends StatelessWidget {
  CallStaggeredAnimationWidget({
    super.key,
    required this.controller,
    required this.isCloseLeftArrow,
    required this.textOpen,
    required this.widthInfo,
    required this.context,
    required this.isThirdState,
  })  :

// Каждая анимация, определенная здесь, преобразует свое значение в течение подмножества
// длительности контроллера, определяемой интервалом анимации.
// Например, анимация непрозрачности преобразует свое значение во время
// первых 10% времени работы контроллера.

        /// прозрачность первого шага от и до
        opacity = Tween<double>(
          begin: 1.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.0,
              0.100,
              curve: Curves.easeOutCubic,
            ),
          ),
        ),

        /// ширина первого шага от и до
        width = Tween<double>(
          begin: 188.0,
          end: isThirdState ? 544 : widthInfo,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.125,
              0.250,
              curve: Curves.easeOutCubic,
            ),
          ),
        ),

        /// высота первого шага от и до
        height = Tween<double>(begin: 140.0, end: 124.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.250,
              0.375,
              curve: Curves.easeOutCubic,
            ),
          ),
        ),

        /// паддинги первого шага
        padding = EdgeInsetsTween(
          begin: EdgeInsets.only(
              left: sdpPX(context, 20), right: sdpPX(context, 12)),
          end: EdgeInsets.only(
              left: sdpPX(context, 12), right: sdpPX(context, 20)),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.250,
              0.375,
              curve: Curves.easeOutCubic,
            ),
          ),
        ),
        textOpacity = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.500,
              0.750,
              curve: Curves.easeOutCubic,
            ),
          ),
        ),
        iconOpacity = Tween<double>(
          begin: 1.0,
          end: 0.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.500,
              0.750,
              curve: Curves.easeOutCubic,
            ),
          ),
        ),
        thirdStateOpacity = Tween<double>(
          begin: isThirdState ? 1.0 : 0,
          end: 0.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.500,
              0.750,
              curve: Curves.easeOutCubic,
            ),
          ),
        );

  /// переменные для анимации в виджете анимации
  final Animation<double> controller;
  final Animation<double> opacity;
  final Animation<double> width;
  final Animation<double> height;
  final Animation<EdgeInsets> padding;
  final Animation<double> textOpacity;
  final Animation<double> iconOpacity;
  final Animation<double> thirdStateOpacity;

  /// переменные третьего состония
  final bool isThirdState;

  /// передаю в место использования виджета
  final bool isCloseLeftArrow;
  final Widget textOpen;
  final double widthInfo;

  /// контекст, чтобы использовать в паддинге sdp
  final BuildContext context;

// Эта функция вызывается каждый раз, когда контроллер "помечает" новый кадр.
// Когда он запустится, все значения анимации будут равны
// обновлено, чтобы отразить текущее значение контроллера.
  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Opacity(
        opacity: opacity.value,
        child: Container(
          width: sdpPX(context, width.value),
          height: sdpPX(context, height.value),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.accent[7] ?? Colors.transparent,
                AppColors.accent[8]?.withOpacity(0.9) ?? Colors.transparent,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(sdpPX(context, 100)),
          ),
          child: Stack(
            children: [
              Padding(
                padding: padding.value,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ClipOval(
                        child: Image.asset(
                          AppIcons.callAvatar,
                          width: sdpPX(context, 100),
                          height: sdpPX(context, 100),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // текст внутри (имя, фамилия)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Opacity(
                        opacity: textOpacity.value,
                        child: Padding(
                          padding: EdgeInsets.only(left: sdpPX(context, 126)),
                          child: Container(
                            child: textOpen,
                          ),
                        ),
                      ),
                    ),

                    // кнопка положить трубку
                    Align(
                      alignment: Alignment.centerRight,
                      child: Opacity(
                        opacity: isThirdState
                            ? thirdStateOpacity.value
                            : textOpacity.value,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            /// положить трубку и счетчик времени
                            ButtonAnimator(
                              child: Container(
                                width: sdpPX(context, 84),
                                height: sdpPX(context, 84),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.background[9] ??
                                      Colors.transparent,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AppIcons.svgWidget(
                                      AppIcons.callSkip,
                                      width: sdpPX(context, 35.5),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: sdpPX(context, 13)),
                                      child: Text(
                                        '01:34',
                                        style: TextStyle(
                                          color: AppColors.accent,
                                          fontSize: sdpPX(context, 20),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: AppStyles.ttNorms,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // кнопка положить трубку
                    Align(
                      alignment: Alignment.centerRight,
                      child: Opacity(
                        opacity: isThirdState
                            ? textOpacity.value
                            : thirdStateOpacity.value,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            /// положить трубку и счетчик времени
                            ButtonAnimator(
                              child: Container(
                                width: sdpPX(context, 84),
                                height: sdpPX(context, 84),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.background[9] ??
                                      Colors.transparent,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AppIcons.svgWidget(
                                      AppIcons.callSkip,
                                      width: sdpPX(context, 44.5),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // кнопка ответить на звонок
                            Padding(
                              padding:
                                  EdgeInsets.only(left: sdpPX(context, 12)),
                              child: ButtonAnimator(
                                child: Container(
                                  width: sdpPX(context, 84),
                                  height: sdpPX(context, 84),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.background[10] ??
                                        Colors.transparent,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AppIcons.svgWidget(
                                        AppIcons.callAnswer,
                                        width: sdpPX(context, 35.5),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // фон затемняющий миниатюру
              Opacity(
                opacity: iconOpacity.value,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(sdpPX(context, 100)),
                    gradient: LinearGradient(
                      colors: [
                        AppColors.background[2]?.withOpacity(0.6) ??
                            Colors.transparent,
                        AppColors.background[2]?.withOpacity(0.3) ??
                            Colors.transparent,
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                  ),
                ),
              ),

              // иконка раскрыть
              Padding(
                padding: padding.value,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Opacity(
                    opacity: iconOpacity.value,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.accent,
                      size: sdpPX(context, 36),
                    ),
                  ),
                ),
              ),

              // таймер разговора
              Padding(
                padding: padding.value,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Opacity(
                    opacity: iconOpacity.value,
                    child: Padding(
                      padding: EdgeInsets.only(left: sdpPX(context, 26)),
                      child: Text(
                        '01:34',
                        style: TextStyle(
                          color: AppColors.accent,
                          fontSize: sdpPX(context, 20),
                          fontWeight: FontWeight.w500,
                          fontFamily: AppStyles.ttNorms,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}

class CallStaggeredAnimated extends StatefulWidget {
  final Widget icon;
  final bool isCloseLeftArrow;
  final Widget textOpen;
  final double widthInfo;

  const CallStaggeredAnimated({
    super.key,
    required this.icon,
    required this.isCloseLeftArrow,
    required this.textOpen,
    required this.widthInfo,
  });

  @override
  State<CallStaggeredAnimated> createState() => _CallStaggeredAnimatedState();
}

class _CallStaggeredAnimatedState extends State<CallStaggeredAnimated>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  bool isForward = true;

  // управление состоянием
  bool isThirdState = true;
  bool firstClick = true;

  // переменные для проверки закрытия по таймеру
  Timer? animationTimer;
  bool isOpening = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      value: 1,
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    // запускаем анимацию, чтобы закрыть открытое инфо окно (иначе, если  value: 0,
    // в котроллере, то анимация срабатывает со второго таба)
    // с value: 0, такого поведения нет
    // _playAnimation();
    // _InitialPlayAnimation();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        isForward = true; // Анимация закончена и виджет открыт
      } else if (status == AnimationStatus.dismissed) {
        isForward = false; // Анимация отменена и виджет закрыт
      }
    });
  }

// при закрытии виджета отменяем таймер
  @override
  void dispose() {
    if (animationTimer != null) {
      animationTimer!.cancel();
    }
    _controller.dispose();
    super.dispose();
  }

// метод для начальной проверки и установки таймера

  Future<void> _initialPlayAnimation() async {
    animationTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (isForward && !isOpening) {
        // если анимация открыта и не открывалась в текущем интервале,
        // отключаем текущий таймер
        timer.cancel();
        // запускаем новый таймер через 3 секунды для закрытия анимации
        Timer(const Duration(seconds: 1), () {
          try {
            _controller.reverse().orCancel;
            isForward = true;
          } on TickerCanceled {
            // анимация была отменена
          }
        });
        isOpening = true; // анимация была открыта в этом интервале
      }
    });
  }

// Метод для обнуления флага isOpening
  void _resetIsOpening() {
    isOpening = false;
  }

  Future<void> _playAnimation() async {
    if (isThirdState) {
      // если это третье состояние, меняем isThirdState на false
      isThirdState = false;

      // setState для перерисовки виджета
      setState(() {});
    }

    try {
      if (_controller.isAnimating) {
        _controller.stop();
      } else if (isForward) {
        if (firstClick) {
          // задержка только после первого клика
          firstClick = false;
          Timer(const Duration(seconds: 3), () {
            _controller.reverse().orCancel;
            isForward = false;
          });
        } else {
          _controller.reverse().orCancel;
          isForward = false;
        }
      } else {
        _controller.forward().orCancel;
        isForward = true;
      }
    } on TickerCanceled {
      // анимация была отменена
    }
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0; // 1.0 обычная скорость анимации
    return GestureDetector(
      onTap: () {
        _playAnimation();
      },
      child: Padding(
        padding: EdgeInsets.only(top: sdpPX(context, 12)),
        child: Transform.translate(
          offset: Offset(sdpPX(context, -33), 0),
          child: Stack(
            children: [
              CallStaggeredAnimationWidget(
                controller: _controller.view,
                isCloseLeftArrow: widget.isCloseLeftArrow,
                textOpen: widget.textOpen,
                widthInfo: widget.widthInfo,
                context: context,
                isThirdState: isThirdState,
              ),
            ],
          ),
        ),
      ),
    );
  }
}



/// применять вот так
///  // звонок 2 (тоже не идеальная, но сильно лучше)
                        // CallStaggeredAnimated(
                        //   icon: ClipOval(
                        //     child: Image.asset(
                        //       AppIcons.callAvatar,
                        //       width: sdpPX(context, 100),
                        //       height: sdpPX(context, 100),
                        //       fit: BoxFit.cover,
                        //     ),
                        //   ),
                        //   isCloseLeftArrow: true,
                        //   textOpen: SizedBox(
                        //     width: sdpPX(context, 180),
                        //     child: Text.rich(
                        //       TextSpan(
                        //         text: 'Михал Палыч\n',
                        //         style: TextStyle(
                        //           color: AppColors.accent,
                        //           fontSize: sdpPX(context, 25),
                        //           fontWeight: FontWeight.w500,
                        //           fontFamily: AppStyles.ttNorms,
                        //         ),
                        //         children: <TextSpan>[
                        //           TextSpan(
                        //             text: 'Терентьев',
                        //             style: TextStyle(
                        //               color: AppColors.accent,
                        //               fontSize: sdpPX(context, 25),
                        //               fontWeight: FontWeight.w500,
                        //               fontFamily: AppStyles.ttNorms,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //       maxLines: 2,
                        //       overflow: TextOverflow.ellipsis,
                        //     ),
                        //   ),
                        //   widthInfo: 440,
                        // ),
                    