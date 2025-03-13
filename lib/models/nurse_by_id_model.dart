// To parse this JSON data, do
//
//     final nurseByIdModel = nurseByIdModelFromJson(jsonString);

import 'dart:convert';

NurseByIdModel nurseByIdModelFromJson(String str) => NurseByIdModel.fromJson(json.decode(str));

String nurseByIdModelToJson(NurseByIdModel data) => json.encode(data.toJson());

class NurseByIdModel {
  bool? success;
  Data? data;

  NurseByIdModel({
    this.success,
    this.data,
  });

  factory NurseByIdModel.fromJson(Map<String, dynamic> json) => NurseByIdModel(
    success: json["success"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data?.toJson(),
  };
}

class Data {
  String? location;
  List<dynamic>? clients;
  int? rating;
  List<String>? language;
  String? id;
  String? userName;
  String? email;
  String? role;
  String? phone;
  String? image;
  String? experience;
  String? idCard;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<dynamic>? reviews;

  Data({
    this.location,
    this.clients,
    this.rating,
    this.language,
    this.id,
    this.userName,
    this.email,
    this.role,
    this.phone,
    this.image,
    this.experience,
    this.idCard,
    this.createdAt,
    this.updatedAt,
    this.reviews,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    location: json["location"],
    clients: json["clients"] == null ? [] : List<dynamic>.from(json["clients"]!.map((x) => x)),
    rating: json["rating"],
    language: json["language"] == null ? [] : List<String>.from(json["language"]!.map((x) => x)),
    id: json["_id"],
    userName: json["userName"],
    email: json["email"],
    role: json["role"],
    phone: json["phone"],
    image: json["image"],
    experience: json["experience"],
    idCard: json["idCard"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    reviews: json["reviews"] == null ? [] : List<dynamic>.from(json["reviews"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "location": location,
    "clients": clients == null ? [] : List<dynamic>.from(clients!.map((x) => x)),
    "rating": rating,
    "language": language == null ? [] : List<dynamic>.from(language!.map((x) => x)),
    "_id": id,
    "userName": userName,
    "email": email,
    "role": role,
    "phone": phone,
    "image": image,
    "experience": experience,
    "idCard": idCard,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
  };
}
