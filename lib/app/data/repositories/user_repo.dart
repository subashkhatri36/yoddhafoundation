import 'dart:convert';

import 'package:yoddhafoundation/app/constant/api_link.dart';
import 'package:yoddhafoundation/app/constant/controller.dart';
import 'package:yoddhafoundation/app/data/model/response_model.dart';
import 'package:http/http.dart' as http;

UserAPI userRepo = UserAPI();

///it call all user related work
class UserAPI {
  final headers = {
    "Authorization": "Bearer ${appController.accesstoken}",
    "Content-Type": "application/json",
    "Accept": "application/json",
  };
  Future<ApiCall> userDataFetch() async {
    ApiCall userapi = ApiCall();
    final data = jsonEncode({
      'token': appController.accesstoken,
    });
    try {
      final response =
          await http.post(Uri.parse(Api.user), body: data, headers: headers);

      if (response.statusCode == 200) {
        userapi.response = json.decode(response.body);
        userapi.iserror = false;
      } else {
        userapi.iserror = true;
        userapi.error = json.decode(response.body)["message"];
      }
    } catch (e) {
      userapi.iserror = true;
      userapi.error = e.toString();
    }
    return userapi;
  }
}
