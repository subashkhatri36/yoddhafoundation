import 'dart:convert';
import 'dart:io';
import 'package:yoddhafoundation/app/constant/api_link.dart';
import 'package:yoddhafoundation/app/constant/controller.dart';
import 'package:yoddhafoundation/app/data/model/response_model.dart';
import 'package:yoddhafoundation/app/data/model/shaid_children.dart';
import 'package:yoddhafoundation/app/data/model/shaid_family.dart';
import 'package:yoddhafoundation/app/data/model/shaid_model.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:intl/intl.dart';

ShaidAPI shaidUpload = ShaidAPI();

///it call all user related work
class ShaidAPI {
  Future<ApiCall> shaidInfoUpload(Sahid shaid) async {
    ApiCall userapi = ApiCall();
    shaid.token = appController.accesstoken;

    try {
      var uri = Uri.parse(Api.shaidInsert);
      final headers = {
        "Authorization": "Bearer ${appController.accesstoken}",
        "Content-Type": "multipart/form-data",
        "Connection": "Keep-Alive",
        "Accept": "application/json",
      };
      var request = http.MultipartRequest("POST", uri);
      request.files.add(http.MultipartFile(
          'image',
          File(shaid.image).readAsBytes().asStream(),
          File(shaid.image).lengthSync(),
          contentType: MediaType('image', 'jpeg'),
          filename: shaid.image.split("/").last));
      request.headers.addAll(headers);
      Map<String, String> data = {
        "token": appController.accesstoken,
        "name": shaid.name,
        "gender": shaid.gender,
        "state": shaid.state,
        "district": shaid.district,
        "death_date": (DateFormat().add_yMd().parse(shaid.deathdate))
            .millisecondsSinceEpoch
            .toString(),
        "death_place": shaid.deathplace,
        "responsible": shaid.responsible
      };

      request.fields.addAll(data);

      http.Response result =
          await http.Response.fromStream(await request.send());

      // userapi.response = result.body;
      //   return userapi;
      if (result.statusCode == 200) {
        var shaidData = await json.decode(result.body);
        userapi.iserror = false;
        userapi.response = int.parse(shaidData["sahid"]["id"].toString());
      } else {
        userapi.iserror = true;
        userapi.error = json.decode(result.body)["message"];
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
    try {
      final headers = {
        "Authorization": "Bearer ${appController.accesstoken}",
        "Content-Type": "application/json",
        "Accept": "application/json",
      };

      shaidFamily.token = appController.accesstoken;
      final data = jsonEncode({
        "token": shaidFamily.token,
        "name": shaidFamily.name,
        "relation": shaidFamily.relation,
        "age": shaidFamily.age
      });

      Api api = Api();
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
      "dob": (DateFormat().add_yMd().parse(shaidChildren.dob))
          .millisecondsSinceEpoch,
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
