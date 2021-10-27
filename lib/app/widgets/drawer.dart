import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/controller.dart';
import 'package:yoddhafoundation/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:yoddhafoundation/app/modules/dashboard/views/dashboard_view.dart';
import 'package:yoddhafoundation/app/modules/user_profile/views/user_profile_view.dart';
import 'package:yoddhafoundation/app/routes/app_pages.dart';

Drawer drawer(BuildContext context) {
  final controller = Get.find<DashboardController>();
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Colors.blue),
            currentAccountPicture: const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                  "assets/images/auctionlogo.PNG",
                )),
            accountName: appController.user != null
                ? Text(appController.user!.name)
                : const Text("Your Username"),
            accountEmail: Text(appController.user != null
                ? appController.user!.email
                : "youremail@gmail.com")),
        ListTile(
          title: const Text("सम्पूर्ण सहिद विवरण"),
          leading: const Icon(Icons.group_work_rounded),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const DashboardView()));
          },
        ),
        ListTile(
          title: const Text("अकाउन्ट"),
          leading: const Icon(Icons.account_circle_rounded),
          onTap: () {
            Get.toNamed(Routes.userprofile);
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text("Sign Out"),
          onTap: () {
            controller.userlogOut();
            // userlogin.logout(appController.accesstoken);
          },
        ),
      ],
    ),
  );
}
