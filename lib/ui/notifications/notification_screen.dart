import 'package:beiti_care/ui/notifications/controller/notifications_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../services/translation_key.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: NotificationsController(),
    builder: (NotificationsController controller) {
    return controller.isLoading?Scaffold(body: Center(child: CircularProgressIndicator(),),): Scaffold(
      appBar: AppBar(
        leadingWidth: 170.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 24.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                    color: const Color(0xffB93439),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
              SizedBox(width: 5.w),
              Text(
                Notifications.tr,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xffB93439),
                ),
              ),
            ],
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: ListView.builder(
          itemCount: controller.nurseNotifications?.length, // عدد الإشعارات
          itemBuilder: (context, index) {
            return Container(
              width: 338.w,
              height: 50.h,
              margin: EdgeInsets.symmetric(vertical: 7.h), // تباعد بين العناصر
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xff8B8B8B), width: 1),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/bytycare.png",
                    width: 50.w,
                    height: 25.h,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Text(
                      controller.nurseNotifications?[index].message??"",
                      style: TextStyle(
                        color: const Color(0xff8B8B8B),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );});
  }
}
