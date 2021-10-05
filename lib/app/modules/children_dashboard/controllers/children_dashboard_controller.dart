import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/controller.dart';
import 'package:yoddhafoundation/app/widgets/button/custom_button.dart';

class ChildrenDashboardController extends GetxController {
  deleteChildrenData(String name) async {
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
      appController.coreShaidModel!.shaidChildren!
          .removeWhere((element) => element.name == name);
    }
  }

  //children
  //

  @override
  void onClose() {}
}
