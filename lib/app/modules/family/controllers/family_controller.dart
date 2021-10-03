import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/controller.dart';
import 'package:yoddhafoundation/app/constant/enum.dart';
import 'package:yoddhafoundation/app/data/model/shaid_family.dart';
import 'package:yoddhafoundation/app/data/repositories/shaid_family.dart';

class FamilyController extends GetxController {
  RxString memberValue = 'आमा'.obs;
  final List familymemberList = [
    "आमा",
    "बुबा",
    "श्रीमान / श्रीमती",
    "दाजु",
    "भाई",
    "दिदि",
    "बहिनि"
  ];
  final TextEditingController familyName = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController occupation = TextEditingController();
  final TextEditingController financialStatus = TextEditingController();
  final TextEditingController remarks = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }

  ShaidFamily? gloabalfamily;

//loading initial data
  void loadData(ShaidFamily family) {
    //load
    familyName.text = family.name;
    age.text = family.age.toString();
    occupation.text = family.occupation;
    financialStatus.text = family.financialStatus;
    remarks.text = family.remarks;
    occupation.text = family.occupation;
    memberValue.value = family.relation;
    gloabalfamily = family;
  }

  void saved(OPERATION operation) {
    ShaidFamily family = ShaidFamily(
        name: familyName.text,
        relation: memberValue.value,
        age: int.parse(age.text),
        occupation: occupation.text,
        financialStatus: financialStatus.text,
        remarks: remarks.text,
        createdAt: operation == OPERATION.update
            ? gloabalfamily!.createdAt
            : DateTime.now(),
        updatedAt: DateTime.now());

    //if it is updated then
    if (operation == OPERATION.update) {
      family.id = gloabalfamily!.id;
      family.shaidId = gloabalfamily!.shaidId;
      shaidFamily.shaidFamilyupdate(family);
    } else {
      appController.coreShaidModel!.shaidFamily!.add(family);
      appController.childrenListDataChange.toggle();
    }
    Get.back();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
