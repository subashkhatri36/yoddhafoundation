import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/string.dart';
import 'package:yoddhafoundation/app/core/service/storage_service/shared_preference.dart';

class DashboardController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    shareprefrence.read(Strings.logintoken);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
