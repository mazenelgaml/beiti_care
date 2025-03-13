import 'package:beiti_care/ui/nurse/home/nurse_home_screen.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/login_model.dart';
import '../../../../services/end_points.dart';
import '../../../../services/memory.dart';
import '../../../models/contact_us_model.dart';

class ContactUsController extends GetxController{

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  String? validateNotEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "هذا الحقل مطلوب";
    }
    return null;
  }


  void submitForm(BuildContext context) {
    if (formKey.currentState!.validate()) {
      contactUs(context);
    }
  }
  bool isLoading=false;

  Future<void> contactUs(BuildContext context) async {
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
        "/api/nurse/contactUs",
        data: {
          "fullName": fullNameController.text.trim(),
          "message": messageController.text.trim(),
        },
        options: Options(headers: {
          "Content-Type": "application/json",
        }),
      );

      if (response.statusCode == 200) {
        final contactUsModel = ContactUsModel.fromJson(response.data);

        CoolAlert.show(
          context: context,
          type: CoolAlertType.success,
          title: "success",
          text: contactUsModel.message??"",
        );


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