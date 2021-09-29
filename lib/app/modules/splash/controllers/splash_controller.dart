import 'dart:async';

import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/controller.dart';
import 'package:yoddhafoundation/app/routes/app_pages.dart';

class SplashController extends GetxController {
  String loading='loading';

  final count = 0.obs;
  @override
  void onInit() {
    startTimer();
    super.onInit();
  }
  
  startTimer() async{
    var duration = const Duration(seconds: 3);
    return Timer(duration, route);
  }
  route()async {
     await appController.init();
     print(appController.accesstoken);
     if(appController.accesstoken.isNotEmpty) {
       Get.offNamed(Routes.DASHBOARD);
     } else {
       Get.toNamed(Routes.LOGIN);
     }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
