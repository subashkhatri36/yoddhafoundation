import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/controller.dart';
import 'package:yoddhafoundation/app/constant/string.dart';
import 'package:yoddhafoundation/app/core/service/storage_service/shared_preference.dart';
import 'package:yoddhafoundation/app/data/model/response_model.dart';
import 'package:yoddhafoundation/app/data/repositories/login_api_call.dart';
import 'package:yoddhafoundation/app/routes/app_pages.dart';
import 'package:yoddhafoundation/app/widgets/custom_snackbar.dart';

class LoginController extends GetxController {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }

  void login() async {
    if (formkey.currentState!.validate()) {
      //do what we want to do
      //call api
      final ApiCall response =
          await userlogin.login(username.text, password.text);
      if (!response.iserror) {
        shareprefrence.save(Strings.logintoken, response.response);
        appController.accesstoken = response.response;
        Get.offNamed(Routes.DASHBOARD);
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
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
