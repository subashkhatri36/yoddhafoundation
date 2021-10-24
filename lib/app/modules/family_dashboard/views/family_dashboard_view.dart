import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/constants.dart';
import 'package:yoddhafoundation/app/constant/controller.dart';
import 'package:yoddhafoundation/app/constant/enum.dart';
import 'package:yoddhafoundation/app/data/model/shaid_family.dart';
import 'package:yoddhafoundation/app/routes/app_pages.dart';
import 'package:yoddhafoundation/app/widgets/list_item_widget.dart';

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
        : appController.coreShaidModel!.shaidFamily == null ||
                appController.coreShaidModel!.shaidFamily!.isEmpty
            ? Container(
                padding: const EdgeInsets.all(Constants.defaultPadding),
                alignment: Alignment.center,
                child: const Text(
                  'List Is Empty Please add family from following (+) Icon.',
                  textAlign: TextAlign.center,
                ),
              )
            : appController.familyListDataChange.isTrue
                ? ListviewWidget(
                    controller: controller,
                    argument: OPERATION.insert,
                  )
                : ListviewWidget(
                    controller: controller,
                    argument: OPERATION.insert,
                  );
  }
}

class ListviewWidget extends StatelessWidget {
  final OPERATION argument;
  const ListviewWidget({
    Key? key,
    required this.argument,
    required this.controller,
  }) : super(key: key);

  final FamilyDashboardController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Constants.defaultPadding),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: appController.coreShaidModel!.shaidFamily!.length,
          itemBuilder: (context, index) {
            ShaidFamily family =
                appController.coreShaidModel!.shaidFamily![index];

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2),
              child: Card(
                child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: Constants.defaultMargin,
                        horizontal: Constants.defaultMargin / 2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ListItemWidget(
                                field: 'Name',
                                value: family.name,
                              ),
                            ),
                            Column(
                              children: [
                                InkWell(
                                    onTap: () {
                                      //show conformation button
                                      controller.deleteFamilyData(family.name);
                                    },
                                    child: const Icon(Icons.delete)),
                                argument == OPERATION.insert
                                    ? Container()
                                    : InkWell(
                                        onTap: () {
                                          Get.toNamed(
                                            Routes.children,
                                            arguments: [
                                              OPERATION.update,
                                              family
                                            ],
                                          );
                                        },
                                        child: const Icon(Icons.edit)),
                              ],
                            ),
                          ],
                        ),
                        ListItemWidget(
                          field: 'Relation',
                          value: family.relation,
                        ),
                        ListItemWidget(
                          field: 'Age',
                          value: family.age.toString(),
                        ),
                      ],
                    )),
              ),
            );
          }),
    );
  }
}
