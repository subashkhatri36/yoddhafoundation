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
    final data = {
      "token": shaid.token,
      "image": shaid.image,
      "name": shaid.name,
      "gender": shaid.gender,
      "state": shaid.state,
      "district": shaid.district,
      "death_date": shaid.deathdate,
      "death_place": shaid.deathplace,
      "responsible": shaid.responsible
    };
    print(data);

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
    final data = {
      "token": shaidFamily.token,
      "name": shaidFamily.name,
      "relation": shaidFamily.relation,
      "age": shaidFamily.age
    };

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
    final data = {
      "token": shaidChildren.token,
      "name": shaidChildren.name,
      "relation": shaidChildren.relation,
      "dob": shaidChildren.dob
    };

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
