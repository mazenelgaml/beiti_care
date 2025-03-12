// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  bool? success;
  String? message;
  Data? data;
  String? token;

  SignUpModel({
    this.success,
    this.message,
    this.data,
    this.token,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
    "token": token,
  };
}

class Data {
  String? userName;
  String? email;
  String? password;
  String? role;
  String? phone;
  String? image;
  String? experience;
  String? specialty;
  String? location;
  String? idCard;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Data({
    this.userName,
    this.email,
    this.password,
    this.role,
    this.phone,
    this.image,
    this.experience,
    this.specialty,
    this.location,
    this.idCard,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userName: json["userName"],
    email: json["email"],
    password: json["password"],
    role: json["role"],
    phone: json["phone"],
    image: json["image"],
    experience: json["experience"],
    specialty: json["specialty"],
    location: json["location"],
    idCard: json["idCard"],
    id: json["_id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "userName": userName,
    "email": email,
    "password": password,
    "role": role,
    "phone": phone,
    "image": image,
    "experience": experience,
    "specialty": specialty,
    "location": location,
    "idCard": idCard,
    "_id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
