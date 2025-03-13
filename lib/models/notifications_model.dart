// To parse this JSON data, do
//
//     final notificationsModel = notificationsModelFromJson(jsonString);

import 'dart:convert';

NotificationsModel notificationsModelFromJson(String str) => NotificationsModel.fromJson(json.decode(str));

String notificationsModelToJson(NotificationsModel data) => json.encode(data.toJson());

class NotificationsModel {
  bool? success;
  List<Notification>? notifications;

  NotificationsModel({
    this.success,
    this.notifications,
  });

  factory NotificationsModel.fromJson(Map<String, dynamic> json) => NotificationsModel(
    success: json["success"],
    notifications: json["notifications"] == null ? [] : List<Notification>.from(json["notifications"]!.map((x) => Notification.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "notifications": notifications == null ? [] : List<dynamic>.from(notifications!.map((x) => x.toJson())),
  };
}

class Notification {
  String? id;
  String? userId;
  String? message;
  bool? isRead;
  DateTime? createdAt;
  int? v;

  Notification({
    this.id,
    this.userId,
    this.message,
    this.isRead,
    this.createdAt,
    this.v,
  });

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
    id: json["_id"],
    userId: json["userId"],
    message: json["message"],
    isRead: json["isRead"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userId": userId,
    "message": message,
    "isRead": isRead,
    "createdAt": createdAt?.toIso8601String(),
    "__v": v,
  };
}
