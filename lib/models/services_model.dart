// To parse this JSON data, do
//
//     final servicesModel = servicesModelFromJson(jsonString);

import 'dart:convert';

ServicesModel servicesModelFromJson(String str) => ServicesModel.fromJson(json.decode(str));

String servicesModelToJson(ServicesModel data) => json.encode(data.toJson());

class ServicesModel {
  bool? status;
  List<Service>? services;

  ServicesModel({
    this.status,
    this.services,
  });

  factory ServicesModel.fromJson(Map<String, dynamic> json) => ServicesModel(
    status: json["status"],
    services: json["services"] == null ? [] : List<Service>.from(json["services"]!.map((x) => Service.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "services": services == null ? [] : List<dynamic>.from(services!.map((x) => x.toJson())),
  };
}

class Service {
  String? id;
  String? name;
  String? description;
  int? price;
  String? duration;
  List<dynamic>? subcategories;
  DateTime? createdAt;
  DateTime? updatedAt;

  Service({
    this.id,
    this.name,
    this.description,
    this.price,
    this.duration,
    this.subcategories,
    this.createdAt,
    this.updatedAt,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    id: json["_id"],
    name: json["name"],
    description: json["description"],
    price: json["price"],
    duration: json["duration"],
    subcategories: json["subcategories"] == null ? [] : List<dynamic>.from(json["subcategories"]!.map((x) => x)),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
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
  };
}
