import 'package:yoddhafoundation/app/constant/api_link.dart';
import 'package:yoddhafoundation/app/constant/controller.dart';
import 'package:yoddhafoundation/app/core/service/http/http_service.dart';
import 'package:yoddhafoundation/app/data/model/response_model.dart';
import 'package:yoddhafoundation/app/data/model/shaid_children.dart';
import 'package:yoddhafoundation/app/data/model/shaid_family.dart';
import 'package:yoddhafoundation/app/data/model/shaid_model.dart';

ShaidAPI userlogin = ShaidAPI();

///it call all user related work
class ShaidAPI {
  HttpService httpService = HttpServiceImpl();
  ShaidAPI() {
    httpService.init();
  }


  Future<ApiCall> shaidInfoUpload(Sahid shaid) async {
    ApiCall userapi = ApiCall();
    shaid.token=appController.accesstoken;
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
  
  Future<ApiCall> shaidFamilyUpload(ShaidFamily shaidFamily) async {
    ApiCall userapi = ApiCall();
    shaidFamily.token=appController.accesstoken;
    final data = shaidFamily.toMap();
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


//children
  
  Future<ApiCall> shaidChildrenUpload(ShaidChildren shaidChildren) async {
    ApiCall userapi = ApiCall();
    shaidChildren.token=appController.accesstoken;
    final data = shaidChildren.toMap();
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


}

/*
{
    "message": "The given data was invalid.",
    "errors": {
        "name": [
            "The name field is required."
        ],
        "gender": [
            "The gender field is required."
        ],
        "state": [
            "The state field is required."
        ],
        "district": [
            "The district field is required."
        ],
        "death_date": [
            "The death date field is required."
        ],
        "death_place": [
            "The death place field is required."
        ],
        "responsible": [
            "The responsible field is required."
        ]
    }
}
 */