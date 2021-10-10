import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/db_name.dart';
import 'package:yoddhafoundation/app/constant/string.dart';
import 'package:yoddhafoundation/app/core/service/storage_service/shared_preference.dart';
import 'package:yoddhafoundation/app/data/model/shaid_core_model.dart';
import 'package:yoddhafoundation/app/data/model/user.dart';

class AppController extends GetxController {
  double width = 0.0;
  double height = 0.0;
  String accesstoken = '';
  bool authorized = false;
  //Core list
  RxList<CoreShaidModel> offlineShaidModel =
      List<CoreShaidModel>.empty(growable: true).obs;
  User? user;

  //Check if data is there or not in shaid database
  RxBool shaidDataOffline = false.obs;

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
    //print('starting fetching database');
    shaidDataOffline.value = false;

    if (offlineShaidModel.isNotEmpty) {
      offlineShaidModel.clear();
    }

    var shaidDetail = await shareprefrence.read(DBname.shaid);
    if (shaidDetail.isNotEmpty) {
      for (var val in json.decode(shaidDetail)) {
        offlineShaidModel.add(CoreShaidModel.fromJson(val));
      }
    }
    shaidDataOffline.value = true;
  }

//inserting all data gather from user into database
  CoreShaidModel? coreShaidModel;
  int index = 0;
  int childrenindex = 0;
  int familyindex = 0;
  RxBool savingData = false.obs;
}
