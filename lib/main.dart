import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/string.dart';
import 'package:yoddhafoundation/app/constant/themes.dart';
import 'package:yoddhafoundation/initial_binding.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: Strings.appName,
      theme: Themes.light,
      darkTheme: Themes.dark,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.native,
      builder: EasyLoading.init(),
      initialBinding: InitialBinding(),
    ),
  );
}
