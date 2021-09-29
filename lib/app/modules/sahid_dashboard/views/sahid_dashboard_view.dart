import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/string.dart';

import '../controllers/sahid_dashboard_controller.dart';

class SahidDashboardView extends GetView<SahidDashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.appName),
        centerTitle: true,
        actions: [
          IconButton(
          onPressed: (){},
           icon: const Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
        columns:const [
          DataColumn(label: Text("Id")),
          DataColumn(label: Text("Name")),
          DataColumn(label: Text("Gender")),
          // DataColumn(label: Text("Death Date")),
          // DataColumn(label: Text("State")),
          // DataColumn(label: Text("District")),
          // DataColumn(label: Text("Local Area")),
          // DataColumn(label: Text("Oda")),
          // DataColumn(label: Text("Tol")),
          // DataColumn(label: Text("Death Place")),
          DataColumn(label: Text("Action")),
      
        ],
       
        rows: <DataRow>[
          DataRow(cells: [
          const DataCell(Text('1')),
          const DataCell(Text('Tanka')),
          const DataCell(Text('Male')),
          DataCell(Row(
            children: [
              IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.delete)),
              IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.edit)),
            ],
          ))
          ]),

            DataRow(cells: [
          const DataCell(Text('2')),
          const DataCell(Text('Subash')),
          const DataCell(Text('Male')),
          DataCell(
            Row(
            children: [
              IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.delete)),
              IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.edit)),
            ],
          ))
          ]),
        ]),
      ));
  }
}
