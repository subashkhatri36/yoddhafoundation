import 'package:get/get.dart';
import 'package:yoddhafoundation/app/data/model/shaid_model.dart';

class SahidDashboardController extends GetxController {
  late List list;
  late List<Sahid> sahidData;


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
