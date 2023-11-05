import 'package:flutter/material.dart';
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';
import 'package:vibe_games/ui/shared/shared_exports.dart';

class BuildState1 extends StatelessWidget {
  const BuildState1({
    super.key,
    required this.context,
    required this.paddingAvatar,
  });

  final BuildContext context;
  final double paddingAvatar;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // аватар
        // имя абонента
        // кнопка положить трубку
        // кнопка ответить на звонок
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

        // имя абонента
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

        // кнопка положить трубку
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
                  AppIcons.svgWidget(
                    AppIcons.callSkip,
                    width: sdpPX(context, 44.5),
                  ),
                ],
              ),
            ),
          ),
        ),

        // кнопка ответить на звонок
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
                  AppIcons.svgWidget(
                    AppIcons.callAnswer,
                    width: sdpPX(context, 35.5),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
