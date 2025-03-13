// To parse this JSON data, do
//
//     final confirmSessionsModel = confirmSessionsModelFromJson(jsonString);

import 'dart:convert';

ConfirmSessionsModel confirmSessionsModelFromJson(String str) => ConfirmSessionsModel.fromJson(json.decode(str));

String confirmSessionsModelToJson(ConfirmSessionsModel data) => json.encode(data.toJson());

class ConfirmSessionsModel {
  bool? success;
  String? message;
  Session? session;

  ConfirmSessionsModel({
    this.success,
    this.message,
    this.session,
  });

  factory ConfirmSessionsModel.fromJson(Map<String, dynamic> json) => ConfirmSessionsModel(
    success: json["success"],
    message: json["message"],
    session: json["session"] == null ? null : Session.fromJson(json["session"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "session": session?.toJson(),
  };
}

class Session {
  String? id;
  String? service;
  String? nurse;
  String? client;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? code;
  String? videoOrPhotos;
  String? nurseName;
  DateTime? date;
  String? location;
  String? tubeImage;

  Session({
    this.id,
    this.service,
    this.nurse,
    this.client,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.code,
    this.videoOrPhotos,
    this.nurseName,
    this.date,
    this.location,
    this.tubeImage,
  });

  factory Session.fromJson(Map<String, dynamic> json) => Session(
    id: json["_id"],
    service: json["service"],
    nurse: json["nurse"],
    client: json["client"],
    status: json["status"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    code: json["code"],
    videoOrPhotos: json["videoOrPhotos"],
    nurseName: json["nurseName"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    location: json["location"],
    tubeImage: json["tubeImage"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "service": service,
    "nurse": nurse,
    "client": client,
    "status": status,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "code": code,
    "videoOrPhotos": videoOrPhotos,
    "nurseName": nurseName,
    "date": date?.toIso8601String(),
    "location": location,
    "tubeImage": tubeImage,
  };
}
