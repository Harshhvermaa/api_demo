// To parse this JSON data, do
//
//     final userAddResponseModel = userAddResponseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserAddResponseModel userAddResponseModelFromJson(String str) => UserAddResponseModel.fromJson(json.decode(str));

String userAddResponseModelToJson(UserAddResponseModel data) => json.encode(data.toJson());

class UserAddResponseModel {
  UserAddResponseModel({
    required this.name,
    required this.job,
    required this.id,
    required this.createdAt,
  });

  String name;
  String job;
  String id;
  DateTime createdAt;

  factory UserAddResponseModel.fromJson(Map<String, dynamic> json) => UserAddResponseModel(
    name: json["name"],
    job: json["job"],
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "job": job,
    "id": id,
    "createdAt": createdAt.toIso8601String(),
  };
}
