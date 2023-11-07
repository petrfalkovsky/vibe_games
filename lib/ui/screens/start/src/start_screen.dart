import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:vfx_flutter_common/getx_helpers.dart';
import 'package:vibe_games/ui/shared/all_shared.dart';
import 'package:vibe_games/ui/shared/themes/app_colors_theme.dart';

import '../start.dart';

class Start extends StatexWidget<StartController> {
  Start({Key? key}) : super(() => StartController(), key: key) {
    debugPrint('start_screen'.tr());
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Obx(
      () => GeneralScaffold(
        backgroundColor: const AppColorsThemeLight().other.black,
        navBarEnable: false,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(227),
          child: AppBarWidget(),
        ),
        child: const Stack(
          children: [
            Text('data'),
          ],
        ),
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/appbar_frame.png',
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
        ),
        AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 24,
            ),
            child: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 100,
          automaticallyImplyLeading: false,
          flexibleSpace: const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [],
          ),
        ),
      ],
    );
  }
}
