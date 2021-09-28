import 'package:get/get.dart';

import '../controllers/sahid_controller.dart';

class SahidBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SahidController>(
      () => SahidController(),
    );
  }
}
