import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/controller.dart';
import 'package:yoddhafoundation/app/constant/db_name.dart';
import 'package:yoddhafoundation/app/constant/string.dart';
import 'package:yoddhafoundation/app/core/service/storage_service/shared_preference.dart';
import 'package:yoddhafoundation/app/data/model/shaid_children.dart';
import 'package:yoddhafoundation/app/data/model/shaid_core_model.dart';
import 'package:yoddhafoundation/app/data/model/shaid_family.dart';
import 'package:yoddhafoundation/app/data/repositories/shaid_info_upload.dart';
import 'package:yoddhafoundation/app/widgets/custom_snackbar.dart';

class DashboardController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    shareprefrence.read(Strings.logintoken);
  }

  onlineSyn() async {
    bool saved = false;
    int index = -1;
    //check offline data avilable or not
    List<CoreShaidModel> model = appController.offlineShaidModel;

    if (model.isNotEmpty) {
      for (CoreShaidModel m in model) {
        index++;
        saved = false;

        String token = m.shaid.token = appController.accesstoken;
        int shaidId = 0;
        print("first data " + m.toJson());
        print("token " + token);
        print("read to upload first value");
        var response = await shaidUpload.shaidInfoUpload(m.shaid);
        print('upload shaid');
        print(response);
        if (!response.iserror) {
          if (response.response["status"] == 200) {
            print('status');
            shaidId = response.response["sahid"]["id"];
            print('assign id;');

            ///work on shaid children
            if (m.shaidChildren != null) {
              List<ShaidChildren> ch = m.shaidChildren!;
              for (ShaidChildren c in ch) {
                c.token = token;
                c.shaidId = shaidId;
                var child = await shaidUpload.shaidChildrenUpload(c, shaidId);
                if (!child.iserror) {
                  if (response.response["status"] == 200) {
                    print('success');
                    saved = true;
                  } else {
                    saved = false;
                  }
                } else {
                  saved = false;
                  customSnackbar(
                      message: 'child : ' + response.error,
                      snackPosition: SnackPosition.TOP,
                      leadingIcon: Icons.warning);
                }
              }
            }

            ///work on shaid family
            if (m.shaidFamily != null) {
              List<ShaidFamily> ch = m.shaidFamily!;
              for (ShaidFamily c in ch) {
                c.token = token;
                c.shaidId = shaidId;
                var child = await shaidUpload.shaidFamilyUpload(c, shaidId);
                if (!child.iserror) {
                  if (response.response["status"] == 200) {
                    print('success');
                    saved = true;
                  } else {
                    saved = false;
                  }
                } else {
                  saved = false;
                  customSnackbar(
                      message: 'family : ' + response.error,
                      snackPosition: SnackPosition.TOP,
                      leadingIcon: Icons.warning);
                }
              }
            }
          } else {
            saved = false;
          }
        } else {
          saved = false;
          customSnackbar(
              message: response.error,
              snackPosition: SnackPosition.TOP,
              leadingIcon: Icons.warning);
        }
        if (saved) {
          //saved
          if (index < appController.offlineShaidModel.length) {
            // appController.offlineShaidModel.removeAt(index);
          }
        }
      }
    } else {
      customSnackbar(message: 'Nothing to upload.');
    }
    if (appController.offlineShaidModel.isEmpty) {
      await shareprefrence.remove(DBname.shaid);
    }

    //check connection
    //upload shaid
    //get shaid id && token id
    //update children with shaid id
    //update family with shaid id
    //remove shaid data.
  }

  @override
  void onClose() {}
}
