// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String? token;
  User? user;

  LoginModel({
    this.token,
    this.user,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    token: json["token"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "user": user?.toJson(),
  };
}

class User {
  String? id;
  String? email;
  String? role;

  User({
    this.id,
    this.email,
    this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"],
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "role": role,
  };
}
