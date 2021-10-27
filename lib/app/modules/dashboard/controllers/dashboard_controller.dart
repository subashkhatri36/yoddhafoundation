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
    dialogload();
    isSync.value = true;
    bool saved = false;
    // int index = -1;
    //check offline data avilable or not
    List<CoreShaidModel> model = [];
    if (appController.offlineShaidModel.isNotEmpty) {
      model = appController.offlineShaidModel;
    }
    //ConcurrentModificationError (Concurrent modification during iteration: Instance(length:0) of '_GrowableList'.)

    // for (CoreShaidModel m in model)
    for (int i = 0; i < model.length; i++) {
      CoreShaidModel m = model[i];
      // index++;
      saved = false;

      //String token = m.shaid.token = appController.accesstoken;

      var shaid = await shaidUpload.shaidInfoUpload(m.shaid);
      if (!shaid.iserror) {
        saved = true;
      } else {
        saved = false;
      }

      if (!shaid.iserror) {
        //other code
        int id = shaid.response;

        ///work on shaid children
        if (m.shaidChildren != null && m.shaidChildren!.isNotEmpty) {
          List<ShaidChildren> ch = m.shaidChildren!;
          for (ShaidChildren c in ch) {
            //   c.token = token;
            c.shaidId = id;
            var child = await shaidUpload.shaidChildrenUpload(c, id);
            if (!child.iserror) {
              saved = true;
            } else {
              saved = false;
              customSnackbar(
                  message: 'child : ' + child.error,
                  snackPosition: SnackPosition.TOP,
                  leadingIcon: Icons.warning);
            }
          }
        } else {
          saved = true;
        }

        //saving family

        ///work on shaid family
        if (m.shaidFamily != null && m.shaidFamily!.isNotEmpty) {
          List<ShaidFamily> ch = m.shaidFamily!;
          for (ShaidFamily c in ch) {
            // c.token = token;
            c.shaidId = id;
            var family = await shaidUpload.shaidFamilyUpload(c, id);
            if (!family.iserror) {
              saved = true;
            } else {
              saved = false;
              customSnackbar(
                  message: 'family : ' + family.error,
                  snackPosition: SnackPosition.TOP,
                  leadingIcon: Icons.warning);
            }
          }
        } else {
          saved = true;
        }

        //end of saving family

        if (saved) {
          //saved
          if (i < appController.offlineShaidModel.length) {
            appController.offlineShaidModel.removeAt(i);
          }
        }
      } else {
        if (shaid.error == "Unauthorized") {
          customSnackbar(message: 'Sorry !${shaid.error}');
          // await shareprefrence.remove(Strings.logintoken);
          // await shareprefrence.remove(Strings.userInfo);
          // Get.offAllNamed(Routes.login);
        } else {
          customSnackbar(message: shaid.error);
          print(appController.accesstoken);
          if (shaid.error == "Unauthenticated.") {
            // appController.accesstoken = "";
            // appController.user = null;
            // shareprefrence.remove(Strings.userInfo);
            // shareprefrence.remove(Strings.logintoken);
            // Get.offAllNamed(Routes.login);
          }
        }
        // customSnackbar(message: 'Shaid Data do not to upload.');
      }
    }

    if (appController.offlineShaidModel.isEmpty) {
      await shareprefrence.remove(DBname.shaid);
    }

    isSync.value = false;
    dialogClose();
  }

  dialogClose() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }

  dialogload() {
    Get.dialog(
        Center(
          child: Container(
            color: Colors.white,
            width: appController.width * .7,
            height: appController.height * .3,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Uploading Info...",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ),
        barrierDismissible: false);
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
