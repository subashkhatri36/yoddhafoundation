import 'package:get/get.dart';

import '../controllers/family_dashboard_controller.dart';

class FamilyDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FamilyDashboardController>(
      () => FamilyDashboardController(),
    );
  }
}
