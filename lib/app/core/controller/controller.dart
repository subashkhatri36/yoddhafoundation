import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/string.dart';
import 'package:yoddhafoundation/app/core/service/storage_service/shared_preference.dart';
import 'package:yoddhafoundation/app/data/model/shaid_core_model.dart';
import 'package:yoddhafoundation/app/data/model/shaid_model.dart';
import 'package:yoddhafoundation/app/widgets/custom_snackbar.dart';

class AppController extends GetxController {
  double width = 0.0;
  double height = 0.0;
  String accesstoken = '';
  bool authorized = false;

//for offline uses
  RxList<Sahid> shaidListModelOffline = List<Sahid>.empty(growable: true).obs;
  // RxList<ShaidFamily> shaidFamilyListModelOffline =
  //     List<ShaidFamily>.empty(growable: true).obs;
  // RxList<ShaidChildren> shaidChildrenListModelOffline =
  //     List<ShaidChildren>.empty(growable: true).obs;

  //Core list
  RxList<CoreShaidModel> offlineShaidModel =
      List<CoreShaidModel>.empty(growable: true).obs;
  RxList<CoreShaidModel> onlineShaidModel =
      List<CoreShaidModel>.empty(growable: true).obs;

  //Check if data is there or not in shaid database
  RxBool shaidDataOffline = false.obs;
  RxBool shaidDataOnline = false.obs;

  RxBool childrenListDataChange = false.obs;
  RxBool familyListDataChange = false.obs;

  init() async {
    width = MediaQuery.of(Get.context!).size.width;
    height = MediaQuery.of(Get.context!).size.height;
    await loadDatabase();
  }

  Future loadDatabase() async {
    accesstoken = await shareprefrence.read(Strings.logintoken);
    if (accesstoken.isNotEmpty) {
      authorized = true;
    } else {
      authorized = false;
    }
    await loadOfflineDatabase();
  }

  loadOfflineDatabase() async {
    shaidDataOffline.value = false;
    List<Sahid> shaids = [];
    //  shaids = await shaidRepo.getAllShaid();
    if (shaids.isNotEmpty) {
      //here store all shaid data
      // if (shaidListModelOffline.isNotEmpty) {
      //   shaidListModelOffline.clear();
      // }
      if (offlineShaidModel.isNotEmpty) {
        offlineShaidModel.clear();
      }
    } else {
      //There is no data message display

    }
    shaidDataOffline.value = true;
  }

//inserting all data gather from user into database
  CoreShaidModel? coreShaidModel;
  int index = 0;
  RxBool savingData = false.obs;
  insertIntoDatabase() async {
    //coreShaidModel=CoreShaidModel(shaid: shaid);
    savingData.value = true;
    if (coreShaidModel != null) {
      int a = -1; // await shaidRepo.shaidInsert(coreShaidModel!.shaid);
      if (a != -1) {
        customSnackbar(message: 'Shaid Info Saved.');
        int val = -1;
        if (coreShaidModel!.shaidChildren != null) {
          coreShaidModel!.shaidChildren!.map((e) async {
            e.shaidId = a;

            // val = await shaidChildren.shaidChildrenInsert(e);
          });
          if (val > 0) {
            customSnackbar(message: 'Children Data Saved.');
          } else {
            customSnackbar(message: 'Error Savind Children Data.');
          }
        } else {
          customSnackbar(message: 'There are no shaid children.');
        }
        //now storing shaid family
        if (coreShaidModel!.shaidFamily != null) {
          coreShaidModel!.shaidFamily!.map((e) async {
            e.shaidId = a;
            // val = await shaidFamily.shaidFamilyInsert(e);
          });

          if (val > 0) {
            customSnackbar(message: 'Family Data Saved.');
          } else {
            customSnackbar(message: 'Error Savind Family Data.');
          }
        } else {
          customSnackbar(message: 'There are no shaid Family.');
        }
      } else {
        customSnackbar(message: 'Error while saving data.');
      }
    } else {
      customSnackbar(message: 'Cannot Saved Data becuase Data is empty.');
    }

    savingData.value = false;
  }

  // loadOnlineDatabase() async {
  //   shaidDataOnline.value = false;
  //   List<Sahid> shaids = [];
  //   shaids = await shaidRepo.getAllShaid();
  //   if (shaids != null && shaids.isNotEmpty) {
  //     //here store all shaid data
  //     shaidDataOnline.value = true;
  //   } else {
  //     //There is no data message display

  //   }
  //   shaidDataOnline.value = true;
  // }
}
