// To parse this JSON data, do
//
//     final fingerPrintModel = fingerPrintModelFromJson(jsonString);

import 'dart:convert';

FingerPrintModel fingerPrintModelFromJson(String str) => FingerPrintModel.fromJson(json.decode(str));

String fingerPrintModelToJson(FingerPrintModel data) => json.encode(data.toJson());

class FingerPrintModel {
  String? message;
  String? fingerprint;

  FingerPrintModel({
    this.message,
    this.fingerprint,
  });

  factory FingerPrintModel.fromJson(Map<String, dynamic> json) => FingerPrintModel(
    message: json["message"],
    fingerprint: json["fingerprint"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "fingerprint": fingerprint,
  };
}
