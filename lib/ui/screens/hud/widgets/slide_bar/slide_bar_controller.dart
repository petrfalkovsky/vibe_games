import 'package:get/get.dart';

class SideBarController extends GetxController {
  final RxBool isSidebarOpened = false.obs;

  void toggleSidebar({bool forceValue = false}) {
    isSidebarOpened.value = forceValue ? forceValue : !isSidebarOpened.value;
  }
}
