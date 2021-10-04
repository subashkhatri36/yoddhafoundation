import 'package:get/get.dart';

import 'package:yoddhafoundation/app/modules/children/bindings/children_binding.dart';
import 'package:yoddhafoundation/app/modules/children/views/children_view.dart';
import 'package:yoddhafoundation/app/modules/children_dashboard/bindings/children_dashboard_binding.dart';
import 'package:yoddhafoundation/app/modules/children_dashboard/views/children_dashboard_view.dart';
import 'package:yoddhafoundation/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:yoddhafoundation/app/modules/dashboard/views/dashboard_view.dart';
import 'package:yoddhafoundation/app/modules/family/bindings/family_binding.dart';
import 'package:yoddhafoundation/app/modules/family/views/family_view.dart';
import 'package:yoddhafoundation/app/modules/family_dashboard/bindings/family_dashboard_binding.dart';
import 'package:yoddhafoundation/app/modules/family_dashboard/views/family_dashboard_view.dart';
import 'package:yoddhafoundation/app/modules/home/bindings/home_binding.dart';
import 'package:yoddhafoundation/app/modules/home/views/home_view.dart';
import 'package:yoddhafoundation/app/modules/login/bindings/login_binding.dart';
import 'package:yoddhafoundation/app/modules/login/views/login_view.dart';
import 'package:yoddhafoundation/app/modules/sahid/bindings/sahid_binding.dart';
import 'package:yoddhafoundation/app/modules/sahid/views/sahid_view.dart';
import 'package:yoddhafoundation/app/modules/sahid_overview/bindings/sahid_overview_binding.dart';
import 'package:yoddhafoundation/app/modules/sahid_overview/views/sahid_overview_view.dart';
import 'package:yoddhafoundation/app/modules/splash/bindings/splash_binding.dart';
import 'package:yoddhafoundation/app/modules/splash/views/splash_view.dart';
import 'package:yoddhafoundation/app/modules/user_profile/bindings/user_profile_binding.dart';
import 'package:yoddhafoundation/app/modules/user_profile/views/user_profile_view.dart';

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
    GetPage(
      name: _Paths.CHILDREN,
      page: () => ChildrenView(),
      binding: ChildrenBinding(),
    ),
    GetPage(
      name: _Paths.FAMILY,
      page: () => FamilyView(),
      binding: FamilyBinding(),
    ),
    GetPage(
      name: _Paths.USER_PROFILE,
      page: () => UserProfileView(),
      binding: UserProfileBinding(),
    ),
    GetPage(
      name: _Paths.CHILDREN_DASHBOARD,
      page: () => ChildrenDashboardView(),
      binding: ChildrenDashboardBinding(),
    ),
    GetPage(
      name: _Paths.FAMILY_DASHBOARD,
      page: () => FamilyDashboardView(),
      binding: FamilyDashboardBinding(),
    ),
    GetPage(
      name: _Paths.SAHID_OVERVIEW,
      page: () => SahidOverviewView(),
      binding: SahidOverviewBinding(),
    ),
  ];
}
