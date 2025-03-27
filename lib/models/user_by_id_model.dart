// To parse this JSON data, do
//
//     final userByIdModel = userByIdModelFromJson(jsonString);

import 'dart:convert';

UserByIdModel userByIdModelFromJson(String str) => UserByIdModel.fromJson(json.decode(str));

String userByIdModelToJson(UserByIdModel data) => json.encode(data.toJson());

class UserByIdModel {
  String? message;
  User? user;

  UserByIdModel({
    this.message,
    this.user,
  });

  factory UserByIdModel.fromJson(Map<String, dynamic> json) => UserByIdModel(
    message: json["message"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "user": user?.toJson(),
  };
}

class User {
  GeneralHealthStatus? generalHealthStatus;
  StateOfEmergency? stateOfEmergency;
  MedicalHistory? medicalHistory;
  PreviousMedications? previousMedications;
  String? id;
  String? userName;
  String? email;
  String? password;
  String? role;
  int? phone;
  int? age;
  String? gender;
  List<Comment>? comments;
  List<MedicalFile>? medicalFiles;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? image;
  String? bloodType;
  String? familyHealthHistory;
  String? healthNumber;
  String? idCard;
  String? address;

  User({
    this.generalHealthStatus,
    this.stateOfEmergency,
    this.medicalHistory,
    this.previousMedications,
    this.id,
    this.userName,
    this.email,
    this.password,
    this.role,
    this.phone,
    this.age,
    this.gender,
    this.comments,
    this.medicalFiles,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.image,
    this.bloodType,
    this.familyHealthHistory,
    this.healthNumber,
    this.idCard,
    this.address,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    generalHealthStatus: json["generalHealthStatus"] == null ? null : GeneralHealthStatus.fromJson(json["generalHealthStatus"]),
    stateOfEmergency: json["stateOfEmergency"] == null ? null : StateOfEmergency.fromJson(json["stateOfEmergency"]),
    medicalHistory: json["medicalHistory"] == null ? null : MedicalHistory.fromJson(json["medicalHistory"]),
    previousMedications: json["previousMedications"] == null ? null : PreviousMedications.fromJson(json["previousMedications"]),
    id: json["_id"],
    userName: json["userName"],
    email: json["email"],
    password: json["password"],
    role: json["role"],
    phone: json["phone"],
    age: json["age"],
    gender: json["gender"],
    comments: json["comments"] == null ? [] : List<Comment>.from(json["comments"]!.map((x) => Comment.fromJson(x))),
    medicalFiles: json["medicalFiles"] == null ? [] : List<MedicalFile>.from(json["medicalFiles"]!.map((x) => MedicalFile.fromJson(x))),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    image: json["image"],
    bloodType: json["bloodType"],
    familyHealthHistory: json["familyHealthHistory"],
    healthNumber: json["healthNumber"],
    idCard: json["idCard"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "generalHealthStatus": generalHealthStatus?.toJson(),
    "stateOfEmergency": stateOfEmergency?.toJson(),
    "medicalHistory": medicalHistory?.toJson(),
    "previousMedications": previousMedications?.toJson(),
    "_id": id,
    "userName": userName,
    "email": email,
    "password": password,
    "role": role,
    "phone": phone,
    "age": age,
    "gender": gender,
    "comments": comments == null ? [] : List<dynamic>.from(comments!.map((x) => x.toJson())),
    "medicalFiles": medicalFiles == null ? [] : List<dynamic>.from(medicalFiles!.map((x) => x.toJson())),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "image": image,
    "bloodType": bloodType,
    "familyHealthHistory": familyHealthHistory,
    "healthNumber": healthNumber,
    "idCard": idCard,
    "address": address,
  };
}

class Comment {
  String? text;
  DateTime? date;
  String? id;

  Comment({
    this.text,
    this.date,
    this.id,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    text: json["text"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "date": date?.toIso8601String(),
    "_id": id,
  };
}

class GeneralHealthStatus {
  String? chronicDiseases;
  String? currentMedications;
  DateTime? lastExaminationDate;
  String? allergies;

  GeneralHealthStatus({
    this.chronicDiseases,
    this.currentMedications,
    this.lastExaminationDate,
    this.allergies,
  });

  factory GeneralHealthStatus.fromJson(Map<String, dynamic> json) => GeneralHealthStatus(
    chronicDiseases: json["chronicDiseases"],
    currentMedications: json["currentMedications"],
    lastExaminationDate: json["lastExaminationDate"] == null ? null : DateTime.parse(json["lastExaminationDate"]),
    allergies: json["allergies"],
  );

  Map<String, dynamic> toJson() => {
    "chronicDiseases": chronicDiseases,
    "currentMedications": currentMedications,
    "lastExaminationDate": lastExaminationDate?.toIso8601String(),
    "allergies": allergies,
  };
}

class MedicalFile {
  String? fileUrl;
  String? id;
  DateTime? uploadedAt;

  MedicalFile({
    this.fileUrl,
    this.id,
    this.uploadedAt,
  });

  factory MedicalFile.fromJson(Map<String, dynamic> json) => MedicalFile(
    fileUrl: json["fileUrl"],
    id: json["_id"],
    uploadedAt: json["uploadedAt"] == null ? null : DateTime.parse(json["uploadedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "fileUrl": fileUrl,
    "_id": id,
    "uploadedAt": uploadedAt?.toIso8601String(),
  };
}

class MedicalHistory {
  String? medicalDiagnoses;
  String? medicalReports;
  List<LaboratoryTest>? laboratoryTests;
  List<Vaccination>? vaccinations;

  MedicalHistory({
    this.medicalDiagnoses,
    this.medicalReports,
    this.laboratoryTests,
    this.vaccinations,
  });

  factory MedicalHistory.fromJson(Map<String, dynamic> json) => MedicalHistory(
    medicalDiagnoses: json["medicalDiagnoses"],
    medicalReports: json["medicalReports"],
    laboratoryTests: json["laboratoryTests"] == null ? [] : List<LaboratoryTest>.from(json["laboratoryTests"]!.map((x) => LaboratoryTest.fromJson(x))),
    vaccinations: json["vaccinations"] == null ? [] : List<Vaccination>.from(json["vaccinations"]!.map((x) => Vaccination.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "medicalDiagnoses": medicalDiagnoses,
    "medicalReports": medicalReports,
    "laboratoryTests": laboratoryTests == null ? [] : List<dynamic>.from(laboratoryTests!.map((x) => x.toJson())),
    "vaccinations": vaccinations == null ? [] : List<dynamic>.from(vaccinations!.map((x) => x.toJson())),
  };
}

class LaboratoryTest {
  String? testName;
  DateTime? date;
  String? id;

  LaboratoryTest({
    this.testName,
    this.date,
    this.id,
  });

  factory LaboratoryTest.fromJson(Map<String, dynamic> json) => LaboratoryTest(
    testName: json["testName"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "testName": testName,
    "date": date?.toIso8601String(),
    "_id": id,
  };
}

class Vaccination {
  String? vaccineName;
  String? id;

  Vaccination({
    this.vaccineName,
    this.id,
  });

  factory Vaccination.fromJson(Map<String, dynamic> json) => Vaccination(
    vaccineName: json["vaccineName"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "vaccineName": vaccineName,
    "_id": id,
  };
}

class PreviousMedications {
  List<PreviousTestComparison>? previousTestComparisons;
  List<PastMedication>? pastMedications;

  PreviousMedications({
    this.previousTestComparisons,
    this.pastMedications,
  });

  factory PreviousMedications.fromJson(Map<String, dynamic> json) => PreviousMedications(
    previousTestComparisons: json["previousTestComparisons"] == null ? [] : List<PreviousTestComparison>.from(json["previousTestComparisons"]!.map((x) => PreviousTestComparison.fromJson(x))),
    pastMedications: json["pastMedications"] == null ? [] : List<PastMedication>.from(json["pastMedications"]!.map((x) => PastMedication.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "previousTestComparisons": previousTestComparisons == null ? [] : List<dynamic>.from(previousTestComparisons!.map((x) => x.toJson())),
    "pastMedications": pastMedications == null ? [] : List<dynamic>.from(pastMedications!.map((x) => x.toJson())),
  };
}

class PastMedication {
  String? medicationName;
  String? duration;
  String? id;

  PastMedication({
    this.medicationName,
    this.duration,
    this.id,
  });

  factory PastMedication.fromJson(Map<String, dynamic> json) => PastMedication(
    medicationName: json["medicationName"],
    duration: json["duration"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "medicationName": medicationName,
    "duration": duration,
    "_id": id,
  };
}

class PreviousTestComparison {
  String? testName;
  List<int>? results;
  String? id;

  PreviousTestComparison({
    this.testName,
    this.results,
    this.id,
  });

  factory PreviousTestComparison.fromJson(Map<String, dynamic> json) => PreviousTestComparison(
    testName: json["testName"],
    results: json["results"] == null ? [] : List<int>.from(json["results"]!.map((x) => x)),
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "testName": testName,
    "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x)),
    "_id": id,
  };
}

class StateOfEmergency {
  String? emergencyContact;
  DateTime? lastHospitalAdmissionDate;
  String? previousSurgeries;

  StateOfEmergency({
    this.emergencyContact,
    this.lastHospitalAdmissionDate,
    this.previousSurgeries,
  });

  factory StateOfEmergency.fromJson(Map<String, dynamic> json) => StateOfEmergency(
    emergencyContact: json["emergencyContact"],
    lastHospitalAdmissionDate: json["lastHospitalAdmissionDate"] == null ? null : DateTime.parse(json["lastHospitalAdmissionDate"]),
    previousSurgeries: json["previousSurgeries"],
  );

  Map<String, dynamic> toJson() => {
    "emergencyContact": emergencyContact,
    "lastHospitalAdmissionDate": lastHospitalAdmissionDate?.toIso8601String(),
    "previousSurgeries": previousSurgeries,
  };
}
