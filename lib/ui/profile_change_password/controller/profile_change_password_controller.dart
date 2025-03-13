import 'dart:convert';

import 'package:cool_alert/cool_alert.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../models/nurse_by_id_model.dart';
import '../../../services/end_points.dart';
import '../../../services/memory.dart';

class ProfileChangePasswordController extends GetxController {
  bool isLoading = false;
  NurseByIdModel? nurseByIdModel;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'كلمة المرور مطلوبة';
    }
    if (value.length < 6) {
      return 'كلمة المرور يجب أن تكون على الأقل 6 أحرف';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'تأكيد كلمة المرور مطلوب';
    }
    if (value != passwordController.text) {
      return 'كلمة المرور غير متطابقة';
    }
    return null;
  }
  void submitForm(BuildContext context) {
    if (formKey.currentState!.validate()) {
      updateUserPassword(context);
    }
  }
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  File? image;

  @override
  Future<void> onInit() async {
    super.onInit();
    await CacheHelper.init();
    await getUserProfile();
  }
  String? validateNotEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "هذا الحقل مطلوب";
    }
    return null;
  }

  Future<void> getUserProfile() async {
    isLoading = true;
    update();
    String id = await Get.find<CacheHelper>().getData(key: "id");
    final dio.Dio dioInstance = dio.Dio(
      dio.BaseOptions(
        baseUrl: EndPoint.baseUrl,
        validateStatus: (status) => status != null && status < 500,
      ),
    );

    try {
      final response = await dioInstance.get(
        "/api/nurse/getNurse/$id",
        options: dio.Options(headers: {"Content-Type": "application/json"}),
      );

      if (response.statusCode == 200) {
        NurseByIdModel userDataModel = NurseByIdModel.fromJson(response.data);
        nurseByIdModel = userDataModel;

      } else {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(content: Text('Error fetching user data')),
        );
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: Text('Error occurred while connecting to the Server')),
      );
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> updateUserPassword(BuildContext context) async {
    isLoading = true;
    update();

    String id = await Get.find<CacheHelper>().getData(key: "id");
    print("User ID: $id");  // ✅ تأكد أن id ليس فارغًا

    final Dio dio = Dio(
      BaseOptions(
        baseUrl: EndPoint.baseUrl,
        validateStatus: (status) => status != null && status < 500,
      ),
    );

    // 🔹 إرسال البيانات كـ JSON بدلاً من FormData


    try {
      final response = await dio.patch(
        "/api/nurse/update/$id",
        data: {
          "password": passwordController.text.trim(),


          // 🔹 لو الـ API يقبل الصورة كـ URL أو base64، غير هنا
        },  // 🔹 إرسال البيانات كـ JSON
        options: Options(headers: {
          "Content-Type": "application/json",
        }),
      );

      print("Response Code: ${response.statusCode}");
      print("Response Data: ${response.data}");  // ✅ طباعة الاستجابة للتأكد

      if (response.statusCode == 200) {
        NurseByIdModel userDataModel = NurseByIdModel.fromJson(response.data);
        nurseByIdModel = userDataModel;
        getUserProfile();
        passwordController.text="";
        confirmPasswordController.text="";
        FocusScope.of(context).unfocus();
        CoolAlert.show(
          context: context,
          type: CoolAlertType.success,
          title: "success",
          text: 'Password updated successfully',
        );

      } else {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(content: Text('Error updating user data')),
        );
      }
    } catch (e) {
      print("Error: $e");  // ✅ طباعة الخطأ لمعرفة السبب الحقيقي
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: Text('Error occurred while connecting to the Server')),
      );
    } finally {
      isLoading = false;
      update();
    }
  }


  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      update();
    }
  }


}
