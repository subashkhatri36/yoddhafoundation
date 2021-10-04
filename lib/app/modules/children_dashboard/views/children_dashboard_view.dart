import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/constants.dart';
import 'package:yoddhafoundation/app/constant/controller.dart';
import 'package:yoddhafoundation/app/constant/enum.dart';
import 'package:yoddhafoundation/app/data/model/shaid_children.dart';
import 'package:yoddhafoundation/app/routes/app_pages.dart';

import '../controllers/children_dashboard_controller.dart';

class ChildrenDashboardView extends GetView<ChildrenDashboardController> {
  const ChildrenDashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(appController.coreShaidModel!.shaid.name);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Children DashboardView'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.FAMILY_DASHBOARD);
                },
                child: Text(
                  'Family',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Obx(() => appController.childrenListDataChange.value
          ? const ChildrenWidget()
          : const ChildrenWidget()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.CHILDREN, arguments: [OPERATION.insert]);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ChildrenWidget extends StatelessWidget {
  const ChildrenWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChildrenDashboardController>();
    return appController.coreShaidModel!.shaid.name == ''
        ? Container(
            padding: const EdgeInsets.all(Constants.defaultPadding),
            alignment: Alignment.center,
            child: const Text('There is No Data ITs Null.'),
          )
        : appController.coreShaidModel!.shaidChildren!.isEmpty
            ? Container(
                padding: const EdgeInsets.all(Constants.defaultPadding),
                alignment: Alignment.center,
                child: const Text(
                  'List Is Empty Please add Children from following (+) Icon.',
                  textAlign: TextAlign.center,
                ),
              )
            : Container(
                padding: const EdgeInsets.all(Constants.defaultPadding),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount:
                        appController.coreShaidModel!.shaidChildren!.length,
                    itemBuilder: (context, index) {
                      ShaidChildren children =
                          appController.coreShaidModel!.shaidChildren![index];

                      return ListTile(
                        title: Text(children.name),
                        trailing: Column(
                          children: [
                            IconButton(
                                onPressed: () {
                                  //show conformation button
                                  controller.deleteChildrenData(children.name);
                                },
                                icon: const Icon(Icons.delete)),
                            IconButton(
                                onPressed: () {
                                  Get.toNamed(
                                    Routes.CHILDREN,
                                    arguments: [OPERATION.update, children],
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
