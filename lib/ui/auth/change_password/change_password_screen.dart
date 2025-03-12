import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../services/translation_key.dart';
import 'controller/change_password_controller.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ChangePasswordController(),
      builder: (ChangePasswordController controller) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xffF3EFEF),
            centerTitle: true,
            toolbarHeight: 140.h,
            title: Container(
              width: 122.w,
              height: 117.h,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
              child: Image.asset("assets/images/logo.png", fit: BoxFit.fill),
            ),
          ),
          backgroundColor: Color(0xffF3EFEF),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10.h),
                Image.asset('assets/images/forgetpassword.png', height: 230.99.h, width: 310.w),
                SizedBox(height: 10.h),
                Text(
                  Change_Password.tr,
                  style: TextStyle(
                    color: Color(0xff49768C),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  width: 274.w,
                  height: 48.h,
                  child: Text(
                    Pleaseenteryourpasswordtocontinue.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff8B8B8B),
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),

                /// Password Field
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        password.tr,
                        style: TextStyle(
                          color: Color(0xff8B8B8B),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 338.w,
                  height: 50.h,
                  child: TextFormField(
                    obscureText: true,
                    controller: controller.passwordController,
                    validator: (v) => controller.validatePassword(v),
                    onChanged: (value) => controller.validatePasswordOnChange(value),
                    decoration: InputDecoration(
                      hintText: password.tr,
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

                /// Confirm Password Field
                SizedBox(height: 10.h),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        confirm_Password.tr,
                        style: TextStyle(
                          color: Color(0xff8B8B8B),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 338.w,
                  height: 50.h,
                  child: TextFormField(
                    obscureText: true,
                    controller: controller.confirmPasswordController,
                    validator: (v) => controller.validateConfirmPassword(v),
                    decoration: InputDecoration(
                      hintText: confirm_Password.tr,
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

                /// Password Requirements Display
                SizedBox(height: 15.h),

                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(YourPasswordMustContain.tr,
                      style: TextStyle(
                        color: Color(0xff8B8B8B),
                        fontSize: 9.sp,
                        fontWeight: FontWeight.bold
                      ),),
                      SizedBox(height: 10.h),                      Row(
                        children: [
                          Icon(
                            controller.containsNumber == null
                                ? Icons.circle // Default grey state
                                : controller.containsNumber!
                                ? Icons.check_circle // Satisfied condition
                                : Icons.check_circle, // Not satisfied
                            color: controller.containsNumber == null
                                ? Color(0xff8B8B8B)
                                : controller.containsNumber!
                                ? Color(0xff49768C)
                                : Color(0xff8B8B8B),
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            Numbers.tr,
                            style: TextStyle(
                              color: controller.containsNumber == null
                                  ? Colors.grey
                                  : controller.containsNumber!
                                  ? Colors.blue
                                  : Colors.grey,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            controller.containsLetter == null
                                ? Icons.circle
                                : controller.containsLetter!
                                ? Icons.check_circle
                                : Icons.check_circle,
                            color: controller.containsLetter == null
                                ? Color(0xff8B8B8B)
                                : controller.containsLetter!
                                ? Color(0xff49768C)
                                : Color(0xff8B8B8B),
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            Letters.tr,
                            style: TextStyle(
                              color: controller.containsLetter == null
                                  ? Colors.grey
                                  : controller.containsLetter!
                                  ? Colors.blue
                                  : Colors.grey,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),

                SizedBox(height: 20.h),
                Container(
                  width: 338.w,
                  height: 56.h,
                  child: ElevatedButton(
                    onPressed: () {
                      // controller.submitForm();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffB93439),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 15.h),
                    ),
                    child: Text(Reset.tr, style: TextStyle(fontSize: 20.sp, color: Colors.white)),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
