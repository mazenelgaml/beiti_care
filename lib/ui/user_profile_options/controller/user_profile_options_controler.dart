import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/user_by_id_model.dart';
import '../../../services/end_points.dart';
import '../../../services/memory.dart';
class UserProfileOptionsController extends GetxController{
  bool isLoading = false;
  UserByIdModel? userByIdModel;
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
        "//api/client/getUser/$id",
        options: dio.Options(headers: {"Content-Type": "application/json"}),
      );

      if (response.statusCode == 200) {
        UserByIdModel userDataModel = UserByIdModel.fromJson(response.data);
        userByIdModel = userDataModel;
        username.text = userByIdModel?.user?.userName ?? "";
        email.text = userByIdModel?.user?.email ?? "";
        phoneNumber.text ="${userByIdModel?.user?.phone ?? ""}";
        String bioS = await Get.find<CacheHelper>().getData(key: "bio") ?? "";
        bio.text = bioS;
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
}