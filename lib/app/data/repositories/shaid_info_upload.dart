import 'package:yoddhafoundation/app/constant/api_link.dart';
import 'package:yoddhafoundation/app/constant/controller.dart';
import 'package:yoddhafoundation/app/core/service/http/http_service.dart';
import 'package:yoddhafoundation/app/data/model/response_model.dart';
import 'package:yoddhafoundation/app/data/model/shaid_children.dart';
import 'package:yoddhafoundation/app/data/model/shaid_family.dart';
import 'package:yoddhafoundation/app/data/model/shaid_model.dart';

ShaidAPI shaidUpload = ShaidAPI();

///it call all user related work
class ShaidAPI {
  HttpService httpService = HttpServiceImpl();
  ShaidAPI() {
    httpService.init();
  }

  Future<ApiCall> shaidInfoUpload(Sahid shaid) async {
    ApiCall userapi = ApiCall();
    shaid.token = appController.accesstoken;
    final data = shaid.toMap();
    try {
      final response = await httpService.post(Api.shaidInsert, data: data);
      if (response != null) {
        userapi.response = response.data;
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

  //family

  Future<ApiCall> shaidFamilyUpload(ShaidFamily shaidFamily, int id) async {
    ApiCall userapi = ApiCall();
    shaidFamily.token = appController.accesstoken;
    final data = shaidFamily.toMap();
    Api api = Api();
    try {
      api.insertfamily += id.toString() + "/family/store";
      final response = await httpService.post(api.insertfamily, data: data);
      if (response != null) {
        userapi.response = response.data;
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

//children

  Future<ApiCall> shaidChildrenUpload(
      ShaidChildren shaidChildren, int id) async {
    ApiCall userapi = ApiCall();
    shaidChildren.token = appController.accesstoken;
    final data = shaidChildren.toMap();
    Api api = Api();
    try {
      api.insertchildren += id.toString() + "/children/store";
      final response = await httpService.post(api.insertchildren, data: data);
      if (response != null) {
        userapi.response = response.data;
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
