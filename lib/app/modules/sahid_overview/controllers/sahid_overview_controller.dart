import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yoddhafoundation/app/data/model/shaid_children.dart';

class SahidOverviewController extends GetxController
    with SingleGetTickerProviderMixin {
  List<ShaidChildren> childrenData = [
    // ShaidChildren(
    //     id: 1,
    //     shaidId: 1,
    //     name: "amar",
    //     relation: "father",
    //     dob: "2020-201-19",
    //     educationQualification: educationQualification,
    //     currentlyStudyingLevel: currentlyStudyingLevel,
    //     faculty: faculty,
    //     occupation: occupation,
    //     financialStatus: financialStatus,
    //     createdAt: createdAt,
    //     updatedAt: updatedAt)
  ];
  List<ShaidChildren> sahidfamilyData = [];
  late TabController tabController;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
