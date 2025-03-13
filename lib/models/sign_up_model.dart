// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  bool? success;
  String? message;
  NewNurse? newNurse;
  String? token;

  SignUpModel({
    this.success,
    this.message,
    this.newNurse,
    this.token,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
    success: json["success"],
    message: json["message"],
    newNurse: json["newNurse"] == null ? null : NewNurse.fromJson(json["newNurse"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "newNurse": newNurse?.toJson(),
    "token": token,
  };
}

class NewNurse {
  String? userName;
  String? email;
  String? password;
  String? role;
  String? phone;
  String? image;
  String? experience;
  List<String>? specialty;
  String? location;
  String? idCard;
  List<dynamic>? clients;
  int? rating;
  List<String>? language;
  String? id;
  List<dynamic>? reviews;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  NewNurse({
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
    this.clients,
    this.rating,
    this.language,
    this.id,
    this.reviews,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory NewNurse.fromJson(Map<String, dynamic> json) => NewNurse(
    userName: json["userName"],
    email: json["email"],
    password: json["password"],
    role: json["role"],
    phone: json["phone"],
    image: json["image"],
    experience: json["experience"],
    specialty: json["specialty"] == null ? [] : List<String>.from(json["specialty"]!.map((x) => x)),
    location: json["location"],
    idCard: json["idCard"],
    clients: json["clients"] == null ? [] : List<dynamic>.from(json["clients"]!.map((x) => x)),
    rating: json["rating"],
    language: json["language"] == null ? [] : List<String>.from(json["language"]!.map((x) => x)),
    id: json["_id"],
    reviews: json["reviews"] == null ? [] : List<dynamic>.from(json["reviews"]!.map((x) => x)),
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
    "specialty": specialty == null ? [] : List<dynamic>.from(specialty!.map((x) => x)),
    "location": location,
    "idCard": idCard,
    "clients": clients == null ? [] : List<dynamic>.from(clients!.map((x) => x)),
    "rating": rating,
    "language": language == null ? [] : List<dynamic>.from(language!.map((x) => x)),
    "_id": id,
    "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
