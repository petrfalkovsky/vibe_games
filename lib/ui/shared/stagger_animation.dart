import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';
import 'package:vibe_games/ui/shared/shared_exports.dart';

class StaggerAnimation extends StatelessWidget {
  StaggerAnimation({super.key, required this.controller})
      :

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
          end: 318.0,
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
          begin: const EdgeInsets.only(bottom: 16),
          end: const EdgeInsets.only(bottom: 75),
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
        borderRadius = BorderRadiusTween(
          begin: BorderRadius.circular(4),
          end: BorderRadius.circular(8),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.375,
              0.500,
              curve: Curves.ease,
            ),
          ),
        ),

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
  final Animation<BorderRadius?> borderRadius;
  final Animation<Color?> color;
  final Animation<double> textOpacity;

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
              color: AppColors.accent.withOpacity(0.3),
              width: 2,
            ),
            borderRadius: borderRadius.value,
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
                    child: RichText(
                      text: TextSpan(
                        text: 'До конца задания\nосталось ',
                        style: TextStyle(
                          color: AppColors.accent,
                          fontSize: sdpPX(context, 20),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '10:32',
                            style: TextStyle(
                                color: AppColors.accent,
                                fontSize: sdpPX(context, 20),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  transform: Matrix4.skewX(0.2),
                  child: AppIcons.svgWidget(AppIcons.infoBack,
                      width: 8, color: AppColors.accent.withOpacity(0.3)),
                ),
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

class StaggerDemo extends StatefulWidget {
  const StaggerDemo({super.key});

  @override
  State<StaggerDemo> createState() => _StaggerDemoState();
}

class _StaggerDemoState extends State<StaggerDemo>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      // Анимация была отменена, вероятно, потому, что от нас избавились.
    }
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0; // 1.0 обычная скорость анимации
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
            StaggerAnimation(controller: _controller.view),
            Positioned(
              left: sdpPX(context, 27),
              top: sdpPX(context, 37),
              child: AppIcons.svgWidget(
                AppIcons.parashute,
                width: sdpPX(context, 42),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
