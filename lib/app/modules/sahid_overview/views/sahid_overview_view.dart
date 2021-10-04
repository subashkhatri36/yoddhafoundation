import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:get/get.dart';

import '../controllers/sahid_overview_controller.dart';

class SahidOverviewView extends GetView<SahidOverviewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Overview'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                height: 100,
                width: double.infinity,
                // color: Colors.green,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.sahidData.length,
                    itemBuilder: (context, index) {
                      var data = controller.sahidData[index];
                      return Card(
                        child: Column(
                          children: [Text(data.name)],
                        ),
                      );
                    }),
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  TabBar(
                    indicatorWeight: 5.0,
                    labelColor: Colors.black,
                    controller: controller.tabController,
                    tabs: const [
                      Tab(
                        text: 'Children',
                      ),
                      Tab(
                        text: 'Family',
                      ),
                    ],
                  ),
                  Expanded(
                    child: DefaultTabController(
                      length: 2,
                      child: TabBarView(
                          controller: controller.tabController,
                          children: [
                            Container(
                              height: 50,
                              width: double.infinity,
                              color: Colors.yellowAccent,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: DataTable(
                                  columns: const [
                                    DataColumn(label: Text('ID')),
                                    DataColumn(label: Text('Child Name')),
                                    DataColumn(label: Text('Relation')),
                                    DataColumn(label: Text('Dob')),
                                    DataColumn(
                                        label: Text('Education Qualification')),
                                    DataColumn(label: Text('Studying Level')),
                                    DataColumn(label: Text('Faculty')),
                                    DataColumn(label: Text('Occupation')),
                                    DataColumn(
                                        label: Text('Financial Condition')),
                                    DataColumn(label: Text('Action')),
                                  ],
                                  rows: controller.childrenData
                                      .map((e) => DataRow(cells: [
                                            DataCell(Text(e.id.toString())),
                                            DataCell(Text(e.name.toString())),
                                            DataCell(
                                                Text(e.relation.toString())),
                                            DataCell(Text(e.dob.toString())),
                                            DataCell(Text(e
                                                .educationQualification
                                                .toString())),
                                            DataCell(Text(e
                                                .currentlyStudyingLevel
                                                .toString())),
                                            DataCell(
                                                Text(e.faculty.toString())),
                                            DataCell(
                                                Text(e.occupation.toString())),
                                            DataCell(Text(
                                                e.financialStatus.toString())),
                                            const DataCell(Icon(Icons.delete)),
                                          ]))
                                      .toList(),
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: double.infinity,
                              color: Colors.deepOrange,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: DataTable(
                                  columns: const [
                                    DataColumn(label: Text('ID')),
                                    DataColumn(label: Text('Child Name')),
                                    DataColumn(label: Text('Relation')),
                                    DataColumn(label: Text('Action')),
                                  ],
                                  rows: controller.sahidfamilyData
                                      .map((e) => DataRow(cells: [
                                            DataCell(Text(e.id.toString())),
                                            DataCell(Text(e.name.toString())),
                                            DataCell(
                                                Text(e.relation.toString())),
                                            const DataCell(Icon(Icons.delete)),
                                          ]))
                                      .toList(),
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Finish',
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
