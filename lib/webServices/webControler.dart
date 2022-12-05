// get version
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../Model/UserAddRequestModel.dart';
import '../Model/UserAddResponseModel.dart';
import '../Model/UserModel.dart';


class WebControler{

  Future<UserModel?> getuser(BuildContext context) async {
    var uri = Uri.parse("https://reqres.in/api/users?page=2");
    var headers = {
      "Content-type": "application/json",
      // 'Authorization': 'Bearer ${Token}',
    };
    var response = await http.get(uri, headers: headers
    ).timeout(
      const Duration(seconds: 25),
      onTimeout: () {
        return http.Response('Error', 408);

      },);
    if (response.statusCode == 200) {
      return userModelFromJson(response.body);
    } else {
      return null;
    }
  }


  Future<UserAddResponseModel?> adduser(BuildContext context,UserAddRequestModel data) async {
    var uri = Uri.parse("https://reqres.in/api/users");
    var headers = {
      "Content-type": "application/json",
      // 'Authorization': 'Bearer ${Token}',
    };
    var response = await http.post(uri, headers: headers,
      body: jsonEncode(data)
    ).timeout(
      const Duration(seconds: 25),
      onTimeout: () {
        return http.Response('Error', 408);

      },);
    if (response.statusCode == 201) {
      return userAddResponseModelFromJson(response.body);
    } else {
      return null;
    }
  }


}