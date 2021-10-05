import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/constants.dart';
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
                              : 'Close',
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
    final controller = Get.find<SahidOverviewController>();
    return Container(
      height: 100,
      width: double.infinity,
      color: Colors.green,
      child: Column(
        children: [
          //Image.file(appController.coreShaidModel!.shaid.image),
          Row(
            children: [
              Text(
                'Name : ',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: Constants.defaultFontSize + 5),
              ),
              Text(controller.model!.shaid.name),
            ],
          ),
          Row(
            children: [
              const Text('address : '),
              Text(controller.model!.shaid.state),
            ],
          ),
        ],
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
    return Container(
        height: 50,
        width: double.infinity,
        color: Colors.deepOrange,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.model!.shaidFamily!.length,
            itemBuilder: (context, index) {
              ShaidFamily family = controller.model!.shaidFamily![index];

              return ListTile(
                title: Text(family.name),
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
    return Container(
        height: 50,
        width: double.infinity,
        color: Colors.deepOrange,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.model!.shaidChildren!.length,
            itemBuilder: (context, index) {
              ShaidChildren children = controller.model!.shaidChildren![index];

              return ListTile(
                title: Text(children.name),
              );
            }));
  }
}
