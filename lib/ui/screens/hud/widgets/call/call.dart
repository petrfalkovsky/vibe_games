import 'package:flutter/material.dart';
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';
import 'package:vibe_games/ui/shared/shared_exports.dart';

class Call extends StatefulWidget {
  const Call({
    super.key,
  });

  @override
  State<Call> createState() => _CallState();
}

enum CallState { state1, state2, state3, state4 }

class _CallState extends State<Call> {
  CallState currentState = CallState.state1;

  void switchToState2() {
    setState(() {
      currentState = CallState.state2;
    });
  }

  void switchToState3() {
    setState(() {
      currentState = CallState.state3;
    });
  }

  void switchToState4() {
    setState(() {
      currentState = CallState.state4;
    });
  }

  @override
  Widget build(BuildContext context) {
    double containerWidth;
    double containerHeight;
    Widget child;

    switch (currentState) {
      case CallState.state1:
        containerWidth = sdpPX(context, 570);
        containerHeight = sdpPX(context, 124);
        child = buildState1();
        break;
      case CallState.state2:
        containerWidth = sdpPX(context, 466);
        containerHeight = sdpPX(context, 124);
        child = buildState2();
        break;
      case CallState.state3:
        containerWidth = sdpPX(context, 188);
        containerHeight = sdpPX(context, 140);
        child = buildState3();
        break;
      case CallState.state4:
        containerWidth = sdpPX(context, 466);
        containerHeight = sdpPX(context, 124);
        child = buildState4();
        break;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
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
      child: GestureDetector(
        onTap: () {
          if (currentState == CallState.state1) {
            switchToState2();
          } else if (currentState == CallState.state2) {
            switchToState3();
          } else if (currentState == CallState.state4) {
            switchToState4();
          }
        },
        child: child,
      ),
    );
  }

  Widget buildState1() {
    return Row(
      children: [
        // аватар
        // имя абонента
        // кнопка "Ответить на звонок"
        // кнопка "Положить трубку"
        Padding(
          padding: EdgeInsets.all(sdpPX(context, 12)),
          child: ClipOval(
            child: Image.asset(
              AppIcons.callAvatar,
              width: sdpPX(context, 100),
              height: sdpPX(context, 100),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(sdpPX(context, 12)),
          child: SizedBox(
            width: sdpPX(context, 200),
            child: Text.rich(
              TextSpan(
                text: 'Имяоченьдинное,хм интересно войдет или нет',
                style: TextStyle(
                  color: AppColors.accent,
                  fontSize: sdpPX(context, 25),
                  fontWeight: FontWeight.w500,
                  fontFamily: AppStyles.ttNorms,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'ФамилияПодъехалатоже нормальная такая',
                    style: TextStyle(
                      color: AppColors.accent,
                      fontSize: sdpPX(context, 25),
                      fontWeight: FontWeight.w500,
                      fontFamily: AppStyles.ttNorms,
                    ),
                  ),
                ],
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(sdpPX(context, 12)),
          child: ButtonAnimator(
            child: Container(
              width: sdpPX(context, 84),
              height: sdpPX(context, 84),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.background[9] ?? Colors.transparent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppIcons.svgWidget(AppIcons.callSkip, width: 35.5),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(sdpPX(context, 12)),
          child: ButtonAnimator(
            child: Container(
              width: sdpPX(context, 84),
              height: sdpPX(context, 84),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.background[10] ?? Colors.transparent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppIcons.svgWidget(AppIcons.callAnswer, width: 35.5),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildState2() {
    return Row(
      children: [
        // аватар
        // имя абонента
        // кнопка "Положить трубку"
        Padding(
          padding: EdgeInsets.all(sdpPX(context, 12)),
          child: ClipOval(
            child: Image.asset(
              AppIcons.callAvatar,
              width: sdpPX(context, 100),
              height: sdpPX(context, 100),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(sdpPX(context, 12)),
          child: SizedBox(
            width: sdpPX(context, 200),
            child: Text.rich(
              TextSpan(
                text: 'Имяоченьдинное,хм интересно войдет или нет',
                style: TextStyle(
                  color: AppColors.accent,
                  fontSize: sdpPX(context, 25),
                  fontWeight: FontWeight.w500,
                  fontFamily: AppStyles.ttNorms,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'ФамилияПодъехалатоже нормальная такая',
                    style: TextStyle(
                      color: AppColors.accent,
                      fontSize: sdpPX(context, 25),
                      fontWeight: FontWeight.w500,
                      fontFamily: AppStyles.ttNorms,
                    ),
                  ),
                ],
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),

        /// положить трубку и счетчик времени
        Padding(
          padding: EdgeInsets.all(sdpPX(context, 12)),
          child: ButtonAnimator(
            child: Container(
              width: sdpPX(context, 84),
              height: sdpPX(context, 84),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.background[9] ?? Colors.transparent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppIcons.svgWidget(AppIcons.callSkip, width: 35.5),
                  Padding(
                    padding: EdgeInsets.only(top: sdpPX(context, 13)),
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
        ),
      ],
    );
  }

  Widget buildState3() {
    return GestureDetector(
      onTap: () {
        switchToState4();
      },
      child: Row(
        children: [
          // аватар
          // имя абонента
          Padding(
            padding: EdgeInsets.all(sdpPX(context, 12)),
            child: ClipOval(
              child: Image.asset(
                AppIcons.callAvatar,
                width: sdpPX(context, 100),
                height: sdpPX(context, 100),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ButtonAnimator(
            child: Padding(
              padding: EdgeInsets.all(sdpPX(context, 12)),
              child: Icon(
                Icons.arrow_forward_ios,
                color: AppColors.accent,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildState4() {
    return GestureDetector(
      onTap: () {
        switchToState3();
      },
      child: Row(
        children: [
          // аватар
          // имя абонента
          // кнопка "Положить трубку"
          Padding(
            padding: EdgeInsets.all(sdpPX(context, 12)),
            child: ClipOval(
              child: Image.asset(
                AppIcons.callAvatar,
                width: sdpPX(context, 100),
                height: sdpPX(context, 100),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(sdpPX(context, 12)),
            child: SizedBox(
              width: sdpPX(context, 200),
              child: Text.rich(
                TextSpan(
                  text: 'Имяоченьдинное,хм интересно войдет или нет',
                  style: TextStyle(
                    color: AppColors.accent,
                    fontSize: sdpPX(context, 25),
                    fontWeight: FontWeight.w500,
                    fontFamily: AppStyles.ttNorms,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'ФамилияПодъехалатоже нормальная такая',
                      style: TextStyle(
                        color: AppColors.accent,
                        fontSize: sdpPX(context, 25),
                        fontWeight: FontWeight.w500,
                        fontFamily: AppStyles.ttNorms,
                      ),
                    ),
                  ],
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),

          /// положить трубку и счетчик времени
          Padding(
            padding: EdgeInsets.all(sdpPX(context, 12)),
            child: ButtonAnimator(
              child: Container(
                width: sdpPX(context, 84),
                height: sdpPX(context, 84),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.background[9] ?? Colors.transparent,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppIcons.svgWidget(AppIcons.callSkip, width: 35.5),
                    Padding(
                      padding: EdgeInsets.only(top: sdpPX(context, 13)),
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
          ),
        ],
      ),
    );
  }
}
