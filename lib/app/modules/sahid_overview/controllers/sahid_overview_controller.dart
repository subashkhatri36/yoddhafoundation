import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/controller.dart';
import 'package:yoddhafoundation/app/constant/enum.dart';
import 'package:yoddhafoundation/app/data/model/shaid_children.dart';
import 'package:yoddhafoundation/app/data/model/shaid_core_model.dart';
import 'package:yoddhafoundation/app/data/model/shaid_family.dart';
import 'package:yoddhafoundation/app/routes/app_pages.dart';
import 'package:yoddhafoundation/app/widgets/custom_snackbar.dart';

class SahidOverviewController extends GetxController
    with SingleGetTickerProviderMixin {
  late TabController tabController;
  CoreShaidModel? model;
  RxBool isloading = false.obs;
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
  }

  checkInfo(
    OPERATION operation,
  ) {
    isloading.toggle();
    if (operation == OPERATION.insert) {
      model = appController.coreShaidModel;
    } else {
      model = appController.offlineShaidModel[appController.index];
    }
    isloading.toggle();
  }

  //save data to database
  savedData() async {
    //first save shaid data
    int result = 1; // await shaidRepo.shaidInsert(model!.shaid);
    int val = 0;
    if (result > 0) {
      if (model!.shaidChildren != null) {
        List<ShaidChildren> child = model!.shaidChildren!;
        for (ShaidChildren children in child) {
          children.shaidId = result;
          // val = await shaidChildren.shaidChildrenInsert(children);
        }
      }
      if (model!.shaidFamily != null) {
        List<ShaidFamily> fam = model!.shaidFamily!;
        for (ShaidFamily family in fam) {
          family.shaidId = result;
          //  val = await shaidFamily.shaidFamilyInsert(family);
        }
      }
      if (val > 0) {
        customSnackbar(title: 'Info', message: 'Sucessfully Saved');
        appController.offlineShaidModel.add(model!);
        Get.offAllNamed(Routes.dashboard);
      }
    } else {
      customSnackbar(
          title: 'Saving Failed!',
          message: 'SomeThing wrong with Saving ShaidInformation');
    }

    //display success message and redirect to dashboard
  }

  //update data to database
  updateData() async {
    //first save shaid data
    int result = 1; // await shaidRepo.shaidInsert(model!.shaid);
    int val = 0;
    if (result > 0) {
      if (model!.shaidChildren != null) {
        List<ShaidChildren> child = model!.shaidChildren!;
        for (ShaidChildren children in child) {
          children.shaidId = result;
          // val = await shaidChildren.shaidChildrenInsert(children);
        }
      }
      if (model!.shaidFamily != null) {
        List<ShaidFamily> fam = model!.shaidFamily!;
        for (ShaidFamily family in fam) {
          family.shaidId = result;
          // val = await shaidFamily.shaidFamilyInsert(family);
        }
      }
      if (val > 0) {
        customSnackbar(title: 'Info', message: 'Sucessfully Saved');
        appController.offlineShaidModel.add(model!);
        Get.offAllNamed(Routes.dashboard);
      }
    } else {
      customSnackbar(
          title: 'Saving Failed!',
          message: 'SomeThing wrong with Saving ShaidInformation');
    }
    //first update shaid data

    //updated children data

    //updated family data

    //display success message and redirect to dashboard
  }

  @override
  void onClose() {}
}
