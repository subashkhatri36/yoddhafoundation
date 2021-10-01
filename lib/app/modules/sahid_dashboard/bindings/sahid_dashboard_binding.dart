import 'package:get/get.dart';

import '../controllers/sahid_dashboard_controller.dart';

class SahidDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SahidDashboardController>(
      () => SahidDashboardController(),
    );
  }
}
