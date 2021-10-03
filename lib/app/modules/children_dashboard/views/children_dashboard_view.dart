import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yoddhafoundation/app/routes/app_pages.dart';

import '../controllers/children_dashboard_controller.dart';

class ChildrenDashboardView extends GetView<ChildrenDashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChildrenDashboardView'),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(Routes.FAMILY_DASHBOARD);
              },
              icon: const Icon(Icons.add)),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('Child Name')),
            DataColumn(label: Text('Relation')),
            DataColumn(label: Text('Action')),
          ],
          rows: controller.shaidchildrens
              .map((e) => DataRow(cells: [
                    DataCell(Text(e.id.toString())),
                    DataCell(Text(e.name.toString())),
                    DataCell(Text(e.relation.toString())),
                    const DataCell(Icon(Icons.delete)),
                  ]))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.CHILDREN);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
