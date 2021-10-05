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

  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: _Paths.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.shaid,
      page: () => SahidView(),
      binding: SahidBinding(),
    ),
    GetPage(
      name: _Paths.dashboard,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.children,
      page: () => ChildrenView(),
      binding: ChildrenBinding(),
    ),
    GetPage(
      name: _Paths.family,
      page: () => FamilyView(),
      binding: FamilyBinding(),
    ),
    GetPage(
      name: _Paths.userprofile,
      page: () => const UserProfileView(),
      binding: UserProfileBinding(),
    ),
    GetPage(
      name: _Paths.childrendashboard,
      page: () => const ChildrenDashboardView(),
      binding: ChildrenDashboardBinding(),
    ),
    GetPage(
      name: _Paths.familydashboard,
      page: () => const FamilyDashboardView(),
      binding: FamilyDashboardBinding(),
    ),
    GetPage(
      name: _Paths.shaidoverview,
      page: () => SahidOverviewView(),
      binding: SahidOverviewBinding(),
    ),
  ];
}
