import 'package:get/get.dart' hide Trans;
import 'package:vfx_flutter_common/getx_helpers.dart';

class WelcomeController extends StatexController {
  // булки меняют видимость виджета звездочки при нажатии на верхнюю часть статус бара
  RxBool isVisibleStar = true.obs;
  RxInt currentState = 0.obs;

  // сюда можно передавать методы, если нужно чтобы при открытии экрана срабатывали
  // ignore: empty_constructor_bodies
  WelcomeController() {}

  // метод меняет видимость виджета звездочки при нажатии на верхнюю часть статус бала
  void toggleAreaVisibility() {
    isVisibleStar.value = !isVisibleStar.value;
  }

  // метод меняет видимость виджета звездочки при нажатии на верхнюю часть статус бала
  void toggleVisibleHealthSheeld() {
    if (currentState.value == 0) {
      currentState.value = 1; // при первом тапе показываем только синий виджет.
    } else if (currentState.value == 1) {
      currentState.value = 2; // при втором тапе добавляю серый виджет.
    } else if (currentState.value == 2) {
      currentState.value = 0; // при третьем тапе скрываю оба виджета.
    }
  }
}
