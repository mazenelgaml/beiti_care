// To parse this JSON data, do
//
//     final updateNurseModel = updateNurseModelFromJson(jsonString);

import 'dart:convert';

UpdateNurseModel updateNurseModelFromJson(String str) => UpdateNurseModel.fromJson(json.decode(str));

String updateNurseModelToJson(UpdateNurseModel data) => json.encode(data.toJson());

class UpdateNurseModel {
  bool? success;
  String? message;
  Data? data;

  UpdateNurseModel({
    this.success,
    this.message,
    this.data,
  });

  factory UpdateNurseModel.fromJson(Map<String, dynamic> json) => UpdateNurseModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  List<dynamic>? clients;
  int? rating;
  List<String>? language;
  String? id;
  String? userName;
  String? email;
  String? password;
  String? role;
  String? phone;
  String? image;
  String? experience;
  String? location;
  String? idCard;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  List<dynamic>? reviews;

  Data({
    this.clients,
    this.rating,
    this.language,
    this.id,
    this.userName,
    this.email,
    this.password,
    this.role,
    this.phone,
    this.image,
    this.experience,
    this.location,
    this.idCard,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.reviews,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    clients: json["clients"] == null ? [] : List<dynamic>.from(json["clients"]!.map((x) => x)),
    rating: json["rating"],
    language: json["language"] == null ? [] : List<String>.from(json["language"]!.map((x) => x)),
    id: json["_id"],
    userName: json["userName"],
    email: json["email"],
    password: json["password"],
    role: json["role"],
    phone: json["phone"],
    image: json["image"],
    experience: json["experience"],
    location: json["location"],
    idCard: json["idCard"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    reviews: json["reviews"] == null ? [] : List<dynamic>.from(json["reviews"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "clients": clients == null ? [] : List<dynamic>.from(clients!.map((x) => x)),
    "rating": rating,
    "language": language == null ? [] : List<dynamic>.from(language!.map((x) => x)),
    "_id": id,
    "userName": userName,
    "email": email,
    "password": password,
    "role": role,
    "phone": phone,
    "image": image,
    "experience": experience,
    "location": location,
    "idCard": idCard,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
  };
}
