import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../services/translation_key.dart';
import '../../widgets/custom_button.dart';
import 'controller/profile_change_password_controller.dart';

class ProfileChangePasswordScreen extends StatefulWidget {
  const ProfileChangePasswordScreen({super.key});

  @override
  _ProfileChangePasswordScreenState createState() => _ProfileChangePasswordScreenState();
}

class _ProfileChangePasswordScreenState extends State<ProfileChangePasswordScreen> {


  @override




  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ProfileChangePasswordController(),
    builder: (ProfileChangePasswordController controller) {
    return controller.isLoading?Scaffold(body: Center(child: CircularProgressIndicator(),),): Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 150.w,
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
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile image and details
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          ClipOval(
                            child:controller.nurseByIdModel?.data?.image==null||controller.nurseByIdModel?.data?.image==""?Image.asset(
                              "assets/images/pngtree-avatar-icon-profile-icon-member-login-vector-isolated-png-image_1978396.jpg",

                              width: 70.w,
                              height: 70.h,
                              fit: BoxFit.cover,
                            ):Image.network(controller.nurseByIdModel?.data?.image??"",width: 70.w,
                              height: 70.h,fit: BoxFit.cover,),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                print(EditProfilePicture.tr);
                              },
                              child: Container(
                                width: 25.w,
                                height: 25.w,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black45,
                                      blurRadius: 4,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 18,
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
                            controller
                            .nurseByIdModel?.data?.userName??"",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff000000),
                            ),
                          ),
                          Text(
                            controller
                                .nurseByIdModel?.data?.email??"",
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
              SizedBox(height: 50.h),
              // Password field
              Text(
                password.tr,
                style: TextStyle(
                  color: Color(0xff8B8B8B),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 5.h),
              Container(
                width: 338.w,
                height: 50.h,
                child: TextFormField(
                  controller: controller.passwordController,
                  validator:(value){
                    controller.validatePassword(value);
                  },
                  obscureText: true,
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
              SizedBox(height: 15.h),
              // Confirm Password field
              Text(
                confirm_Password.tr,
                style: TextStyle(
                  color: Color(0xff8B8B8B),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 5.h),
              Container(
                width: 338.w,
                height: 50.h,
                child: TextFormField(
                  controller: controller.confirmPasswordController,
                  obscureText: true,
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
                  validator: (value) {
                    controller.validateConfirmPassword(value);
                  },
                ),
              ),
              // Extra spacing to allow scrolling when content is long
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
      // Bottom buttons (Save and Cancel)
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton(
              onPressed:() {
                controller.submitForm(context);
              },
              name: Save.tr,
              borderRadius: 10,
              btnColor: Color(0xffB93439),
              textColor: Colors.white,
            ),
            SizedBox(height: 8.h),
            CustomButton(
              onPressed: () {
                Get.back();
              },
              name: cancel.tr,
              borderRadius: 10,
              btnColor: Color(0xff263238),
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
    });
  }
}
