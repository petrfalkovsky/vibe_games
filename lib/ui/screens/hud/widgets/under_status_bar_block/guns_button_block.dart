import 'package:flutter/material.dart';
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';
import 'package:vibe_games/ui/screens/hud/hud_exports.dart';
import 'package:vibe_games/ui/shared/shared_exports.dart';

class GunsButtonBlock extends StatefulWidget {
  const GunsButtonBlock({
    super.key,
  });

  @override
  State<GunsButtonBlock> createState() => _GunsButtonBlockState();
}

class _GunsButtonBlockState extends State<GunsButtonBlock> {
  int buttonState = 0; // 0 - не нажата, 1 - первое нажатие, 2 - второе нажатие

  void toggleGunButton() {
    setState(() {
      if (buttonState == 2) {
        buttonState = 0;
      } else {
        buttonState++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    late Widget button;

    if (buttonState == 0) {
      // кнопку первую написать
      button = LeanRightButton(
        backgroundColor: AppColors.background[11],
        hasBorder: false,
        height: sdpPX(context, 92),
        width: sdpPX(context, 91),
        icon: Image.asset(
          AppIcons.gunNope,
          width: sdpPX(context, 42),
        ),
      );
    } else if (buttonState == 1) {
      // кнопку вторую написать
      button = LeanRightButton(
        backgroundColor: AppColors.background[1],
        hasBorder: false,
        height: sdpPX(context, 92),
        width: sdpPX(context, 91),
        icon: Image.asset(
          AppIcons.fist,
          width: sdpPX(context, 64),
        ),
      );
    } else if (buttonState == 2) {
      // кнопку третью написать
      button = Stack(
        children: [
          LeanRightButton(
            backgroundColor: AppColors.background[1],
            hasBorder: false,
            height: sdpPX(context, 92),
            width: sdpPX(context, 91),
          ),
          Container(
            transform: Matrix4.skewX(-0.2),
            height: sdpPX(context, 63),
            width: sdpPX(context, 91),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF3F2066),
                    Color(0xFF270F41),
                  ]),
              borderRadius: BorderRadius.all(
                Radius.circular(sdpPX(context, 8)),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  AppIcons.gun,
                  width: sdpPX(context, 62),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: sdpPX(context, 4),
              child: Transform.translate(
                offset: Offset(sdpPX(context, -6), sdpPX(context, 0)),
                child: Text(
                  '000-00',
                  style: TextStyle(
                    color: AppColors.accent,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'TTNorms',
                    fontSize: sdpPX(context, 18),
                  ),
                ),
              ))
        ],
      );
    }

    return GestureDetector(onTap: toggleGunButton, child: button);
  }
}
