import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../services/translation_key.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                About.tr,
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
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 338.w,
              height: 130.h,
              child: TextFormField(
                maxLines: 5, // السماح بكتابة أكثر من سطر
                decoration: InputDecoration(
                  hintText: Introduction.tr,
                  hintStyle: TextStyle(
                    color: Color(0xff8B8B8B),
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),
                  filled: true,
                  fillColor: Color(0xffD9D9D9),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xff8B8B8B), width: 2),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 19.w,
                    vertical: 12.h,
                  ), // تحسين المسافات
                ),
              ),
            ),
          ),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              Ournursingservices.tr,
              style:
              TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500,color: Color(0xffB93439)),
            ),
          ),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              Weprovidecomprehensivehealthcareinyourhome.tr,
              style:
              TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500,color: Color(0xff8B8B8B)),
            ),
          ),

        ],
      ) ,
    );
  }
}
