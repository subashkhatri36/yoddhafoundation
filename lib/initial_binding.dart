import 'package:get/get.dart';
import 'package:yoddhafoundation/app/core/controller/controller.dart';
import 'package:yoddhafoundation/app/core/service/internet_connectivity/internet_connectivity.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(InternetConnectivityController(), permanent: true);
     Get.put(AppController(), permanent: true);
    // Get.put(() => ThemeController(), permanent: true);
    // Get.lazyPut(() => StockpriceController(), fenix: true);
  }
}
