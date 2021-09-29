import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }

  void login() {
    if (formkey.currentState!.validate()) {
      //do what we want to do
      //call api
    } else {
      //custome snackbar
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
