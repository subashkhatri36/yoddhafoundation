import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/controller.dart';
import 'package:yoddhafoundation/app/constant/db_name.dart';
import 'package:yoddhafoundation/app/constant/string.dart';
import 'package:yoddhafoundation/app/core/service/storage_service/shared_preference.dart';
import 'package:yoddhafoundation/app/data/model/shaid_children.dart';
import 'package:yoddhafoundation/app/data/model/shaid_core_model.dart';
import 'package:yoddhafoundation/app/data/model/shaid_family.dart';
import 'package:yoddhafoundation/app/data/model/user.dart';
import 'package:yoddhafoundation/app/data/repositories/login_api_call.dart';
import 'package:yoddhafoundation/app/data/repositories/shaid_info_upload.dart';
import 'package:yoddhafoundation/app/data/repositories/user_repo.dart';
import 'package:yoddhafoundation/app/routes/app_pages.dart';
import 'package:yoddhafoundation/app/widgets/custom_snackbar.dart';

class DashboardController extends GetxController {
  User? userInfo;
  RxBool getuserInfo = false.obs;
  RxBool isSync = false.obs;
  // @override
  // void onInit() {
  //   super.onInit();
  //   // shareprefrence.read(Strings.logintoken);
  // }

  onlineSyn() async {
    isSync.value = true;
    bool saved = false;
    int index = -1;
    int nothingvalue = 0;
    //check offline data avilable or not
    List<CoreShaidModel> model = appController.offlineShaidModel;

    if (model.isNotEmpty) {
      for (CoreShaidModel m in model) {
        index++;
        saved = false;
        String token = m.shaid.token = appController.accesstoken;
        int shaidId = 0;
        var response = await shaidUpload.shaidInfoUpload(m.shaid);
        if (!response.iserror) {
          if (response.response["status"] == 200) {
            shaidId = response.response["sahid"]["id"];

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
            appController.offlineShaidModel.removeAt(index);
          }
        }
      }
    } else {
      customSnackbar(message: 'Nothing to upload.');
    }
    if (appController.offlineShaidModel.isEmpty) {
      await shareprefrence.remove(DBname.shaid);
    }

    isSync.value = false;
  }

  fetchuserdata() async {
    getuserInfo.value = true;

    var responseData = await userRepo.userDataFetch();
    if (responseData.iserror) {
      customSnackbar(message: responseData.error);
    } else {
      userInfo = User.fromJson(responseData.response);
      //User(id: resonse, name: name, email: email, roleId: roleId, emailVerifiedAt: emailVerifiedAt, rememberToken: rememberToken, createdAt: createdAt, updatedAt: updatedAt);
    }
    getuserInfo.value = false;
    /*
      {
    "id": 3,
    "name": "Sudeep",
    "email": "bjr.sudeep@gmail.com",
    "role_id": "2",
    "email_verified_at": "2021-09-29T07:19:07.000000Z",
    "status": "1",
    "created_at": "2021-09-29T07:19:07.000000Z",
    "updated_at": "2021-09-29T07:19:07.000000Z"
}
    
     */
  }

  userlogOut() async {
    bool resp = await userlogin.logout(appController.accesstoken);
    if (resp) {
      shareprefrence.remove(Strings.logintoken);
      appController.authorized = false;
      Get.offAllNamed(Routes.login);
    }
  }

  @override
  void onClose() {}
}
