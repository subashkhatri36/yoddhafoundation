import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/controller.dart';
import 'package:yoddhafoundation/app/constant/enum.dart';
import 'package:yoddhafoundation/app/data/model/shaid_children.dart';
import 'package:yoddhafoundation/app/data/model/shaid_family.dart';

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
                    const Expanded(
                      flex: 5,
                      child: ShaidDetailWidget(),
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
                              ? 'Finished'
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
  const ShaidDetailWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      color: Colors.green,
      child: Column(
        children: [
          Row(
            children: [
              Text('Name : '),
              Text('Sabcd'),
            ],
          ),
        ],
      ),
    );
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
        color: Colors.deepOrange,
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
              return ListTile(
                title: Text(family.name),
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
        color: Colors.deepOrange,
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
              return ListTile(
                title: Text(children.name),
              );
            }));
  }
}
