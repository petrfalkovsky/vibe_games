// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';
import 'package:vibe_games/ui/screens/hud/hud_exports.dart';
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

                /// Цифровые метки
                // const SpeedDigitsTable(),
                SpeedDigitsTable()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
