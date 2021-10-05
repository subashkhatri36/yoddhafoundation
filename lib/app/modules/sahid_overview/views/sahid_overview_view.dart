import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/constants.dart';
import 'package:yoddhafoundation/app/constant/controller.dart';
import 'package:yoddhafoundation/app/constant/enum.dart';
import 'package:yoddhafoundation/app/data/model/shaid_children.dart';
import 'package:yoddhafoundation/app/data/model/shaid_family.dart';
import 'package:yoddhafoundation/app/routes/app_pages.dart';
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
                          argument[0] == OPERATION.insert
                              ? 'Submit'
                              : 'Updated',
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

class ShaidDetailWidget extends StatelessWidget {
  OPERATION args;
  ShaidDetailWidget({Key? key, required this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: double.infinity,
        // color: Colors.green,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: appController.coreShaidModel!.shaidChildren!.length,
            itemBuilder: (context, index) {
              ShaidChildren children =
                  appController.coreShaidModel!.shaidChildren![index];
              return Card(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: Constants.defaultMargin,
                      horizontal: Constants.defaultMargin / 2),
                  child: Row(
                    children: [
                      Container(
                        // color: Colors.green,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                              field: 'Studying Level',
                              value: children.currentlyStudyingLevel,
                            ),
                            ListItemWidget(
                              field: 'Faculty',
                              value: children.faculty,
                            ),
                            ListItemWidget(
                              field: 'Occuptaion',
                              value: children.occupation,
                            ),
                          ],
                        ),
                      ),
                      Container(
                          width: 150,
                          height: 185,
                          child: Column(
                            children: [
                              const ClipRRect(
                                child: Image(
                                    fit: BoxFit.contain,
                                    image: AssetImage(
                                        "assets/images/auctionlogo.PNG")),
                              ),
                              InkWell(
                                  onTap: () {
                                    Get.toNamed(
                                      Routes.CHILDREN,
                                      arguments: [OPERATION.update, children],
                                    );
                                  },
                                  child: const Icon(Icons.edit)),
                            ],
                          ))
                    ],
                  ),
                ),
              );
            }));
  }
}

class FamilyDisplayWidget extends StatelessWidget {
  OPERATION args;
  FamilyDisplayWidget({Key? key, required this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: double.infinity,
        // color: Colors.deepOrange,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: args == OPERATION.insert
                ? appController.coreShaidModel!.shaidFamily!.length
                : appController
                    .offlineShaidModel[appController.index].shaidFamily!.length,
            itemBuilder: (context, index) {
              ShaidFamily family = args == OPERATION.insert
                  ? appController.coreShaidModel!.shaidFamily![index]
                  : appController.offlineShaidModel[appController.index]
                      .shaidFamily![index];
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
                      ListItemWidget(
                        field: 'Occupation',
                        value: family.occupation,
                      ),
                      ListItemWidget(
                        field: 'Financial Condition',
                        value: family.financialStatus,
                      ),
                      ListItemWidget(
                        field: 'Remarks',
                        value: family.remarks,
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}

class ChildrenDisplayWidget extends StatelessWidget {
  OPERATION args;
  ChildrenDisplayWidget({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: double.infinity,
        // color: Colors.deepOrange,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: args == OPERATION.insert
                ? appController.coreShaidModel!.shaidChildren!.length
                : appController.offlineShaidModel[appController.index]
                    .shaidChildren!.length,
            itemBuilder: (context, index) {
              ShaidChildren children = args == OPERATION.insert
                  ? appController.coreShaidModel!.shaidChildren![index]
                  : appController.offlineShaidModel[appController.index]
                      .shaidChildren![index];
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
                        value:
                            DateTime.parse(children.dob.toString()).toString(),
                      ),
                      ListItemWidget(
                        field: 'Education Qualification:',
                        value: children.educationQualification,
                      ),
                      ListItemWidget(
                        field: 'Studying Level',
                        value: children.currentlyStudyingLevel,
                      ),
                      ListItemWidget(
                        field: 'Faculty',
                        value: children.faculty,
                      ),
                      ListItemWidget(
                        field: 'Occupation',
                        value: children.occupation,
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
