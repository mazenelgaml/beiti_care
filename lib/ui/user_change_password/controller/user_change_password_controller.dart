import 'dart:io';
import 'package:beiti_care/ui/auth/register/register_screen.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart'; // جديد: لمعالجة نوع الصورة
import '../../../models/profile_complete_model.dart';
import '../../../models/user_by_id_model.dart';
import '../../../services/end_points.dart';
import '../../../services/memory.dart';
class UserChangePasswordController extends GetxController{
  bool isLoading = false;
  UserByIdModel? userByIdModel;
  TextEditingController passwordController= TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  /// **التحقق من صحة كلمة المرور**
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "كلمة المرور مطلوبة";
    }
    if (value.length < 6) {
      return "يجب أن تكون كلمة المرور أطول من 6 أحرف";
    }
    return null;
  }

  /// **التحقق من تأكيد كلمة المرور**
  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "يجب تأكيد كلمة المرور";
    }
    if (value != passwordController.text) {
      return "كلمة المرور غير متطابقة";
    }
    return null;
  }
  File? image;
  String percentage="";
  double numericValue =0;
  // 2.8
  @override
  Future<void> onInit() async {
    super.onInit();
    await CacheHelper.init();
    await getUserProfile();
    await getProfileCompletePercentage();
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
        "/api/client/getUser/$id",
        options: dio.Options(headers: {"Content-Type": "application/json"}),
      );

      if (response.statusCode == 201) {
        UserByIdModel userDataModel = UserByIdModel.fromJson(response.data);
        userByIdModel = userDataModel;

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
  Future<void> getProfileCompletePercentage() async {
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
        "/api/client/profileCompletion/$id",
        options: dio.Options(headers: {"Content-Type": "application/json"}),
      );

      if (response.statusCode == 200) {
        ProfileCompleteModel userDataModel = ProfileCompleteModel.fromJson(response.data);
        percentage=userDataModel.profileCompletion??"";
        numericValue = double.parse(percentage.replaceAll('%', '')) / 100;
        print(numericValue);
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
  File? selectedImage;
  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImage = File(pickedFile.path);
      update(); // تحديث الـ UI
    }
  }

  Future<void> deleteUserAccount() async {
    isLoading = true;
    update();
    String? id = await Get.find<CacheHelper>().getData(key: "id");

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
        "/api/client/delete/$id",
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