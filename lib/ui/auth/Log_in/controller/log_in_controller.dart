import 'package:beiti_care/ui/nurse/home/nurse_home_screen.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/login_model.dart';
import '../../../../services/end_points.dart';
import '../../../../services/memory.dart';

class LogInController extends GetxController{

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'البريد الإلكتروني مطلوب';
    }
    final emailRegex = RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');
    if (!emailRegex.hasMatch(value)) {
      return 'البريد الإلكتروني غير صالح';
    }
    return null;
  }

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
      logIn(context);
    }
  }
  bool isLoading=false;

  Future<void> logIn(BuildContext context) async {
    isLoading = true;
    update();
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: EndPoint.baseUrl,
        validateStatus: (status) => status != null && status < 500,
      ),
    );

    isLoading = true;
    update();

    try {
      final response = await dio.post(
        "/api/auth/login",
        data: {
          "email": emailController.text.trim(),
          "password": passwordController.text.trim(),
        },
        options: Options(headers: {
          "Content-Type": "application/json",
        }),
      );

      if (response.statusCode == 200) {
        final loginModel = LoginModel.fromJson(response.data);
        final token = loginModel.token;
        final id = loginModel.user?.id;
        await Get.find<CacheHelper>().saveData(key: "token", value: token);
        await Get.find<CacheHelper>().saveData(key: "id", value: id);
        Get.off(() => NurseHomeScreen());

      } else {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          title: "خطأ",
          text: "البريد الإلكتروني أو كلمة المرور غير صحيحة، يرجى المحاولة مرة أخرى.",
        );
      }
    } catch (e) {
      print('خطأ تسجيل الدخول: $e');
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        title: "خطأ في الاتصال",
        text: "حدث خطأ أثناء الاتصال بالخادم.",
      );
    } finally {
      isLoading = false;
      update();
    }
  }
}