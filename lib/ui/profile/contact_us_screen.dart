import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

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
                "Contact Us",
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
      body: Column(
        children: [
          SizedBox(height: 20.h,),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Full Name",
                  style: TextStyle(
                    color: Color(0xff8B8B8B),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5.h,),
          Container(
            width: 338.w,
            height: 50.h,
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Full Name",
                hintStyle: TextStyle(
                  color: Color(0xff8B8B8B),
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xff264EB9), width: 2),
                ),
              ),
            ),
          ),
          SizedBox(height: 12.h,),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Message",
                  style: TextStyle(
                    color: Color(0xff8B8B8B),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5.h,),
          Container(
            width: 338.w,
            child: TextFormField(
              maxLines: 5, // السماح بكتابة أكثر من سطر
              decoration: InputDecoration(
                hintText: "Message",
                hintStyle: TextStyle(
                  color: Color(0xff8B8B8B),
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xff264EB9), width: 2),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 12.h,
                ), // تحسين المسافات
              ),
            ),
          ),
        ],
      ),
    );
  }
}
