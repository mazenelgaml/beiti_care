import 'dart:io';
import 'package:beiti_care/ui/auth/register/register_screen.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart'; // جديد: لمعالجة نوع الصورة
import '../../../models/nurse_by_id_model.dart';
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
    String? id = await Get.find<CacheHelper>().getData(key: "nurseId");

    if (id == null || id.isEmpty) {
      print("Error: ID is missing");
      Get.snackbar("خطأ", "تعذر العثور على معرف المستخدم");
      isLoading = false;
      update();
      return;
    }

    final dio.Dio dioInstance = dio.Dio(
      dio.BaseOptions(
        baseUrl: EndPoint.baseUrl,
      ),
    );

    try {
      final response = await dioInstance.get(
        "/api/nurse/getNurse/$id",
        options: dio.Options(headers: {"Content-Type": "application/json"}),
      );

      print("Response Status: ${response.statusCode}");
      print("Response Data: ${response.data}");

      if (response.statusCode == 200) {
        nurseByIdModel = NurseByIdModel.fromJson(response.data);
        username.text=nurseByIdModel?.data?.userName??"";
        phoneNumber.text=nurseByIdModel?.data?.phone??"";
        email.text=nurseByIdModel?.data?.email??"";
        String bioS = await Get.find<CacheHelper>().getData(key: "bio") ?? "";
        bio.text = bioS;
        print("📷 Current Image URL: ${nurseByIdModel?.data?.image}");
      } else {
        Get.snackbar("خطأ", "فشل في تحميل البيانات");
      }
    } catch (e) {
      print("DioError: ${e.toString()}");
      if (e is dio.DioException) {
        print("Response data: ${e.response?.data}");
        print("Response status code: ${e.response?.statusCode}");
      }
      Get.snackbar("خطأ", "حدث خطأ أثناء الاتصال بالخادم");
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> updateUserProfile(BuildContext context) async {
    isLoading = true;
    update();
    String? id = await Get.find<CacheHelper>().getData(key: "nurseId");

    if (id == null || id.isEmpty) {
      print("Error: ID is missing");
      Get.snackbar("خطأ", "تعذر العثور على معرف المستخدم");
      isLoading = false;
      update();
      return;
    }

    final dio.Dio dioInstance = dio.Dio(
      dio.BaseOptions(
        baseUrl: EndPoint.baseUrl,
      ),
    );

    // ✅ التحقق من الصورة قبل الإرسال
    if (image != null) {
      print("✅ Selected Image: ${image!.path}");
      print("✅ Image Exists: ${await image!.exists()}");
      print("✅ Image Size: ${await image!.length()} bytes");
    } else {
      print("⚠️ No Image Selected!");
    }

    try {
      dio.FormData formData = dio.FormData.fromMap({
        "userName": username.text.trim(),
        "email": email.text.trim(),
        "phone": phoneNumber.text.trim(),
        if (image != null)
          "image": await dio.MultipartFile.fromFile(
            image!.path,
            filename: image!.path.split('/').last,
            contentType: MediaType("image", "jpeg"), // تأكيد نوع الصورة
          ),
      });

      // ✅ طباعة البيانات قبل الإرسال
      print("📤 Sending FormData: ${formData.fields}");
      if (image != null) {
        print("📤 Uploading Image: ${image!.path}");
      }

      final response = await dioInstance.patch(
        "/api/nurse/update/$id",
        data: formData,
        options: dio.Options(
          headers: {
            "Content-Type": "multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW",
          },
        ),
      );

      print("Response Status: ${response.statusCode}");
      print("Response Data: ${response.data}");

      if (response.statusCode == 200) {
        await getUserProfile();
        await Future.delayed(Duration(seconds: 1)); // ✅ انتظار التحديث
        print("📷 Updated Image URL: ${nurseByIdModel?.data?.image}");
        Get.snackbar("نجاح", "تم تحديث الملف الشخصي بنجاح");
      } else {
        Get.snackbar("خطأ", "فشل تحديث البيانات");
      }
    } catch (e) {
      print("DioError: ${e.toString()}");
      if (e is dio.DioException) {
        print("Response data: ${e.response?.data}");
        print("Response status code: ${e.response?.statusCode}");
      }
      Get.snackbar("خطأ", "حدث خطأ أثناء الاتصال بالخادم");
    } finally {
      isLoading = false;
      update();
    }
  }

  File? selectedImage;
  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImage = File(pickedFile.path);
      update(); // تحديث الـ UI
    }
  }


  Future<void> deleteNurseAccount() async {
    isLoading = true;
    update();
    String? id = await Get.find<CacheHelper>().getData(key: "nurseId");

    if (id == null || id.isEmpty) {
      print("Error: ID is missing");
      Get.snackbar("خطأ", "تعذر العثور على معرف المستخدم");
      isLoading = false;
      update();
      return;
    }

    final dio.Dio dioInstance = dio.Dio(
      dio.BaseOptions(
        baseUrl: EndPoint.baseUrl,
      ),
    );

    try {
      final response = await dioInstance.delete(
        "/api/nurse/delete/$id",
        options: dio.Options(headers: {"Content-Type": "application/json"}),
      );

      print("Response Status: ${response.statusCode}");
      print("Response Data: ${response.data}");

      if (response.statusCode == 200) {
        Get.find<CacheHelper>().loggingOut();
        Get.off(() => RegisterScreen());
      } else {
        Get.snackbar("خطأ", "فشل حذف الحساب");
      }
    } catch (e) {
      print("DioError: ${e.toString()}");
      if (e is dio.DioException) {
        print("Response data: ${e.response?.data}");
        print("Response status code: ${e.response?.statusCode}");
      }
      Get.snackbar("خطأ", "حدث خطأ أثناء الاتصال بالخادم");
    } finally {
      isLoading = false;
      update();
    }
  }
}
