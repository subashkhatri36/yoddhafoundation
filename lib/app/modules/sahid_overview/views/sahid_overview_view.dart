import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import 'package:yoddhafoundation/app/constant/constants.dart';
import 'package:yoddhafoundation/app/constant/enum.dart';
import 'package:yoddhafoundation/app/data/model/shaid_children.dart';
import 'package:yoddhafoundation/app/data/model/shaid_family.dart';
import 'package:yoddhafoundation/app/widgets/list_item_widget.dart';

import '../controllers/sahid_overview_controller.dart';

class SahidOverviewView extends GetView<SahidOverviewController> {
  final argument = Get.arguments;
  SahidOverviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.checkInfo(
      argument[0],
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Overview'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isloading.isTrue
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      flex: 5,
                      child: ShaidDetailWidget(args: argument[0]),
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
                                    ChildrenDisplayWidget(args: argument[0]),
                                    FamilyDisplayWidget(args: argument[0]),
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: ElevatedButton(
                        onPressed: () {
                          argument[0] == OPERATION.insert
                              ? controller.savedData()
                              : controller.updateData();
                        },
                        child: Text(
                          argument[0] == OPERATION.insert ? 'Submit' : 'Close',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ShaidDetailWidget extends StatelessWidget {
  OPERATION args;
  ShaidDetailWidget({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SahidOverviewController>();
    return Card(
      child: Container(
        margin: const EdgeInsets.symmetric(
            vertical: Constants.defaultMargin,
            horizontal: Constants.defaultMargin / 2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListItemWidget(
                      field: 'Name',
                      value: controller.model!.shaid.name,
                    ),
                    ListItemWidget(
                      field: 'Gender',
                      value: controller.model!.shaid.gender,
                    ),
                    ListItemWidget(
                      field: 'Death Date:',
                      value: controller.model!.shaid.deathdate
                          .toString()
                          .substring(0, 9),
                    ),
                    ListItemWidget(
                      field: 'State:',
                      value: controller.model!.shaid.state,
                    ),
                    ListItemWidget(
                      field: 'District:',
                      value: controller.model!.shaid.district,
                    ),
                    ListItemWidget(
                      field: 'Death Place:',
                      value: controller.model!.shaid.deathplace,
                    ),
                    ListItemWidget(
                      field: 'Sangathanic Role:',
                      value: controller.model!.shaid.responsible,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: FileImage(
                      File(controller.model!.shaid.image),
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        // Get.toNamed(
                        //   Routes.children,
                        //   arguments: [
                        //     OPERATION.update,
                        //   ],
                        // );
                      },
                      child: const Icon(Icons.edit)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FamilyDisplayWidget extends StatelessWidget {
  final OPERATION args;
  const FamilyDisplayWidget({Key? key, required this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SahidOverviewController>();
    return SizedBox(
        height: 50,
        width: double.infinity,
        // color: Colors.deepOrange,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.model!.shaidFamily!.length,
            itemBuilder: (context, index) {
              ShaidFamily family = controller.model!.shaidFamily![index];
              return Card(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: Constants.defaultMargin,
                      horizontal: Constants.defaultMargin / 2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ListItemWidget(
                        field: 'Name',
                        value: family.name,
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
                  ),
                ),
              );
            }));
  }
}

class ChildrenDisplayWidget extends StatelessWidget {
  final OPERATION args;
  const ChildrenDisplayWidget({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SahidOverviewController>();
    return SizedBox(
        height: 50,
        width: double.infinity,
        // color: Colors.deepOrange,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.model!.shaidChildren!.length,
            itemBuilder: (context, index) {
              ShaidChildren children = controller.model!.shaidChildren![index];
              return Card(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: Constants.defaultMargin,
                      horizontal: Constants.defaultMargin / 2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ListItemWidget(
                        field: 'Name',
                        value: children.name,
                      ),
                      ListItemWidget(
                        field: 'Relation',
                        value: children.relation,
                      ),
                      ListItemWidget(
                        field: 'Date of Birth:',
                        value: DateTime.parse(children.dob.toString())
                            .toString()
                            .substring(0, 9),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
