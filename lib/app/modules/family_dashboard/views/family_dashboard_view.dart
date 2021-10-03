import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yoddhafoundation/app/routes/app_pages.dart';

import '../controllers/family_dashboard_controller.dart';

class FamilyDashboardView extends GetView<FamilyDashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FamilyDashboardView'),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(Routes.SAHID_OVERVIEW);
              },
              icon: const Icon(Icons.add))
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('SahidID')),
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Relation')),
            DataColumn(label: Text('CreatedAt')),
            DataColumn(label: Text('Action')),
          ],
          rows: controller.sahidFamilydata
              .map((data) => DataRow(
                    cells: [
                      DataCell(Text(data.id.toString())),
                      DataCell(Text(data.shaidId.toString())),
                      DataCell(Text(data.name.toString())),
                      DataCell(Text(data.relation.toString())),
                      DataCell(Text(data.createdAt.toString())),
                      const DataCell(Icon(Icons.delete)),
                    ],
                  ))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.FAMILY);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
