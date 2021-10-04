import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/controller.dart';
import 'package:yoddhafoundation/app/data/repositories/shaid_family.dart';
import 'package:yoddhafoundation/app/widgets/button/custom_button.dart';

class FamilyDashboardController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  deleteFamilyData(String name) async {
    bool value = await showDialog(
        context: Get.context!,
        builder: (context) {
          return AlertDialog(
            title: const Text('Warning !!!'),
            content: const Text('Are you sure? Do you want to delete data?'),
            actions: [
              CustomButton(
                  onpressed: () {
                    Navigator.of(Get.context!).pop(false);
                  },
                  btnText: 'No'),
              CustomButton(
                  onpressed: () {
                    Navigator.of(Get.context!).pop(true);
                  },
                  btnText: 'Yes')
            ],
          );
        });
    if (value) {
      appController.coreShaidModel!.shaidFamily!
          .removeWhere((element) => element.name == name);
    }
    appController.familyListDataChange.toggle();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
