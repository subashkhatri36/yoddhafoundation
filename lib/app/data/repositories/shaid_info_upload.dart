import 'dart:convert';

import 'package:yoddhafoundation/app/constant/api_link.dart';
import 'package:yoddhafoundation/app/constant/controller.dart';
import 'package:yoddhafoundation/app/core/service/http/http_service.dart';
import 'package:yoddhafoundation/app/data/model/response_model.dart';
import 'package:yoddhafoundation/app/data/model/shaid_children.dart';
import 'package:yoddhafoundation/app/data/model/shaid_family.dart';
import 'package:yoddhafoundation/app/data/model/shaid_model.dart';
import 'package:http/http.dart' as http;

ShaidAPI shaidUpload = ShaidAPI();

///it call all user related work
class ShaidAPI {
  HttpService httpService = HttpServiceImpl();
  ShaidAPI() {
    httpService.init();
  }

  Future<ApiCall> shaidInfoUpload(Sahid shaid) async {
    final headers = {
      "Authorization": "Bearer ${appController.accesstoken}",
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
    print("Token " + appController.accesstoken);
    ApiCall userapi = ApiCall();
    // shaid.token = appController.accesstoken;
    final data = jsonEncode({
      "token": appController.accesstoken,
      "image": shaid.image,
      "name": shaid.name,
      "gender": shaid.gender,
      "state": shaid.state,
      "district": shaid.district,
      "death_date": shaid.deathdate.millisecondsSinceEpoch,
      "death_place": shaid.deathplace,
      "responsible": shaid.responsible
    });

    try {
      print("requested datra" + data);
      print("headers " + headers.toString());
      final response = await http.post(
        Uri.parse(Api.shaidInsert),
        headers: headers,
        body: data,
      ); // httpService.post(Api.shaidInsert, data: data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        var shaidData = await json.decode(response.body);
        userapi.iserror = false;
        userapi.response = int.parse(shaidData["sahid"]["id"].toString());
        print("shaidpassed");
      } else {
        userapi.iserror = true;
        userapi.error = json.decode(response.body)["message"];
        print("Here " + userapi.error);
      }
    } catch (e) {
      userapi.iserror = true;
      userapi.error = e.toString();
      print(e);
    }
    return userapi;
  }

  //family

  Future<ApiCall> shaidFamilyUpload(ShaidFamily shaidFamily, int id) async {
    final headers = {
      "Authorization": "Bearer ${appController.accesstoken}",
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
    ApiCall userapi = ApiCall();
    shaidFamily.token = appController.accesstoken;
    final data = jsonEncode({
      "token": shaidFamily.token,
      "name": shaidFamily.name,
      "relation": shaidFamily.relation,
      "age": shaidFamily.age
    });

    Api api = Api();

    try {
      api.insertfamily += id.toString() + "/family/store";
      final response = await http.post(
        Uri.parse(api.insertfamily),
        headers: headers,
        body: data,
      ); // httpService.post(Api.shaidInsert, data: data);

      if (response.statusCode == 200) {
        var family = await json.decode(response.body);
        userapi.iserror = false;
        userapi.response = family;
        print("familypasseed");
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

//children

  Future<ApiCall> shaidChildrenUpload(
      ShaidChildren shaidChildren, int id) async {
    final headers = {
      "Authorization": "Bearer ${appController.accesstoken}",
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
    ApiCall userapi = ApiCall();
    shaidChildren.token = appController.accesstoken;
    final data = jsonEncode({
      "token": shaidChildren.token,
      "name": shaidChildren.name,
      "relation": shaidChildren.relation,
      "dob": shaidChildren.dob.millisecondsSinceEpoch,
    });

    Api api = Api();

    try {
      api.insertchildren += id.toString() + "/children/store";
      final response = await http.post(
        Uri.parse(api.insertchildren),
        headers: headers,
        body: data,
      ); // httpService.post(Api.shaidInsert, data: data);

      if (response.statusCode == 200) {
        var children = await json.decode(response.body);
        userapi.iserror = false;
        userapi.response = children;
        print("children passed");
      } else {
        userapi.iserror = true;
        userapi.error = json.decode(response.body)["message"];
        print("error" + json.decode(response.body)["message"]);
      }
    } catch (e) {
      userapi.iserror = true;
      userapi.error = e.toString();
      print(e);
    }
    return userapi;
  }
}
