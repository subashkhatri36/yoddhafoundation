import 'package:get/get.dart';

import '../controllers/sahid_overview_controller.dart';

class SahidOverviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SahidOverviewController>(
      () => SahidOverviewController(),
    );
  }
}
