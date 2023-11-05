import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';
import 'package:vibe_games/ui/shared/shared_exports.dart';

class StaggeredAnimationCallWidget extends StatelessWidget {
  StaggeredAnimationCallWidget({
    super.key,
    required this.controller,
    required this.isCloseLeftArrow,
    required this.textOpen,
    required this.widthInfo,
    required this.context,
  })  :

// Каждая анимация, определенная здесь, преобразует свое значение в течение подмножества
// длительности контроллера, определяемой интервалом анимации.
// Например, анимация непрозрачности преобразует свое значение во время
// первые 10% времени работы контроллера.

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
              curve: Curves.ease,
            ),
          ),
        ),

        /// ширина первого шага от и до
        width = Tween<double>(
          begin: 188.0,
          end: widthInfo,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.125,
              0.250,
              curve: Curves.ease,
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
              curve: Curves.ease,
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
              curve: Curves.ease,
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
              curve: Curves.ease,
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
              curve: Curves.ease,
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
                    Center(
                      child: Opacity(
                        opacity: textOpacity.value,
                        child: Padding(
                          padding: EdgeInsets.only(left: sdpPX(context, 22)),
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
                        opacity: textOpacity.value,
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

class StaggeredAnimatedContainer extends StatefulWidget {
  final Widget icon;
  final bool isCloseLeftArrow;
  final Widget textOpen;
  final double widthInfo;

  const StaggeredAnimatedContainer({
    super.key,
    required this.icon,
    required this.isCloseLeftArrow,
    required this.textOpen,
    required this.widthInfo,
  });

  @override
  State<StaggeredAnimatedContainer> createState() =>
      _StaggeredAnimatedContainerState();
}

class _StaggeredAnimatedContainerState extends State<StaggeredAnimatedContainer>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  bool isForward = true;

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
// ignore: non_constant_identifier_names
  Future<void> _InitialPlayAnimation() async {
    animationTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (isForward && !isOpening) {
        // если анимация открыта и не открывалась в текущем интервале, отключаем текущий таймер
        timer.cancel();
        // запускаем новый таймер через 3 секунды для закрытия анимации
        Timer(const Duration(seconds: 1), () {
          try {
            _controller.reverse().orCancel;
            isForward = true;
          } on TickerCanceled {
            // анимация была отменена, вероятно, потому, что от нас избавились.
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
    try {
      if (_controller.isAnimating) {
        // eсли анимация выполняется, отменяю ее и таймер
        _controller.stop();
      } else if (isForward) {
        // если анимация открывает, отключаю таймер и включаю обратную анимацию.
        _controller.reverse().orCancel;
        isForward = false;
      } else {
        // если анимация закрывает, включаю таймер и анимацию вперед.
        _controller.forward().orCancel;
        isForward = true;
      }
    } on TickerCanceled {
      // анимация была отменена, вероятно, потому, что от нас избавились.
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
              StaggeredAnimationCallWidget(
                controller: _controller.view,
                isCloseLeftArrow: widget.isCloseLeftArrow,
                textOpen: widget.textOpen,
                widthInfo: widget.widthInfo,
                context: context,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
