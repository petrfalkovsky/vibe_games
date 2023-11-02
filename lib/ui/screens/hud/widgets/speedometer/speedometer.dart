import 'package:flutter/material.dart';
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';
import 'dart:math';

import 'package:vibe_games/ui/shared/shared_exports.dart';

class Speedometer extends StatefulWidget {
  const Speedometer({super.key});

  @override
  State<Speedometer> createState() => _SpeedometerState();
}

class _SpeedometerState extends State<Speedometer> {
  double _speed = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          /// todo позунок для демонстарции прогресса скорости можно удалитьб
          SizedBox(
            width: sdpPX(context, 400),
            child: Slider(
              value: _speed,
              min: 0,
              max: 200,
              onChanged: (value) {
                setState(() {
                  _speed = value;
                });
              },
            ),
          ),
          Transform.translate(
            /// управлять вертикальный положением спидометра
            offset: const Offset(0, 28),
            child: Stack(
              children: [
                /// фон пргресс бара
                Center(
                  child: CustomPaint(
                    size: Size(
                      sdpPX(context, 300),
                      sdpPX(context, 300),
                    ),
                    painter: BackgroundProgressBar(
                        color: AppColors.accent.withOpacity(0.3)),
                  ),
                ),

                /// прогресс бар
                Center(
                  child: Transform.rotate(
                    angle: -pi / 2,
                    child: CustomPaint(
                      size: Size(
                        sdpPX(context, 300),
                        sdpPX(context, 300),
                      ),
                      painter: ProgressBar(_speed, AppColors.accent),
                    ),
                  ),
                ),

                /// цифры км/ч
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: sdpPX(context, 60)),
                    child: Column(
                      children: [
                        Text(
                          '${_speed.round()}',
                          style: TextStyle(
                            color: AppColors.accent,
                            fontSize: sdpPX(context, 62),
                            fontWeight: FontWeight.w500,
                            fontFamily: AppStyles.ttNorms,
                            height: 1.1,
                          ),
                        ),
                        Text(
                          'км/ч',
                          style: TextStyle(
                            color: AppColors.accent.withOpacity(0.3),
                            fontSize: sdpPX(context, 22),
                            fontWeight: FontWeight.normal,
                            fontFamily: AppStyles.ttNorms,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProgressBar extends CustomPainter {
  final double speed;
  final Color color;

  ProgressBar(this.speed, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
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

  BackgroundProgressBar({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
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
