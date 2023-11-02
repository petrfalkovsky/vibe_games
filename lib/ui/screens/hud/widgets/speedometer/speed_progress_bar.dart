import 'dart:math';

import 'package:flutter/material.dart';

class ProgressBar extends CustomPainter {
  final double speed;
  final Color color;
  final double strokeWidth;

  ProgressBar(this.speed, this.color, {required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // прогресс от 0 до 1
    double progress = speed / 200;

    /// 1.5(2) управлять завержением прогресса
    double arcAngle = 1.31 * pi * progress;

    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2),
            radius: size.width / 2),

        /// 1.65(2) управлять точкой старта прогресса
        -pi / 1.52,
        arcAngle,
        false,
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class BackgroundProgressBar extends CustomPainter {
  final Color color;
  final double strokeWidth;

  BackgroundProgressBar(this.color, {required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    /// прогресс всегда максимальный
    /// 0.905(2) управлять точкой финиша фона
    double arcAngle = 1.31 * pi;
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2,
      ),

      /// 0.905(2) управлять точкой старта фона
      -pi / 0.865,
      arcAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
