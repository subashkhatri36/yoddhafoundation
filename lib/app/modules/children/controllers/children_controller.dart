import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/controller.dart';
import 'package:yoddhafoundation/app/constant/db_name.dart';
import 'package:yoddhafoundation/app/constant/enum.dart';
import 'package:yoddhafoundation/app/core/service/storage_service/shared_preference.dart';
import 'package:yoddhafoundation/app/data/model/shaid_children.dart';
import 'package:yoddhafoundation/app/modules/sahid_overview/controllers/sahid_overview_controller.dart';

class ChildrenController extends GetxController {
  
  String childValue = "छोरा";
  final TextEditingController childName = TextEditingController();
  final TextEditingController dob = TextEditingController();
  final TextEditingController eduQulification = TextEditingController();
  final TextEditingController stuLevel = TextEditingController();
  final TextEditingController faculty = TextEditingController();
  final TextEditingController occupation = TextEditingController();
  final TextEditingController financeStatus = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  ShaidChildren? gloabalchildren;

//loading initial data
  void loadData(ShaidChildren children) {
    //load
    childName.text = children.name;
    dob.text = children.dob;
    childValue = children.relation;
    gloabalchildren = children;
  }

  void saved(OPERATION operation) async {
    ShaidChildren children = ShaidChildren(
        name: childName.text,
        relation: childValue,
        dob: dob.text,
        createdAt: operation == OPERATION.update
            ? gloabalchildren!.createdAt
            : DateTime.now(),
        updatedAt: DateTime.now());

    //if it is updated then
    if (operation == OPERATION.update) {
      children.id = gloabalchildren!.id;
      children.shaidId = gloabalchildren!.shaidId;
      appController.offlineShaidModel[appController.index]
          .shaidChildren![appController.childrenindex] = children;
      await shareprefrence.save(
          DBname.shaid, appController.offlineShaidModel.toJson());
      Get.find<SahidOverviewController>().checkInfo(operation);
    } else {
      appController.coreShaidModel!.shaidChildren!.add(children);
      appController.childrenListDataChange.toggle();
    }

    Get.back();
  }

  @override
  void onClose() {}
}
