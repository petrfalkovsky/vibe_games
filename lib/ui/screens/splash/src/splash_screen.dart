// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:vibe_games/ui/screens/splash/splash.dart';
import 'package:vibe_games/ui/shared/all_shared.dart';

import 'package:vfx_flutter_common/getx_helpers.dart';

class SplashScreen extends StatexWidget<SplashScreenController> {
  SplashScreen({Key? key}) : super(() => SplashScreenController(), key: key);

  @override
  Widget buildWidget(BuildContext context) {
    return const Scaffold(
      // backgroundColor: AppColors.background[2],
      body: Stack(
        children: [
          Positioned.fill(
            child: _BackgroundImage(),
          ),
          SafeArea(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage('assets/images/splash_screen_bg.png'),
      fit: BoxFit.fill,
    );
  }
}
