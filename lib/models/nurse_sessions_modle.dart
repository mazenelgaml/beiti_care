// To parse this JSON data, do
//
//     final nurseSessionsModel = nurseSessionsModelFromJson(jsonString);

import 'dart:convert';

NurseSessionsModel nurseSessionsModelFromJson(String str) => NurseSessionsModel.fromJson(json.decode(str));

String nurseSessionsModelToJson(NurseSessionsModel data) => json.encode(data.toJson());

class NurseSessionsModel {
  bool? success;
  List<Session>? sessions;

  NurseSessionsModel({
    this.success,
    this.sessions,
  });

  factory NurseSessionsModel.fromJson(Map<String, dynamic> json) => NurseSessionsModel(
    success: json["success"],
    sessions: json["sessions"] == null ? [] : List<Session>.from(json["sessions"]!.map((x) => Session.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "sessions": sessions == null ? [] : List<dynamic>.from(sessions!.map((x) => x.toJson())),
  };
}

class Session {
  String? id;
  String? service;
  Nurse? nurse;
  Client? client;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Session({
    this.id,
    this.service,
    this.nurse,
    this.client,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Session.fromJson(Map<String, dynamic> json) => Session(
    id: json["_id"],
    service: json["service"],
    nurse: json["nurse"] == null ? null : Nurse.fromJson(json["nurse"]),
    client: json["client"] == null ? null : Client.fromJson(json["client"]),
    status: json["status"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "service": service,
    "nurse": nurse?.toJson(),
    "client": client?.toJson(),
    "status": status,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class Client {
  MedicalHistory? medicalHistory;
  PreviousMedications? previousMedications;
  String? id;
  String? userName;
  String? email;
  String? password;
  String? gender;
  int? age;
  int? years;
  int? phone;
  int? v;
  DateTime? updatedAt;
  List<dynamic>? comments;
  List<dynamic>? medicalFiles;

  Client({
    this.medicalHistory,
    this.previousMedications,
    this.id,
    this.userName,
    this.email,
    this.password,
    this.gender,
    this.age,
    this.years,
    this.phone,
    this.v,
    this.updatedAt,
    this.comments,
    this.medicalFiles,
  });

  factory Client.fromJson(Map<String, dynamic> json) => Client(
    medicalHistory: json["medicalHistory"] == null ? null : MedicalHistory.fromJson(json["medicalHistory"]),
    previousMedications: json["previousMedications"] == null ? null : PreviousMedications.fromJson(json["previousMedications"]),
    id: json["_id"],
    userName: json["userName"],
    email: json["email"],
    password: json["password"],
    gender: json["gender"],
    age: json["age"],
    years: json["years"],
    phone: json["phone"],
    v: json["__v"],
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    comments: json["comments"] == null ? [] : List<dynamic>.from(json["comments"]!.map((x) => x)),
    medicalFiles: json["medicalFiles"] == null ? [] : List<dynamic>.from(json["medicalFiles"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "medicalHistory": medicalHistory?.toJson(),
    "previousMedications": previousMedications?.toJson(),
    "_id": id,
    "userName": userName,
    "email": email,
    "password": password,
    "gender": gender,
    "age": age,
    "years": years,
    "phone": phone,
    "__v": v,
    "updatedAt": updatedAt?.toIso8601String(),
    "comments": comments == null ? [] : List<dynamic>.from(comments!.map((x) => x)),
    "medicalFiles": medicalFiles == null ? [] : List<dynamic>.from(medicalFiles!.map((x) => x)),
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

class Nurse {
  String? location;
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
  String? idCard;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  List<dynamic>? reviews;

  Nurse({
    this.location,
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
    this.idCard,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.reviews,
  });

  factory Nurse.fromJson(Map<String, dynamic> json) => Nurse(
    location: json["location"],
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
    idCard: json["idCard"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
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
    "password": password,
    "role": role,
    "phone": phone,
    "image": image,
    "experience": experience,
    "idCard": idCard,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
  };
}
