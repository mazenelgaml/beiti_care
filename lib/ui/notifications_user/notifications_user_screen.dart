import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../services/translation_key.dart';
import 'package:get/get.dart';

class NotificationsUser extends StatelessWidget {
  const NotificationsUser({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> notifications = [
      Yourrequesthasbeenapproved.tr,
      Yourrequesthasbeenrejected.tr,
      Thenurseisonhiswaytoyou.tr,
      Thenursehasarrived.tr,
      Servicestartednow.tr,
      Bloodtestappointmenttoday.tr,
      Diabetescheckupappointmenttoday.tr,
      Kidneyfunctiontestappointmenttoday.tr,
      Resultshavebeensent.tr
    ];

    return Scaffold(
      backgroundColor: Color(0xffF3EFEF),
      appBar: AppBar(
        leadingWidth: 270.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 25.w,right: 25.w),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 30.w,
                  height: 30.h,
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
              SizedBox(width: 10.w),
              Text(
                Notifications1.tr,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xffB93439),
                ),
              ),
            ],
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Color(0xffF3EFEF),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: notifications.isEmpty
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/notif.png', // Replace with the path to your image
                width: 500.w,
                height: 300.h,
              ),
              SizedBox(height: 20.h),
              Text(
                Nonotifications.tr,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        )
            : ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: _buildFileItem(notifications[index]),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFileItem(String notification) {
    return Container(
      width: 338.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade400),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: [
          Image.asset('assets/images/logo.png', width: 30.w, height: 30.h),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              notification,
              style: TextStyle(
                fontSize: 15.sp,
                color: Color(0xff8B8B8B),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}