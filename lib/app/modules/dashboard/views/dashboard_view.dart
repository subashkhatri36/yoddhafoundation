import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/constants.dart';
import 'package:yoddhafoundation/app/constant/controller.dart';
import 'package:yoddhafoundation/app/constant/enum.dart';
import 'package:yoddhafoundation/app/constant/themes.dart';
import 'package:yoddhafoundation/app/data/model/shaid_core_model.dart';
import 'package:yoddhafoundation/app/routes/app_pages.dart';
import 'package:yoddhafoundation/app/widgets/authorized_widet_only.dart';
import 'package:yoddhafoundation/app/widgets/button/custom_button.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return authorizedAccess(
      WillPopScope(
        onWillPop: () async {
          final data = await showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text("Warning !"),
              content: const Text("Do you Want to exit application ?"),
              actions: <Widget>[
                CustomButton(
                    onpressed: () {
                      Navigator.of(context).pop(true);
                    },
                    btnText: 'Yes'),
                CustomButton(
                    onpressed: () {
                      Navigator.of(context).pop(false);
                    },
                    btnText: 'No')
              ],
            ),
          );
          return data;
        },
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.toNamed(Routes.shaid, arguments: [OPERATION.insert]);
            },
            child: const Icon(Icons.add),
          ),
          body: SafeArea(
              child: Obx(() => appController.shaidDataOffline.isFalse
                  ? Center(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text('Loading...'),
                        CircularProgressIndicator(),
                      ],
                    ))
                  : appController.offlineShaidModel.isEmpty
                      ? const Center(
                          child: Padding(
                          padding: EdgeInsets.all(Constants.defaultPadding),
                          child: Text(
                            'यहाँ डाटा खाली छ,कृपया डाटा भर्न यो (+) आइकनमा क्लिक गर्नुहोस्',
                            textAlign: TextAlign.center,
                          ),
                        ))
                      : Padding(
                          padding:
                              const EdgeInsets.all(Constants.defaultPadding),
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: appController.offlineShaidModel.length,
                              itemBuilder: (context, index) {
                                CoreShaidModel e =
                                    appController.offlineShaidModel[index];
                                return Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: Constants.defaultMargin / 2,
                                        vertical: Constants.defaultMargin),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal:
                                            Constants.defaultPadding / 2,
                                        vertical: Constants.defaultPadding),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Themes.black),
                                        borderRadius: BorderRadius.circular(
                                            Constants.defaultRadius)),
                                    child: ListTile(
                                      title: Text(e.shaid.name),
                                      leading: const FlutterLogo(),
                                      trailing: const Icon(
                                          Icons.keyboard_arrow_right),
                                    ));
                              }),
                        ))),
        ),
      ),
    );
  }
}
