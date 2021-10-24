import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/controller.dart';
import 'package:yoddhafoundation/app/constant/db_name.dart';
import 'package:yoddhafoundation/app/constant/enum.dart';
import 'package:yoddhafoundation/app/core/service/storage_service/shared_preference.dart';
import 'package:yoddhafoundation/app/data/model/shaid_children.dart';
import 'package:yoddhafoundation/app/data/model/shaid_core_model.dart';
import 'package:yoddhafoundation/app/data/model/shaid_family.dart';
import 'package:yoddhafoundation/app/routes/app_pages.dart';
import 'package:yoddhafoundation/app/widgets/button/custom_button.dart';
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

  //family edit
  void familyEdit(ShaidFamily family, OPERATION args) {
    Get.toNamed(Routes.family, arguments: [args, family]);
  }

  void familyDelete(OPERATION operation) async {
    bool val = await showDialog(
        context: Get.context!,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              "Warning!",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: const Text("Are you sure to delete?"),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                      onpressed: () {
                        Navigator.of(Get.context!).pop(true);
                      },
                      btnText: "Yes"),
                  CustomButton(
                    onpressed: () {
                      Navigator.of(Get.context!).pop(false);
                    },
                    btnText: "No",
                  )
                ],
              )
            ],
          );
        });
    if (val) {
      if (operation == OPERATION.insert) {
        appController.coreShaidModel!.shaidFamily!
            .removeAt(appController.familyindex);
      } else {
        appController.offlineShaidModel[appController.index].shaidFamily!
            .removeAt(appController.familyindex);
        shareprefrence.save(
            DBname.shaid, appController.offlineShaidModel.toJson());
      }
    }
  }

  //children edit
  void childrenEdit(ShaidChildren children, OPERATION operation) {
    Get.toNamed(Routes.children, arguments: [operation, children]);
  }

  void childrenDelete(OPERATION operation) async {
    bool val = await showDialog(
        context: Get.context!,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              "Warning!",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: const Text("Are you sure to delete?"),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                      onpressed: () {
                        Navigator.of(Get.context!).pop(true);
                      },
                      btnText: "Yes"),
                  CustomButton(
                    onpressed: () {
                      Navigator.of(Get.context!).pop(false);
                    },
                    btnText: "No",
                  )
                ],
              )
            ],
          );
        });
    if (val) {
      if (operation == OPERATION.insert) {
        appController.coreShaidModel!.shaidChildren!
            .removeAt(appController.childrenindex);
      } else {
        appController.offlineShaidModel[appController.index].shaidChildren!
            .removeAt(appController.childrenindex);
        shareprefrence.save(
            DBname.shaid, appController.offlineShaidModel.toJson());
      }
    }
    checkInfo(
      operation,
    );
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
