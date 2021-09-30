import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/string.dart';
import 'package:yoddhafoundation/app/core/service/storage_service/shared_preference.dart';

class AppController extends GetxController {
  double width = 0.0;
  double height = 0.0;
  String accesstoken = '';
  bool authorized = false;
  @override
  void onInit() {
    super.onInit();
  }

  init() async {
    width = MediaQuery.of(Get.context!).size.width;
    height = MediaQuery.of(Get.context!).size.height;
    await loadDatabase();
  }

  Future loadDatabase() async {
    accesstoken = await shareprefrence.read(Strings.logintoken);
    if (accesstoken.isNotEmpty) {
      authorized = true;
    }
  }
}
