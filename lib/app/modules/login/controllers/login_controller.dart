import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/controller.dart';
import 'package:yoddhafoundation/app/constant/string.dart';
import 'package:yoddhafoundation/app/core/service/storage_service/shared_preference.dart';
import 'package:yoddhafoundation/app/data/model/response_model.dart';
import 'package:yoddhafoundation/app/data/model/user.dart';
import 'package:yoddhafoundation/app/data/repositories/login_api_call.dart';
import 'package:yoddhafoundation/app/data/repositories/user_repo.dart';
import 'package:yoddhafoundation/app/routes/app_pages.dart';
import 'package:yoddhafoundation/app/widgets/custom_snackbar.dart';

class LoginController extends GetxController {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  RxBool isloginClick = false.obs;

  void login(context) async {
    isloginClick.toggle();
    if (formkey.currentState!.validate()) {
      //do what we want to do
      //call api
      final ApiCall response =
          await userlogin.login(username.text, password.text);
      if (!response.iserror) {
        shareprefrence.save(Strings.logintoken, response.response);
        appController.accesstoken = response.response;
        var userdata = await userRepo.userDataFetch();
        if (!userdata.iserror) {
          appController.user = User(
            id: int.parse(userdata.response["id"].toString()),
            name: userdata.response["name"].toString(),
            email: userdata.response["email"].toString(),
            roleId: int.parse(userdata.response["role_id"].toString()),
          );
          shareprefrence.save(Strings.userInfo, appController.user!.toJson());
        } else {
          customSnackbar(
              message: userdata.error,
              snackPosition: SnackPosition.TOP,
              leadingIcon: Icons.warning);
        }
        appController.authorized = true;
        Get.offNamed(Routes.dashboard);
      } else {
        customSnackbar(
            message: response.error,
            snackPosition: SnackPosition.TOP,
            leadingIcon: Icons.warning);
      }
    } else {
      //custome snackbar
      customSnackbar(
          message: 'Email or Password not valid !',
          snackPosition: SnackPosition.TOP,
          leadingIcon: Icons.warning);
    }
    isloginClick.toggle();
  }

  /*
   HttpService _httpService = HttpServiceImpl();
  
  //turnOvers
  getGetTopTurnOvers() async {
    List<GetTopTurnovers> data = [];
    final response = await _httpService.post(ApiUrl.topTurnovers,
        data: ApiUrl.gettoptrunoverheader);

    final apiData = response.data['d'];
    if (apiData != null)
      apiData.forEach((e) {
        data.add(GetTopTurnovers.fromJson(e));
      });

    return data;
  }

  
  
   */

  @override
  void onClose() {}
}
