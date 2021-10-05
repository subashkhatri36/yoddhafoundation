import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/constants.dart';
import 'package:yoddhafoundation/app/constant/controller.dart';
import 'package:yoddhafoundation/app/constant/enum.dart';
import 'package:yoddhafoundation/app/data/model/shaid_family.dart';
import 'package:yoddhafoundation/app/routes/app_pages.dart';

import '../controllers/family_dashboard_controller.dart';

class FamilyDashboardView extends GetView<FamilyDashboardController> {
  const FamilyDashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Family DashboardView'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.shaidOverview,
                      arguments: [OPERATION.insert]);
                },
                child: Text(
                  'Finished',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: Obx(() => appController.familyListDataChange.value
          ? const FamilyWidget()
          : const FamilyWidget()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.family, arguments: [OPERATION.insert]);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class FamilyWidget extends StatelessWidget {
  const FamilyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FamilyDashboardController>();
    return appController.coreShaidModel!.shaid.name == ''
        ? Container(
            padding: const EdgeInsets.all(Constants.defaultPadding),
            alignment: Alignment.center,
            child: const Text('There is No Data ITs Null.'),
          )
        : appController.coreShaidModel!.shaidChildren == null
            ? Container(
                padding: const EdgeInsets.all(Constants.defaultPadding),
                alignment: Alignment.center,
                child: const Text(
                    'List Is Empty Please add family from following (+) Icon.'),
              )
            : Container(
                padding: const EdgeInsets.all(Constants.defaultPadding),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount:
                        appController.coreShaidModel!.shaidFamily!.length,
                    itemBuilder: (context, index) {
                      ShaidFamily family =
                          appController.coreShaidModel!.shaidFamily![index];

                      return ListTile(
                        title: Text(family.name),
                        trailing: Column(
                          children: [
                            IconButton(
                                onPressed: () {
                                  //show conformation button
                                  controller.deleteFamilyData(family.name);
                                },
                                icon: const Icon(Icons.delete)),
                            IconButton(
                                onPressed: () {
                                  Get.toNamed(
                                    Routes.family,
                                    arguments: [OPERATION.update, family],
                                  );
                                },
                                icon: const Icon(Icons.edit)),
                          ],
                        ),
                      );
                    }),
              );
  }
}
