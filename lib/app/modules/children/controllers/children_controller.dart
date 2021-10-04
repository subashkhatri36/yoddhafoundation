import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/controller.dart';
import 'package:yoddhafoundation/app/constant/enum.dart';
import 'package:yoddhafoundation/app/data/model/shaid_children.dart';
import 'package:yoddhafoundation/app/data/repositories/shaid_children.dart';

class ChildrenController extends GetxController {
  final List childrenList = ["छोरा", "छोरी"];
  RxString childValue = "छोरा".obs;
  final TextEditingController childName = TextEditingController();
  final TextEditingController dob = TextEditingController();
  final TextEditingController eduQulification = TextEditingController();
  final TextEditingController stuLevel = TextEditingController();
  final TextEditingController faculty = TextEditingController();
  final TextEditingController occupation = TextEditingController();
  final TextEditingController financeStatus = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }

  ShaidChildren? gloabalchildren;

//loading initial data
  void loadData(ShaidChildren children) {
    //load
    childName.text = children.name;
    dob.text = children.dob.toString();
    eduQulification.text = children.educationQualification;
    stuLevel.text = children.currentlyStudyingLevel;
    faculty.text = children.faculty;
    occupation.text = children.occupation;
    financeStatus.text = children.financialStatus;
    childValue.value = children.relation;
    gloabalchildren = children;
  }

  void saved(OPERATION operation) {
    ShaidChildren children = ShaidChildren(
        name: childName.text,
        relation: childValue.value,
        dob: DateTime.parse(dob.text),
        educationQualification: eduQulification.text,
        currentlyStudyingLevel: stuLevel.text,
        faculty: faculty.text,
        occupation: occupation.text,
        financialStatus: financeStatus.text,
        createdAt: operation == OPERATION.update
            ? gloabalchildren!.createdAt
            : DateTime.now(),
        updatedAt: DateTime.now());

    //if it is updated then
    if (operation == OPERATION.update) {
      children.id = gloabalchildren!.id;
      children.shaidId = gloabalchildren!.shaidId;
      shaidChildren.shaidChildrenupdate(children);
    } else {
      appController.coreShaidModel!.shaidChildren!.add(children);
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
