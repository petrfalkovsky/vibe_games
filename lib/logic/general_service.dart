import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:vibe_games/ui/screens/internet/internet.dart';
import 'package:vibe_games/ui/screens/language/language.dart';
import 'package:vibe_games/ui/screens/splash/splash.dart';
import 'package:vibe_games/ui/shared/widgets/general_scaffold/src/general_scaffold_service.dart';

import '../ui/screens/start/start.dart';

class GeneralService extends GetxService {
  @override
  void onInit() {
    super.onInit();

    Get
      ..put(LanguageScreenService())
      ..put(InternetScreenService())

      /// fenix: true помогает избежать ошибки, когда Get.find()
      /// вызывается перед Get.put(контроллером).
      /// то есть когда вызов функции Get.find() перед инициализацией Get.put() выдает ошибку
      ..lazyPut(() => Dio())
      ..lazyPut(() => SplashScreenService())
      ..lazyPut(() => GeneralScaffoldService())
      ..lazyPut(() => StartController());
  }
}
