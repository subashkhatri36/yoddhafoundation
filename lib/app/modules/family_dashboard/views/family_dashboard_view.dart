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
          IconButton(
              onPressed: () {
                //shaidoverview page
                Get.toNamed(Routes.FAMILY);
              },
              icon: const Text('Next'))
        ],
        centerTitle: true,
      ),
      body: Obx(() => appController.familyListDataChange.value
          ? const FamilyWidget()
          : const FamilyWidget()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.FAMILY, arguments: [OPERATION.insert]);
        },
        child: const Icon(Icons.add),
      ),
      //    SingleChildScrollView(
      //     scrollDirection: Axis.horizontal,
      //     child: DataTable(
      //       columns: const [
      //         DataColumn(label: Text('ID')),
      //         DataColumn(label: Text('SahidID')),
      //         DataColumn(label: Text('Name')),
      //         DataColumn(label: Text('Relation')),
      //         DataColumn(label: Text('CreatedAt')),
      //         DataColumn(label: Text('Action')),
      //       ],
      //       rows: controller.sahidFamilydata
      //           .map((data) => DataRow(
      //                 cells: [
      //                   DataCell(Text(data.id.toString())),
      //                   DataCell(Text(data.shaidId.toString())),
      //                   DataCell(Text(data.name.toString())),
      //                   DataCell(Text(data.relation.toString())),
      //                   DataCell(Text(data.createdAt.toString())),
      //                   const DataCell(Icon(Icons.delete)),
      //                 ],
      //               ))
      //           .toList(),
      //     ),
      //   ),
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
                                  controller.deleteFamilyData(family.id!);
                                },
                                icon: const Icon(Icons.delete)),
                            IconButton(
                                onPressed: () {
                                  Get.toNamed(
                                    Routes.FAMILY,
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
