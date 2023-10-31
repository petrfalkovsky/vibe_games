import 'package:flutter/material.dart';
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';
import 'package:vibe_games/ui/shared/shared_exports.dart';

class SliderButton extends StatelessWidget {
  final Widget? icon;
  const SliderButton({Key? key, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonAnimator(
      child: Container(
        width: sdpPX(context, 95),
        height: sdpPX(context, 88),
        // искривление для всего контейнера (дети тоже искривляются)
        transform: Matrix4.skewX(-0.2),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.background.withOpacity(0.6),
            width: sdpPX(context, 2),
          ),
          color: AppColors.background[1]?.withOpacity(0.25),
          borderRadius: BorderRadius.circular(sdpPX(context, 6)),
        ),
        child: Transform(
          alignment: Alignment.center,
          // обратное искривление для иконки
          transform: Matrix4.skewX(0.2),
          child: Center(
            child: icon,
          ),
        ),
      ),
    );
  }
}
