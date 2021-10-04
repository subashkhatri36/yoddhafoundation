import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yoddhafoundation/app/data/model/shaid_children.dart';
import 'package:yoddhafoundation/app/data/model/shaid_model.dart';

class SahidOverviewController extends GetxController
    with SingleGetTickerProviderMixin {
  List<ShaidChildren> childrenData = [
    ShaidChildren(
        id: 1,
        shaidId: 1,
        name: "amar",
        relation: "father",
        dob: DateTime.parse("2073-09-27"),
        educationQualification: 'slc',
        currentlyStudyingLevel: 'plus 2',
        faculty: "science",
        occupation: "student",
        financialStatus: "poor",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now())
  ];
  List<ShaidChildren> sahidfamilyData = [];
  List<Sahid> sahidData = [
    Sahid(
        id: 1,
        name: 'Ram',
        state: 'karnali',
        deathdate: DateTime.parse('2073-09-27'),
        deathplace: 'biratnagar',
        responsible: 'party sangathan',
        gender: 'male',
        image: "",
        district: "dailekh",
        updatedAt: DateTime.now(),
        createdAt: DateTime.now()),
    Sahid(
        id: 2,
        name: 'Shyam',
        state: 'karnali',
        deathdate: DateTime.parse('2073-09-27'),
        deathplace: 'biratnagar',
        responsible: 'party sangathan',
        gender: 'male',
        image: "",
        district: "dailekh",
        updatedAt: DateTime.now(),
        createdAt: DateTime.now()),
    Sahid(
        id: 3,
        name: 'Gopal',
        state: 'karnali',
        deathdate: DateTime.parse('2073-09-27'),
        deathplace: 'biratnagar',
        responsible: 'party sangathan',
        gender: 'male',
        image: "",
        district: "dailekh",
        updatedAt: DateTime.now(),
        createdAt: DateTime.now()),
  ];
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
