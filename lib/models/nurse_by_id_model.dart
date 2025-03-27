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
  String? id;
  String? userName;
  String? email;
  String? role;
  String? phone;
  String? image;
  String? cv;
  String? experience;
  List<Specialty>? specialty;
  String? location;
  String? idCard;
  List<dynamic>? clients;
  int? rating;
  List<String>? language;
  int? completedSessions;
  List<dynamic>? reviews;
  DateTime? createdAt;
  DateTime? updatedAt;

  Data({
    this.id,
    this.userName,
    this.email,
    this.role,
    this.phone,
    this.image,
    this.cv,
    this.experience,
    this.specialty,
    this.location,
    this.idCard,
    this.clients,
    this.rating,
    this.language,
    this.completedSessions,
    this.reviews,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    userName: json["userName"],
    email: json["email"],
    role: json["role"],
    phone: json["phone"],
    image: json["image"],
    cv: json["cv"],
    experience: json["experience"],
    specialty: json["specialty"] == null ? [] : List<Specialty>.from(json["specialty"]!.map((x) => Specialty.fromJson(x))),
    location: json["location"],
    idCard: json["idCard"],
    clients: json["clients"] == null ? [] : List<dynamic>.from(json["clients"]!.map((x) => x)),
    rating: json["rating"],
    language: json["language"] == null ? [] : List<String>.from(json["language"]!.map((x) => x)),
    completedSessions: json["completedSessions"],
    reviews: json["reviews"] == null ? [] : List<dynamic>.from(json["reviews"]!.map((x) => x)),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userName": userName,
    "email": email,
    "role": role,
    "phone": phone,
    "image": image,
    "cv": cv,
    "experience": experience,
    "specialty": specialty == null ? [] : List<dynamic>.from(specialty!.map((x) => x.toJson())),
    "location": location,
    "idCard": idCard,
    "clients": clients == null ? [] : List<dynamic>.from(clients!.map((x) => x)),
    "rating": rating,
    "language": language == null ? [] : List<dynamic>.from(language!.map((x) => x)),
    "completedSessions": completedSessions,
    "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

class Specialty {
  String? id;
  String? name;
  String? description;
  int? price;
  String? duration;
  List<dynamic>? subcategories;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Specialty({
    this.id,
    this.name,
    this.description,
    this.price,
    this.duration,
    this.subcategories,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Specialty.fromJson(Map<String, dynamic> json) => Specialty(
    id: json["_id"],
    name: json["name"],
    description: json["description"],
    price: json["price"],
    duration: json["duration"],
    subcategories: json["subcategories"] == null ? [] : List<dynamic>.from(json["subcategories"]!.map((x) => x)),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "description": description,
    "price": price,
    "duration": duration,
    "subcategories": subcategories == null ? [] : List<dynamic>.from(subcategories!.map((x) => x)),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
