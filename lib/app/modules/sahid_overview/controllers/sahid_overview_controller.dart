import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/controller.dart';
import 'package:yoddhafoundation/app/constant/db_name.dart';
import 'package:yoddhafoundation/app/constant/enum.dart';
import 'package:yoddhafoundation/app/core/service/storage_service/shared_preference.dart';
import 'package:yoddhafoundation/app/data/model/shaid_core_model.dart';
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
      model = appController.coreShaidModel =
          appController.offlineShaidModel[appController.index];
    }
    isloading.toggle();
  }

  //save data to database
  savedData() async {
    //first save shaid data
    appController.offlineShaidModel.add(appController.coreShaidModel!);
    await shareprefrence.save(
        DBname.shaid, appController.offlineShaidModel.toJson());
    appController.coreShaidModel = null;
    customSnackbar(message: "Data Saved Successfully");
    Get.offAllNamed(Routes.dashboard);

    //display success message and redirect to dashboard
  }

  //update data to database
  updateData() async {
    appController.shaidDataOffline.value = false;
    //first save shaid data
    appController.offlineShaidModel[appController.index] =
        appController.coreShaidModel!;
    await shareprefrence.save(
        DBname.shaid, appController.offlineShaidModel.toJson());
    appController.coreShaidModel = null;
    appController.shaidDataOffline.value = true;
    Get.offAllNamed(Routes.dashboard);
  }

  @override
  void onClose() {}
}
