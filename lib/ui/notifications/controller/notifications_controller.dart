import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../services/end_points.dart';
import '../../../../services/memory.dart';
import '../../../models/notifications_model.dart' as n;

class NotificationsController extends GetxController {
  bool isLoading = false;
  List<n.Notification>? nurseNotifications;

  @override
  Future<void> onInit() async {
    super.onInit();
    await CacheHelper.init();
    await getNurseNotifications();
  }

  Future<void> getNurseNotifications() async {
    nurseNotifications=[];
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
        "/api/notification/$id",
        options: dio.Options(headers: {"Content-Type": "application/json"}),
      );

      if (response.statusCode == 200) {
        n.NotificationsModel notificationsModel = n.NotificationsModel.fromJson(response.data);
        nurseNotifications = notificationsModel.notifications;
        print(nurseNotifications);
      } else {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(content: Text('Error fetching notifications data')),
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


}
