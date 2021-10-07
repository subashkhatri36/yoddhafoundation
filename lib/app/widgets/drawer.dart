import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/controller.dart';
import 'package:yoddhafoundation/app/data/repositories/login_api_call.dart';
import 'package:yoddhafoundation/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:yoddhafoundation/app/modules/dashboard/views/dashboard_view.dart';
import 'package:yoddhafoundation/app/modules/user_profile/views/user_profile_view.dart';

Drawer drawer(BuildContext context) {
  final controller = Get.find<DashboardController>();
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Colors.blue),
            currentAccountPicture: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.asset(
                  "assets/images/auctionlogo.PNG",
                  fit: BoxFit.fill,
                )),
            accountName: const Text("Tanka"),
            accountEmail: const Text("shahi@gmail.com")),
        const ListTile(
          leading: Icon(Icons.dashboard),
          title: Text("ड्यासबोर्ड"),
        ),
        ListTile(
          title: const Text("सम्पूर्ण सहिद विवरण"),
          leading: const Icon(Icons.account_circle_outlined),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const DashboardView()));
          },
        ),
        ListTile(
          title: const Text("अकाउन्ट"),
          leading: const Icon(Icons.group_work_rounded),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const UserProfileView()));
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
