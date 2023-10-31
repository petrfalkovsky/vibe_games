import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide Trans;
import 'package:vibe_games/core/utils/stream_subscriber.dart';
import 'package:vibe_games/ui/router/routing.dart';
import 'package:vibe_games/ui/screens/internet/src/internet_service.dart';
import 'package:vibe_games/ui/shared/all_shared.dart';
import 'package:vibe_games/ui/shared/constants/app_colors.dart';
import 'package:vibe_games/ui/shared/widgets/general_scaffold/src/bottom_bar.dart';

class GeneralScaffoldService extends GetxService with StreamSubscriberMixin {
  GeneralScaffoldService({
    InternetScreenService? internetScreenService,
  }) : _internetScreenService = internetScreenService ?? Get.find();

  final InternetScreenService _internetScreenService;

  final _currentNavIndex = 0.obs; // для BottomNavigationBar index
  int get currentNavIndex$ => _currentNavIndex();
  void currentNavIndex(int index) => _currentNavIndex(index);

  final _isNotToday = false.obs;
  bool get isNotToday => _isNotToday();
  void changeIsNotToday(bool b) => _isNotToday(b);

  final bottomAppBarItems = <BottomAppBarItem>[
    const BottomAppBarItem(
      // text: 'allMyReservations',
      iconAsset: AppIcons.backStatusBar,
      router: AppRoutes.start,
    ),
    const BottomAppBarItem(
      // text: 'reservation',
      iconAsset: AppIcons.avatar,
      router: AppRoutes.start,
    ),
    const BottomAppBarItem(
      // text: 'settings',
      iconAsset: AppIcons.callAnswer,
      router: AppRoutes.start,
    ),
    const BottomAppBarItem(
      // text: 'shop',
      iconAsset: AppIcons.cart,
      router: AppRoutes.start,
    )
  ];

  ConnectivityResult get connectionStatus$ =>
      _internetScreenService.connectionStatus$;

  void goToPage(int index) {
    Get.offNamed(bottomAppBarItems[index].router);
    currentNavIndex(index);
  }

  int? _lastTimeBackButtonWasTapped;
  Future<bool> doubleExit() async {
    final currentTime = DateTime.now().millisecondsSinceEpoch;
    if (_lastTimeBackButtonWasTapped != null &&
        (currentTime - (_lastTimeBackButtonWasTapped ?? 0)) <
            Consts.exitTimeInMillis) {
      return Future.value(true);
    } else {
      _lastTimeBackButtonWasTapped = DateTime.now().millisecondsSinceEpoch;
      alert(
          value: 'Press Back button again to Exit',
          color: AppColors.notification.success);
      return Future.value(false);
    }
  }

  Future<bool> tryExit() async {
    if (currentNavIndex$ == 0) {
      return Future.value(true);
    } else {
      goToPage(0);
      return Future.value(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    debugPrint(' ONINIT SCAFFOLD SIRIUS SERVICE');
    _isNotToday(false);
  }
}

class BottomNavModel {
  Color activeColor;
  String icon;
  String text;
  String router;

  BottomNavModel({
    required this.activeColor,
    required this.icon,
    required this.text,
    required this.router,
  });
}
