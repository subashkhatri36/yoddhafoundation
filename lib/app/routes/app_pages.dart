import 'package:get/get.dart';

import 'package:yoddhafoundation/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:yoddhafoundation/app/modules/dashboard/views/dashboard_view.dart';
import 'package:yoddhafoundation/app/modules/home/bindings/home_binding.dart';
import 'package:yoddhafoundation/app/modules/home/views/home_view.dart';
import 'package:yoddhafoundation/app/modules/login/bindings/login_binding.dart';
import 'package:yoddhafoundation/app/modules/login/views/login_view.dart';
import 'package:yoddhafoundation/app/modules/sahid/bindings/sahid_binding.dart';
import 'package:yoddhafoundation/app/modules/sahid/views/sahid_view.dart';
import 'package:yoddhafoundation/app/modules/splash/bindings/splash_binding.dart';
import 'package:yoddhafoundation/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SAHID,
      page: () => SahidView(),
      binding: SahidBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
  ];
}
