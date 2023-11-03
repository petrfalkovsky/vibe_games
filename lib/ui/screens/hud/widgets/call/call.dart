import 'package:flutter/material.dart';
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';
import 'package:vibe_games/ui/screens/hud/hud_exports.dart';
import 'package:vibe_games/ui/shared/shared_exports.dart';

class Call extends StatefulWidget {
  const Call({
    Key? key,
  }) : super(key: key);

  @override
  State<Call> createState() => _CallState();
}

enum CallState { state1, state2, state3, state4 }

class _CallState extends State<Call> {
  CallState currentState = CallState.state1;
  bool isContentVisible = true;
  double? containerWidth;
  double? containerHeight;

  void switchToState2() {
    setState(() {
      containerWidth = sdpPX(context, 466);
      containerHeight = sdpPX(context, 124);
    });

    {
      setState(() {
        isContentVisible = true;
        currentState = CallState.state2;
      });
    }
  }

  void switchToState3() {
    setState(() {
      containerWidth = sdpPX(context, 188);
      containerHeight = sdpPX(context, 140);
    });

    {
      setState(() {
        isContentVisible = true;
        currentState = CallState.state3;
      });
    }
  }

  void switchToState4() {
    setState(() {
      containerWidth = sdpPX(context, 466);
      containerHeight = sdpPX(context, 124);
    });

    // задержка перед появлением контента
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        isContentVisible = true;
        currentState = CallState.state4;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget child;

    switch (currentState) {
      case CallState.state1:
        containerWidth = sdpPX(context, 570);
        containerHeight = sdpPX(context, 124);
        child = buildState1();
        break;
      case CallState.state2:
        child = buildState2();
        break;
      case CallState.state3:
        child = buildState3();
        break;
      case CallState.state4:
        child = buildState4();
        break;
    }

    return GestureDetector(
      onTap: () {
        if (currentState == CallState.state1) {
          switchToState2();
        } else if (currentState == CallState.state2) {
          switchToState3();
        } else if (currentState == CallState.state4) {
          switchToState4();
        }
      },
      child: Transform.translate(
        offset: const Offset(-18, 0),
        child: Padding(
          padding: EdgeInsets.only(top: sdpPX(context, 12)),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: containerWidth,
            height: containerHeight,
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
            child: AnimatedOpacity(
              opacity: isContentVisible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: child,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildState1() {
    return BuildState1(context: context);
  }

  Widget buildState2() {
    return BuildState2(context: context);
  }

  Widget buildState3() {
    return GestureDetector(
      onTap: () {
        switchToState4();
      },
      child: BuildState3(context: context),
    );
  }

  Widget buildState4() {
    return GestureDetector(
      onTap: () {
        switchToState3();
      },
      child: BuildState4(context: context),
    );
  }
}
