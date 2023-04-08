import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:spd/constants/routes.dart';
import 'package:get/route_manager.dart';

class OnbScreenController extends GetxController {
  LiquidController controller = LiquidController();
  RxInt currentPage = 0.obs;

  void skipAction(int pageIndex) {
    controller.jumpToPage(page: pageIndex - 1);
  }

  void logInButton() {
    Get.offNamed(Routes.authentication);
  }

  void onPageChangeCallback(int activePageIndex) {
    currentPage.value = activePageIndex;
  }
}
