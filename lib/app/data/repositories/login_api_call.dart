import 'package:yoddhafoundation/app/constant/api_link.dart';
import 'package:yoddhafoundation/app/constant/string.dart';
import 'package:yoddhafoundation/app/core/service/http/http_service.dart';
import 'package:yoddhafoundation/app/core/service/storage_service/shared_preference.dart';
import 'package:yoddhafoundation/app/data/model/response_model.dart';

LoginAPI userlogin = LoginAPI();

class LoginAPI {
  HttpService httpService = HttpServiceImpl();
  LoginAPI() {
    httpService.init();
  }

  Future<ApiCall> login(String email, String password) async {
    ApiCall userapi = ApiCall();
    final data = {
      'email': email,
      'password': password,
    };
    try {
      final response = await httpService.post(Api.login, data: data);
      userapi.response = response!.data["access_token"];
      print(userapi.response);
    } catch (e) {
      userapi.iserror = true;
      userapi.error = e.toString();
    }
    return userapi;
  }
}
