// To parse this JSON data, do
//
//     final errorAuthModel = errorAuthModelFromJson(jsonString);

import 'dart:convert';

ErrorAuthModel errorAuthModelFromJson(String str) => ErrorAuthModel.fromJson(json.decode(str));

String errorAuthModelToJson(ErrorAuthModel data) => json.encode(data.toJson());

class ErrorAuthModel {
  List<Error>? errors;

  ErrorAuthModel({
    this.errors,
  });

  factory ErrorAuthModel.fromJson(Map<String, dynamic> json) => ErrorAuthModel(
    errors: json["errors"] == null ? [] : List<Error>.from(json["errors"]!.map((x) => Error.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "errors": errors == null ? [] : List<dynamic>.from(errors!.map((x) => x.toJson())),
  };
}

class Error {
  String? type;
  String? value;
  String? msg;
  String? path;
  String? location;

  Error({
    this.type,
    this.value,
    this.msg,
    this.path,
    this.location,
  });

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    type: json["type"],
    value: json["value"],
    msg: json["msg"],
    path: json["path"],
    location: json["location"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "value": value,
    "msg": msg,
    "path": path,
    "location": location,
  };
}
