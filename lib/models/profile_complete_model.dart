
import 'dart:convert';

ProfileCompleteModel profileCompleteModelFromJson(String str) => ProfileCompleteModel.fromJson(json.decode(str));

String profileCompleteModelToJson(ProfileCompleteModel data) => json.encode(data.toJson());

class ProfileCompleteModel {
String? message;
String? profileCompletion;

ProfileCompleteModel({
this.message,
this.profileCompletion,
});

factory ProfileCompleteModel.fromJson(Map<String, dynamic> json) => ProfileCompleteModel(
message: json["message"],
profileCompletion: json["profileCompletion"],
);

Map<String, dynamic> toJson() => {
"message": message,
"profileCompletion": profileCompletion,
};
}
