import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../services/translation_key.dart';
import '../../widgets/custom_button.dart';
import 'controller/user_change_password_controller.dart';

class UserChangePasswordScreen extends StatefulWidget {
  const UserChangePasswordScreen({super.key});

  @override
  _UserChangePasswordScreenState createState() => _UserChangePasswordScreenState();
}

class _UserChangePasswordScreenState extends State<UserChangePasswordScreen> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: UserChangePasswordController(),
    builder: (UserChangePasswordController controller) {
    return controller.isLoading?Scaffold(body: Center(child: CircularProgressIndicator(),),): Scaffold(
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
                          child: controller.selectedImage != null
                              ? Image.file(
                            controller.selectedImage!,
                            width: 70.w,
                            height: 70.h,
                            fit: BoxFit.cover,
                          )
                              : (controller.userByIdModel?.user?.image == null || controller.userByIdModel?.user?.image == "")
                              ? Image.asset(
                            "assets/images/pngtree-avatar-icon-profile-icon-member-login-vector-isolated-png-image_1978396.jpg",
                            width: 70.w,
                            height: 70.h,
                            fit: BoxFit.cover,
                          )
                              : Image.network(
                            controller.userByIdModel?.user?.image??"",
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
                              controller.pickImage();
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
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.userByIdModel?.user?.userName??"",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff000000),
                            ),
                          ),
                          Text(
                            controller.userByIdModel?.user?.email??"",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff8B8B8B),
                            ),
                          ),
                        ],
                      ),
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
                      controller: controller.passwordController,
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
                      controller: controller.confirmPassword,
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
                    onPressed: () {

                    },
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
    );});
  }

}