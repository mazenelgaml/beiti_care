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
  String? gender;
  int? age;
  int? years;
  int? phone;
  int? v;
  String? role;
  DateTime? updatedAt;
  String? bloodType;
  List<Comment>? comments;
  String? familyHealthHistory;
  String? healthNumber;
  String? idCard;
  List<MedicalFile>? medicalFiles;
  String? fingerprint;

  User({
    this.generalHealthStatus,
    this.stateOfEmergency,
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
    this.role,
    this.updatedAt,
    this.bloodType,
    this.comments,
    this.familyHealthHistory,
    this.healthNumber,
    this.idCard,
    this.medicalFiles,
    this.fingerprint,
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
    gender: json["gender"],
    age: json["age"],
    years: json["years"],
    phone: json["phone"],
    v: json["__v"],
    role: json["role"],
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    bloodType: json["bloodType"],
    comments: json["comments"] == null ? [] : List<Comment>.from(json["comments"]!.map((x) => Comment.fromJson(x))),
    familyHealthHistory: json["familyHealthHistory"],
    healthNumber: json["healthNumber"],
    idCard: json["idCard"],
    medicalFiles: json["medicalFiles"] == null ? [] : List<MedicalFile>.from(json["medicalFiles"]!.map((x) => MedicalFile.fromJson(x))),
    fingerprint: json["fingerprint"],
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
    "gender": gender,
    "age": age,
    "years": years,
    "phone": phone,
    "__v": v,
    "role": role,
    "updatedAt": updatedAt?.toIso8601String(),
    "bloodType": bloodType,
    "comments": comments == null ? [] : List<dynamic>.from(comments!.map((x) => x.toJson())),
    "familyHealthHistory": familyHealthHistory,
    "healthNumber": healthNumber,
    "idCard": idCard,
    "medicalFiles": medicalFiles == null ? [] : List<dynamic>.from(medicalFiles!.map((x) => x.toJson())),
    "fingerprint": fingerprint,
  };
}

class Comment {
  String? text;
  String? id;
  DateTime? date;

  Comment({
    this.text,
    this.id,
    this.date,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    text: json["text"],
    id: json["_id"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "_id": id,
    "date": date?.toIso8601String(),
  };
}

class GeneralHealthStatus {
  String? chronicDiseases;
  String? allergies;
  String? currentMedications;
  DateTime? lastExaminationDate;

  GeneralHealthStatus({
    this.chronicDiseases,
    this.allergies,
    this.currentMedications,
    this.lastExaminationDate,
  });

  factory GeneralHealthStatus.fromJson(Map<String, dynamic> json) => GeneralHealthStatus(
    chronicDiseases: json["chronicDiseases"],
    allergies: json["allergies"],
    currentMedications: json["currentMedications"],
    lastExaminationDate: json["lastExaminationDate"] == null ? null : DateTime.parse(json["lastExaminationDate"]),
  );

  Map<String, dynamic> toJson() => {
    "chronicDiseases": chronicDiseases,
    "allergies": allergies,
    "currentMedications": currentMedications,
    "lastExaminationDate": lastExaminationDate?.toIso8601String(),
  };
}

class MedicalFile {
  String? filename;
  String? fileUrl;
  String? id;
  DateTime? uploadedAt;

  MedicalFile({
    this.filename,
    this.fileUrl,
    this.id,
    this.uploadedAt,
  });

  factory MedicalFile.fromJson(Map<String, dynamic> json) => MedicalFile(
    filename: json["filename"],
    fileUrl: json["fileUrl"],
    id: json["_id"],
    uploadedAt: json["uploadedAt"] == null ? null : DateTime.parse(json["uploadedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "filename": filename,
    "fileUrl": fileUrl,
    "_id": id,
    "uploadedAt": uploadedAt?.toIso8601String(),
  };
}

class MedicalHistory {
  List<LaboratoryTest>? laboratoryTests;
  String? medicalReports;
  String? medicalDiagnoses;
  List<Vaccination>? vaccinations;

  MedicalHistory({
    this.laboratoryTests,
    this.medicalReports,
    this.medicalDiagnoses,
    this.vaccinations,
  });

  factory MedicalHistory.fromJson(Map<String, dynamic> json) => MedicalHistory(
    laboratoryTests: json["laboratoryTests"] == null ? [] : List<LaboratoryTest>.from(json["laboratoryTests"]!.map((x) => LaboratoryTest.fromJson(x))),
    medicalReports: json["medicalReports"],
    medicalDiagnoses: json["medicalDiagnoses"],
    vaccinations: json["vaccinations"] == null ? [] : List<Vaccination>.from(json["vaccinations"]!.map((x) => Vaccination.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "laboratoryTests": laboratoryTests == null ? [] : List<dynamic>.from(laboratoryTests!.map((x) => x.toJson())),
    "medicalReports": medicalReports,
    "medicalDiagnoses": medicalDiagnoses,
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
  DateTime? date;
  String? id;

  Vaccination({
    this.vaccineName,
    this.date,
    this.id,
  });

  factory Vaccination.fromJson(Map<String, dynamic> json) => Vaccination(
    vaccineName: json["vaccineName"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "vaccineName": vaccineName,
    "date": date?.toIso8601String(),
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
