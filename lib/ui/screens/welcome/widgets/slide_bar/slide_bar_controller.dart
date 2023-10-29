import 'package:get/get.dart';

class SideBarController extends GetxController {
  final RxBool isSidebarOpened = false.obs;

  void toggleSidebar() {
    isSidebarOpened.value = !isSidebarOpened.value;
  }
}
