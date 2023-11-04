import 'package:flutter/material.dart';
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';
import 'package:vibe_games/ui/shared/shared_exports.dart';

class BuildState3 extends StatelessWidget {
  const BuildState3({
    super.key,
    required this.context,
    required this.isContentVisible,
  });

  final BuildContext context;
  final bool isContentVisible;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              colors: [
                AppColors.background[2]?.withOpacity(0.6) ?? Colors.transparent,
                AppColors.background[2]?.withOpacity(0.3) ?? Colors.transparent,
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ).createShader(bounds);
          },
          blendMode: BlendMode.srcATop,
          child: Center(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: sdpPX(context, 0)),
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
        AnimatedOpacity(
          opacity: isContentVisible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 2000),
          child: Row(
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
                    size: sdpPX(context, 36),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
