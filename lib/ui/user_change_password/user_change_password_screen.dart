import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:get/get.dart';
import '../../services/translation_key.dart';
import '../../widgets/custom_button.dart';

class UserChangePasswordScreen extends StatefulWidget {
  UserChangePasswordScreen({super.key});

  @override
  _UserChangePasswordScreenState createState() => _UserChangePasswordScreenState();
}

class _UserChangePasswordScreenState extends State<UserChangePasswordScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 300.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 23.w,right: 23.w),
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
                    color: Color(0xffB93439),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
              SizedBox(width: 5.w),
              Text(
                Profile.tr,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffB93439),
                ),
              ),
            ],
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Row(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            "assets/images/boy.png",
                            width: 70.w,
                            height: 70.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () {
                              print("Edit Profile Picture");
                            },
                            child: Container(
                              width: 25.w,
                              height: 25.w,
                              alignment: Alignment.center,
                              child: Image.asset(
                                'assets/images/cameraicon.png',
                                width: 25.w,
                                height: 25.h,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rania Mohamed",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff000000),
                          ),
                        ),
                        Text(
                          "raniamohamed@gmail.com",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff8B8B8B),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16.h,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: 20.0.w, bottom: 5.h,right:  20.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Password.tr,
                          style: TextStyle(
                            color: Color(0xff8B8B8B),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h,),
                  Container(
                    width: 338.w,
                    height: 50.h,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: Password.tr,
                        hintStyle: TextStyle(
                          color: Color(0xff8B8B8B),
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xff8B8B8B), width: 2),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h,),
                  Padding(
                    padding:  EdgeInsets.only(left: 20.0.w, bottom: 5.h,right:  20.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          ConfirmPassword.tr,
                          style: TextStyle(
                            color: Color(0xff8B8B8B),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h,),
                  Container(
                    width: 338.w,
                    height: 50.h,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: ConfirmPassword.tr,
                        hintStyle: TextStyle(
                          color: Color(0xff8B8B8B),
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xff8B8B8B), width: 2),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 180.h,),
                  CustomButton(
                    onPressed: () {},
                    name: Save.tr,
                    borderRadius: 10,
                    btnColor: Color(0xffB93439),
                    textColor: Colors.white,
                  ),
                  SizedBox(height: 8.h,),
                  CustomButton(
                    onPressed: () {},
                    name: Cancel.tr,
                    borderRadius: 10,
                    btnColor: Color(0xff49768C),
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}