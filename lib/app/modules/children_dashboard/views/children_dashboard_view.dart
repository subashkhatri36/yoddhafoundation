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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Children DashboardView'),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(Routes.FAMILY_DASHBOARD);
              },
              icon: const Text('Family')),
        ],
      ),
      body: Obx(() => appController.childrenListDataChange.value
          ? const ChildrenWidget()
          : const ChildrenWidget()),

      // SingleChildScrollView(
      //   scrollDirection: Axis.horizontal,
      //   child: DataTable(
      //     columns: const [
      //       DataColumn(label: Text('ID')),
      //       DataColumn(label: Text('Child Name')),
      //       DataColumn(label: Text('Relation')),
      //       DataColumn(label: Text('Action')),
      //     ],
      //     rows: controller.shaidchildrens
      //         .map((e) => DataRow(cells: [
      //               DataCell(Text(e.id.toString())),
      //               DataCell(Text(e.name.toString())),
      //               DataCell(Text(e.relation.toString())),
      //               const DataCell(Icon(Icons.delete)),
      //             ]))
      //         .toList(),
      //   ),
      // ),
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
    return appController.coreShaidModel != null
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
                    'List Is Empty Please add Children from following (+) Icon.'),
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
                                  controller.deleteChildrenData(children.id!);
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
