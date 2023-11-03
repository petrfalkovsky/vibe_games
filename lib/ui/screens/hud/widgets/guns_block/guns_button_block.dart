import 'package:flutter/material.dart';
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';
import 'package:vibe_games/ui/screens/hud/hud_exports.dart';
import 'package:vibe_games/ui/shared/shared_exports.dart';

class GunsButtonBlock extends StatelessWidget {
  const GunsButtonBlock({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LeanRightButton(
      backgroundColor: AppColors.background[11],
      hasBorder: false,
      height: sdpPX(context, 92),
      width: sdpPX(context, 91),
      icon: Image.asset(
        AppIcons.gunNope,
        width: sdpPX(context, 42),
      ),
    );
  }
}
