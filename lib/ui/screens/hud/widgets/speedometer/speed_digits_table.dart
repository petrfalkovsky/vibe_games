import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';
import 'package:vibe_games/ui/shared/shared_exports.dart';

class SpeedDigitsTable extends StatelessWidget {
  const SpeedDigitsTable({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    double radius = 120;
    // double step = 20;
    double centerX = radius + 10;
    double centerY = radius + 10;
    for (int i = 200; i >= 0; i -= 20) {
      double angle = -1 * pi * ((200 - i) / 200);
      double x = centerX + radius * cos(angle);
      double y = centerY + radius * sin(angle);
      children.add(
        Positioned(
          left: x,
          top: y,
          child: Text(
            '$i',
            style: TextStyle(
              color: AppColors.text[1]?.withOpacity(0.3),
              fontSize: sdpPX(context, 17),
              fontWeight: FontWeight.normal,
              fontFamily: AppStyles.ttNorms,
            ),
          ),
        ),
      );
    }

    return Positioned.fill(
      child: Stack(
        children: children,
      ),
    );
  }
}
