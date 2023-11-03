import 'package:flutter/material.dart';
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';
import 'package:vibe_games/ui/shared/shared_exports.dart';

class BuildState3 extends StatelessWidget {
  const BuildState3({super.key, required this.context});

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ColorFiltered(
          colorFilter: ColorFilter.mode(
            AppColors.background[1]?.withOpacity(0.5) ?? Colors.transparent,
            BlendMode.srcATop,
          ),
          child: Center(
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
              ],
            ),
          ),
        ),
        Row(
          children: [
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(left: sdpPX(context, 8)),
              child: Text(
                '01:34',
                style: TextStyle(
                  color: AppColors.accent,
                  fontSize: sdpPX(context, 20),
                  fontWeight: FontWeight.w500,
                  fontFamily: AppStyles.ttNorms,
                ),
              ),
            ),
            const Spacer(),
            ButtonAnimator(
              child: Padding(
                padding: EdgeInsets.only(left: sdpPX(context, 8)),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.accent,
                  size: sdpPX(context, 28),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}
