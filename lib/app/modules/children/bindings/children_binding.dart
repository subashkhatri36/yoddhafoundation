import 'package:get/get.dart';

import '../controllers/children_controller.dart';

class ChildrenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChildrenController>(
      () => ChildrenController(),
    );
  }
}
