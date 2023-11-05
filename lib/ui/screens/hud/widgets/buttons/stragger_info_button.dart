import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';
import 'package:vibe_games/ui/shared/shared_exports.dart';

class StraggeredAnimatedContainerInfoButton extends StatelessWidget {
  StraggeredAnimatedContainerInfoButton({
    super.key,
    required this.controller,
    required this.isCloseLeftArrow,
    required this.textOpen,
    required this.widthInfo,
  })  :

// Каждая анимация, определенная здесь, преобразует свое значение в течение подмножества
// длительности контроллера, определяемой интервалом анимации.
// Например, анимация непрозрачности преобразует свое значение во время
// первые 10% времени работы контроллера.

        /// прозрачность первого шага от и до
        opacity = Tween<double>(
          begin: 0.0,
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
          begin: 99.0,
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
        height = Tween<double>(begin: 92.0, end: 92.0).animate(
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
          begin: const EdgeInsets.only(bottom: 0),
          end: const EdgeInsets.only(right: 0),
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

        /// бордер радиус первого шага
        // borderRadius = BorderRadiusTween(
        //   begin: BorderRadius.circular(4),
        //   end: BorderRadius.circular(8),
        // ).animate(
        //   CurvedAnimation(
        //     parent: controller,
        //     curve: const Interval(
        //       0.375,
        //       0.500,
        //       curve: Curves.ease,
        //     ),
        //   ),
        // ),

        /// цвет на первом шаге от и до
        color = ColorTween(
          begin: AppColors.background[1]?.withOpacity(0.3),
          end: AppColors.background[1]?.withOpacity(0.3),
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
        );

  final Animation<double> controller;
  final Animation<double> opacity;
  final Animation<double> width;
  final Animation<double> height;
  final Animation<EdgeInsets> padding;
  // final Animation<BorderRadius?> borderRadius;
  final Animation<Color?> color;
  final Animation<double> textOpacity;

  /// передаю в место использования виджета
  final bool isCloseLeftArrow;
  final Widget textOpen;
  final double widthInfo;

// Эта функция вызывается каждый раз, когда контроллер "помечает" новый кадр.
// Когда он запустится, все значения анимации будут равны
// обновлено, чтобы отразить текущее значение контроллера.
  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Container(
      transform: Matrix4.skewX(-0.2),
      padding: padding.value,
      alignment: Alignment.centerLeft,
      child: Opacity(
        opacity: opacity.value,
        child: Container(
          width: sdpPX(context, width.value),
          height: sdpPX(context, height.value),
          decoration: BoxDecoration(
            color: color.value,
            border: Border.all(
              color: AppColors.accent.withOpacity(0.6),
              width: sdpPX(context, 2),
            ),
            borderRadius: BorderRadius.circular(sdpPX(context, 8)),
          ),
          child: Opacity(
            opacity: textOpacity.value,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: sdpPX(context, 20)),
                  child: Container(
                    transform: Matrix4.skewX(0.2),
                    child: textOpen,
                  ),
                ),
                Container(
                    transform: Matrix4.skewX(0.2),
                    child: isCloseLeftArrow
                        ? Transform.translate(
                            offset: const Offset(1, 0),
                            child: AppIcons.svgWidget(
                              AppIcons.infoBack,
                              width: sdpPX(context, 12),
                              color: AppColors.accent.withOpacity(0.7),
                            ),
                          )
                        : Transform.translate(
                            offset: const Offset(6, 0),
                            child: AppIcons.svgWidget(
                              AppIcons.infoForward,
                              width: sdpPX(context, 12),
                              color: AppColors.accent.withOpacity(0.7),
                            ),
                          )),
              ],
            ),
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

class StaggerInfoButton extends StatefulWidget {
  final Widget icon;
  final bool isCloseLeftArrow;
  final Widget textOpen;
  final double widthInfo;

  const StaggerInfoButton({
    super.key,
    required this.icon,
    required this.isCloseLeftArrow,
    required this.textOpen,
    required this.widthInfo,
  });

  @override
  State<StaggerInfoButton> createState() => _StaggerInfoButtonState();
}

class _StaggerInfoButtonState extends State<StaggerInfoButton>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  bool isForward = true;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      value: 0,
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    // запускаем анимацию, чтобы закрыть открытое инфо окно (иначе, если  value: 0,
    // в котроллере, то анимация срабатывает со второго тапа)
    _playAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _playAnimation() async {
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
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.5; // 1.0 обычная скорость анимации
    return ButtonAnimator(
      child: GestureDetector(
        onTap: () {
          _playAnimation();
        },
        child: Stack(
          children: [
            Container(
              transform: Matrix4.skewX(-0.2),
              height: sdpPX(context, 92),
              width: sdpPX(context, 99),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(sdpPX(context, 8)),
                color: AppColors.background[1]?.withOpacity(0.3),
                border: Border.all(
                  color: AppColors.background.withOpacity(0.6),
                ),
              ),
            ),
            StraggeredAnimatedContainerInfoButton(
              controller: _controller.view,
              isCloseLeftArrow: widget.isCloseLeftArrow,
              textOpen: widget.textOpen,
              widthInfo: widget.widthInfo,
            ),
            Positioned(
              left: sdpPX(context, 20),
              top: sdpPX(context, 23),
              child: widget.icon,
            ),
          ],
        ),
      ),
    );
  }
}
