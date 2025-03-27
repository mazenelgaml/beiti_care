// To parse this JSON data, do
//
//     final signUpUserModel = signUpUserModelFromJson(jsonString);

import 'dart:convert';

SignUpUserModel signUpUserModelFromJson(String str) => SignUpUserModel.fromJson(json.decode(str));

String signUpUserModelToJson(SignUpUserModel data) => json.encode(data.toJson());

class SignUpUserModel {
  String? message;
  NewUser? newUser;
  String? token;

  SignUpUserModel({
    this.message,
    this.newUser,
    this.token,
  });

  factory SignUpUserModel.fromJson(Map<String, dynamic> json) => SignUpUserModel(
    message: json["message"],
    newUser: json["newUser"] == null ? null : NewUser.fromJson(json["newUser"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "newUser": newUser?.toJson(),
    "token": token,
  };
}

class NewUser {
  String? userName;
  String? email;
  String? password;
  String? role;
  int? phone;
  MedicalHistory? medicalHistory;
  PreviousMedications? previousMedications;
  String? id;
  List<dynamic>? comments;
  List<dynamic>? medicalFiles;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  NewUser({
    this.userName,
    this.email,
    this.password,
    this.role,
    this.phone,
    this.medicalHistory,
    this.previousMedications,
    this.id,
    this.comments,
    this.medicalFiles,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory NewUser.fromJson(Map<String, dynamic> json) => NewUser(
    userName: json["userName"],
    email: json["email"],
    password: json["password"],
    role: json["role"],
    phone: json["phone"],
    medicalHistory: json["medicalHistory"] == null ? null : MedicalHistory.fromJson(json["medicalHistory"]),
    previousMedications: json["previousMedications"] == null ? null : PreviousMedications.fromJson(json["previousMedications"]),
    id: json["_id"],
    comments: json["comments"] == null ? [] : List<dynamic>.from(json["comments"]!.map((x) => x)),
    medicalFiles: json["medicalFiles"] == null ? [] : List<dynamic>.from(json["medicalFiles"]!.map((x) => x)),
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
    "medicalHistory": medicalHistory?.toJson(),
    "previousMedications": previousMedications?.toJson(),
    "_id": id,
    "comments": comments == null ? [] : List<dynamic>.from(comments!.map((x) => x)),
    "medicalFiles": medicalFiles == null ? [] : List<dynamic>.from(medicalFiles!.map((x) => x)),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class MedicalHistory {
  List<dynamic>? laboratoryTests;
  List<dynamic>? vaccinations;

  MedicalHistory({
    this.laboratoryTests,
    this.vaccinations,
  });

  factory MedicalHistory.fromJson(Map<String, dynamic> json) => MedicalHistory(
    laboratoryTests: json["laboratoryTests"] == null ? [] : List<dynamic>.from(json["laboratoryTests"]!.map((x) => x)),
    vaccinations: json["vaccinations"] == null ? [] : List<dynamic>.from(json["vaccinations"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "laboratoryTests": laboratoryTests == null ? [] : List<dynamic>.from(laboratoryTests!.map((x) => x)),
    "vaccinations": vaccinations == null ? [] : List<dynamic>.from(vaccinations!.map((x) => x)),
  };
}

class PreviousMedications {
  List<dynamic>? previousTestComparisons;
  List<dynamic>? pastMedications;

  PreviousMedications({
    this.previousTestComparisons,
    this.pastMedications,
  });

  factory PreviousMedications.fromJson(Map<String, dynamic> json) => PreviousMedications(
    previousTestComparisons: json["previousTestComparisons"] == null ? [] : List<dynamic>.from(json["previousTestComparisons"]!.map((x) => x)),
    pastMedications: json["pastMedications"] == null ? [] : List<dynamic>.from(json["pastMedications"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "previousTestComparisons": previousTestComparisons == null ? [] : List<dynamic>.from(previousTestComparisons!.map((x) => x)),
    "pastMedications": pastMedications == null ? [] : List<dynamic>.from(pastMedications!.map((x) => x)),
  };
}
