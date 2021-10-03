import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/controller.dart';
import 'package:yoddhafoundation/app/data/model/shaid_children.dart';
import 'package:yoddhafoundation/app/data/repositories/shaid_children.dart';
import 'package:yoddhafoundation/app/widgets/button/custom_button.dart';

class ChildrenDashboardController extends GetxController {
  deleteChildrenData(int id) async {
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
      int a = await shaidChildren.shaidChildrenDelete(id);
      if (a > 0) {
        appController.coreShaidModel!.shaidChildren!
            .removeWhere((element) => element.id == id);
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
