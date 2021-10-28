import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/constants.dart';
import 'package:yoddhafoundation/app/constant/controller.dart';
import 'package:yoddhafoundation/app/constant/enum.dart';
import 'package:yoddhafoundation/app/data/model/shaid_children.dart';
import 'package:yoddhafoundation/app/routes/app_pages.dart';
import 'package:yoddhafoundation/app/widgets/list_item_widget.dart';

import '../controllers/children_dashboard_controller.dart';

class ChildrenDashboardView extends GetView<ChildrenDashboardController> {
  const ChildrenDashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  Get.toNamed(Routes.familydashboard);
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
          Get.toNamed(Routes.children, arguments: [OPERATION.insert]);
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
            child: const Text('There is No Data It\'s Null.'),
          )
        : appController.coreShaidModel!.shaidChildren!.isEmpty
            ? Container(
                padding: const EdgeInsets.all(Constants.defaultPadding),
                alignment: Alignment.center,
                child: const Text(
                  'List is Empty Please add Children from following (+) Icon.',
                  textAlign: TextAlign.center,
                ),
              )
            : ListViewWidget(
                controller: controller,
                argument: OPERATION.insert,
              );
    // : ListViewWidget(
    //     controller: controller, argument: OPERATION.insert);
  }
}

class ListViewWidget extends StatelessWidget {
  final OPERATION argument;
  const ListViewWidget({
    Key? key,
    required this.argument,
    required this.controller,
  }) : super(key: key);

  final ChildrenDashboardController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: appController.coreShaidModel!.shaidChildren!.length,
        itemBuilder: (context, index) {
          ShaidChildren children =
              appController.coreShaidModel!.shaidChildren![index];

          return Padding(
            padding: const EdgeInsets.all(8.0),
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
                            value: children.name,
                          ),
                        ),
                        Column(
                          children: [
                            InkWell(
                                onTap: () {
                                  //show conformation button
                                  controller.deleteChildrenData(children.name);
                                },
                                child: const Icon(Icons.delete)),
                            argument == OPERATION.insert
                                ? Container()
                                : InkWell(
                                    onTap: () {
                                      Get.toNamed(
                                        Routes.children,
                                        arguments: [OPERATION.update, children],
                                      );
                                    },
                                    child: const Icon(Icons.edit)),
                          ],
                        ),
                      ],
                    ),
                    ListItemWidget(
                      field: 'Relation',
                      value: children.relation,
                    ),
                    ListItemWidget(
                      field: 'Date of Birth:',
                      value: children.dob.toString(),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
