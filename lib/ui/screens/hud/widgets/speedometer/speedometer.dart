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
            offset: Offset(0, sdpPX(context, 10)),
            child: Stack(
              children: [
                /// циферблат спидометра
                SpeedDigitsTable(),

                /// фон пргресс бара
                Center(
                  child: CustomPaint(
                    size: Size(
                      sdpPX(context, 300),
                      sdpPX(context, 300),
                    ),
                    painter: BackgroundProgressBar(
                      AppColors.accent.withOpacity(0.3),
                      strokeWidth: sdpPX(context, 6),
                    ),
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
                      painter: ProgressBar(
                        _speed,
                        AppColors.accent,
                        strokeWidth: sdpPX(context, 6),
                      ),
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

                /// центральная часть приборной панели (иконки, километраж)
                Center(
                  child: Column(
                    children: [
                      sdpPX(context, 162).h,

                      /// километраж
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color:
                                    AppColors.background[1]?.withOpacity(0.4),
                                borderRadius:
                                    BorderRadius.circular(sdpPX(context, 4))),
                            width: sdpPX(context, 112),
                            height: sdpPX(context, 26),
                            child: Text(
                              '000864',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColors.text[1],
                                  fontSize: sdpPX(context, 20),
                                  fontWeight: FontWeight.normal,
                                  fontFamily: AppStyles.ttNorms,
                                  letterSpacing: sdpPX(context, 2.8),
                                  height: sdpPX(context, 1.42)),
                            ),
                          ),
                        ],
                      ),

                      /// иконки поворотники, чек, фары
                      // поворотники, внимание
                      Padding(
                        padding: EdgeInsets.only(top: sdpPX(context, 10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppIcons.svgWidget(AppIcons.turnSignalLeft,
                                width: sdpPX(context, 16),
                                color: AppColors.background),
                            sdpPX(context, 24).w,
                            AppIcons.svgWidget(AppIcons.attantionSign,
                                width: sdpPX(context, 24)),
                            sdpPX(context, 24).w,
                            AppIcons.svgWidget(AppIcons.turnSignalRight,
                                width: sdpPX(context, 16),
                                color: AppColors.background.withOpacity(0.3)),
                          ],
                        ),
                      ),

                      // фонари, чек, ключ
                      Padding(
                        padding: EdgeInsets.only(top: sdpPX(context, 7)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppIcons.svgWidget(AppIcons.lights,
                                width: sdpPX(context, 24)),
                            sdpPX(context, 22).w,
                            AppIcons.svgWidget(AppIcons.check,
                                width: sdpPX(context, 22)),
                            sdpPX(context, 25).w,
                            AppIcons.svgWidget(AppIcons.key,
                                width: sdpPX(context, 19)),
                          ],
                        ),
                      )
                    ],
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
