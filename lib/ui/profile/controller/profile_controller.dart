import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:beiti_care/ui/auth/register/register_screen.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import '../../../models/nurse_by_id_model.dart';
import '../../../models/update_nurse_model.dart';
import '../../../services/end_points.dart';
import '../../../services/memory.dart';

class ProfileController extends GetxController {
  bool isLoading = false;
  NurseByIdModel? nurseByIdModel;
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController bio = TextEditingController();
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
        nurseByIdModel = NurseByIdModel.fromJson(response.data);
        String bioS = await Get.find<CacheHelper>().getData(key: "bio") ?? "";
        bio.text = bioS;
      } else {
        Get.snackbar("خطأ", "فشل في تحميل البيانات");
      }
    } catch (e) {
      print(e);
      Get.snackbar("خطأ", "حدث خطأ أثناء الاتصال بالخادم");
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> updateUserProfile(BuildContext context) async {
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
      dio.FormData formData = dio.FormData.fromMap({
        "userName": username.text.trim(),
        "email": email.text.trim(),
        "phone": phoneNumber.text,
        if (image != null)
          "image": await dio.MultipartFile.fromFile(image!.path, filename: image!.path.split('/').last),
      });
      final response = await dioInstance.patch(
        "/api/nurse/update/$id",
        data: formData,
        options: dio.Options(headers: {"Content-Type": "multipart/form-data"}),
      );
      print("Response Status: ${response.statusCode}");
      print("Response Data: ${response.data}");

      if (response.statusCode == 200) {
        getUserProfile();
        Get.snackbar("نجاح", "تم تحديث الملف الشخصي بنجاح");
      } else {
        Get.snackbar("خطأ", "فشل تحديث البيانات");
      }
    } catch (e) {
      print("Error: ${e.toString()}");
      Get.snackbar("خطأ", "حدث خطأ أثناء الاتصال بالخادم");
    }
    finally {
      isLoading = false;
      update();
    }
  }

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File selectedImage = File(pickedFile.path);
      image = await compute(compressImage, selectedImage);
      update();
    }
  }

  static Future<File> compressImage(File file) async {
    return file; // يمكن إضافة ضغط للصورة هنا
  }

  Future<void> deleteNurseAccount() async {
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
      final response = await dioInstance.delete(
        "/info?id=$id",
        options: dio.Options(headers: {"Content-Type": "application/json"}),
      );

      if (response.statusCode == 200) {
        Get.find<CacheHelper>().loggingOut();
        Get.off(() => RegisterScreen());
      } else {
        Get.snackbar("خطأ", "فشل حذف الحساب");
      }
    } catch (e) {
      print(e);
      Get.snackbar("خطأ", "حدث خطأ أثناء الاتصال بالخادم");
    } finally {
      isLoading = false;
      update();
    }
  }
}
