import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/controller.dart';
import 'package:yoddhafoundation/app/constant/db_name.dart';
import 'package:yoddhafoundation/app/constant/enum.dart';
import 'package:yoddhafoundation/app/core/service/storage_service/shared_preference.dart';
import 'package:yoddhafoundation/app/data/model/shaid_family.dart';
import 'package:yoddhafoundation/app/modules/sahid_overview/controllers/sahid_overview_controller.dart';
import 'package:yoddhafoundation/app/widgets/custom_snackbar.dart';

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

  ShaidFamily? gloabalfamily;

//loading initial data
  void loadData(ShaidFamily family) {
    //load
    familyName.text = family.name;
    age.text = family.age.toString();

    memberValue.value = family.relation;
    gloabalfamily = family;
  }

  void saved(OPERATION operation) async {
    if (formkey.currentState!.validate()) {
      ShaidFamily family = ShaidFamily(
          name: familyName.text,
          relation: memberValue.value,
          age: int.parse(age.text),
          createdAt: operation == OPERATION.update
              ? gloabalfamily!.createdAt
              : DateTime.now(),
          updatedAt: DateTime.now());

      //if it is updated then
      if (operation == OPERATION.update) {
        family.id = gloabalfamily!.id;
        family.shaidId = gloabalfamily!.shaidId;
        appController.offlineShaidModel[appController.index]
            .shaidFamily![appController.familyindex] = family;
        await shareprefrence.save(
            DBname.shaid, appController.offlineShaidModel.toJson());
        Get.find<SahidOverviewController>().checkInfo(operation);
      } else {
        appController.coreShaidModel!.shaidFamily!.add(family);
        appController.familyListDataChange.toggle();
      }
      Get.back();
    } else {
      //error
      customSnackbar(message: 'There is an error please check');
    }
  }

  @override
  void onClose() {}
}
