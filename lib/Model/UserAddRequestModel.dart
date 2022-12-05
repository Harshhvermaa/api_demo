// To parse this JSON data, do
//
//     final userAddRequestModel = userAddRequestModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserAddRequestModel userAddRequestModelFromJson(String str) => UserAddRequestModel.fromJson(json.decode(str));

String userAddRequestModelToJson(UserAddRequestModel data) => json.encode(data.toJson());

class UserAddRequestModel {
  UserAddRequestModel({
    required this.name,
    required this.job,
  });

  String name;
  String job;

  factory UserAddRequestModel.fromJson(Map<String, dynamic> json) => UserAddRequestModel(
    name: json["name"],
    job: json["job"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "job": job,
  };
}
