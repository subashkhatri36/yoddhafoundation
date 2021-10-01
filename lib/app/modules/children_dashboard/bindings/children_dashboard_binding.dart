import 'package:get/get.dart';

import '../controllers/children_dashboard_controller.dart';

class ChildrenDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChildrenDashboardController>(
      () => ChildrenDashboardController(),
    );
  }
}
