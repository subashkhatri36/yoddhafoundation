import 'dart:convert';

import 'package:yoddhafoundation/app/constant/api_link.dart';
import 'package:yoddhafoundation/app/constant/controller.dart';
import 'package:yoddhafoundation/app/core/service/http/http_service.dart';
import 'package:yoddhafoundation/app/data/model/response_model.dart';
import 'package:http/http.dart' as http;

LoginAPI userlogin = LoginAPI();

///it call all user related work
class LoginAPI {
  HttpService httpService = HttpServiceImpl();
  LoginAPI() {
    httpService.init();
  }
  final headers = {
    "Authorization": "Bearer ${appController.accesstoken}",
    "Content-Type": "application/json",
    "Accept": "application/json",
  };
  Future<bool> logout(String token) async {
    final data = jsonEncode({'token': token});
    try {
      final response =
          await http.post(Uri.parse(Api.logout), body: data, headers: headers);

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<ApiCall> login(String email, String password) async {
    ApiCall userapi = ApiCall();
    final data = {
      'email': email,
      'password': password,
    };
    try {
      final response = await httpService.post(Api.login, data: data);
      if (response != null) {
        userapi.response = response.data["access_token"];
        if (userapi.response == null) {
          userapi.iserror = true;
          userapi.error = response.data["message"];
        }
      }
    } catch (e) {
      userapi.iserror = true;
      userapi.error = e.toString();
    }
    return userapi;
  }
}
