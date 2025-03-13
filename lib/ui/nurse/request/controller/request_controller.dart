import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../models/confirm_session_model.dart'as c;
import '../../../../models/nurse_sessions_modle.dart';
import '../../../../services/end_points.dart';
import '../../../../services/memory.dart';

class RequestController extends GetxController {
  bool isLoading = false;
  List<Session>? nurseSessionsModel;

  @override
  Future<void> onInit() async {
    super.onInit();
    await CacheHelper.init();
    await getNurseSessions();
  }

  Future<void> getNurseSessions() async {
     nurseSessionsModel=[];
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
        "/api/session/nurseSessions/$id",
        options: dio.Options(headers: {"Content-Type": "application/json"}),
      );

      if (response.statusCode == 200) {
        NurseSessionsModel userDataModel = NurseSessionsModel.fromJson(response.data);
        nurseSessionsModel = userDataModel.sessions;
        print(nurseSessionsModel);
      } else {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(content: Text('Error fetching sessions data')),
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

  Future<void> confirmSession(String sessionId) async {
    isLoading = true;
    update();
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: EndPoint.baseUrl,
        validateStatus: (status) => status != null && status < 500,
      ),
    );

    // 🔹 إرسال البيانات كـ JSON بدلاً من FormData


    try {
      final response = await dio.put(
        "/api/session/confirm/$sessionId",
         // 🔹 إرسال البيانات كـ JSON
        options: Options(headers: {
          "Content-Type": "application/json",
        }),
      );

      print("Response Code: ${response.statusCode}");
      print("Response Data: ${response.data}");  // ✅ طباعة الاستجابة للتأكد

      if (response.statusCode == 200) {
        c.ConfirmSessionsModel confirmationModel = c.ConfirmSessionsModel.fromJson(response.data);
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(content: Text(confirmationModel.message??"")),
        );
      } else {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(content: Text('Error confirming session')),
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

  Future<void> cancelSession(String sessionId) async {
    isLoading = true;
    update();
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: EndPoint.baseUrl,
        validateStatus: (status) => status != null && status < 500,
      ),
    );

    // 🔹 إرسال البيانات كـ JSON بدلاً من FormData


    try {
      final response = await dio.put(
        "/api/session/cancel/$sessionId",
        // 🔹 إرسال البيانات كـ JSON
        options: Options(headers: {
          "Content-Type": "application/json",
        }),
      );

      print("Response Code: ${response.statusCode}");
      print("Response Data: ${response.data}");  // ✅ طباعة الاستجابة للتأكد

      if (response.statusCode == 200) {
        c.ConfirmSessionsModel confirmationModel = c.ConfirmSessionsModel.fromJson(response.data);
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(content: Text(confirmationModel.message??"")),
        );
      } else {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(content: Text('Error canceling session')),
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
}
