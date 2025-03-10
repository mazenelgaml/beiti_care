import 'package:beiti_care/services/translation_key.dart';
import 'package:beiti_care/ui/auth/forget_password/forget_password_screen.dart';
import 'package:beiti_care/ui/auth/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../nurse/home/nurse_home_screen.dart';
import 'controller/log_in_controller.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isClient = true;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: LogInController(),
    builder: (LogInController controller) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffF3EFEF),
        leading: null,
        centerTitle: true,
        toolbarHeight: 120.h,
        title: Container(
          width: 122.w,
          height: 117.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
          child: Image.asset("assets/images/logo.png", fit: BoxFit.fill),
        ),
      ),
      backgroundColor: Color(0xffF3EFEF),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 15.h),
              Image.asset('assets/images/changePassword.png', height: 230.99.h,width: 310.w,),
              SizedBox(height: 15.h),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => isClient = true),
                      child: Container(
                        height: 44.h,
                        decoration: BoxDecoration(
                          color: isClient ? Color(0xffB93439) : Color(0xffCECECE),
                        ),
                        child: Center(
                          child: Text(
                            'Client',
                            style: TextStyle(
                              color: isClient ? Colors.white : Color(0xff8B8B8B),
                              fontWeight: FontWeight.w700,
                              fontSize: 20.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => isClient = false),
                      child: Container(
                        height: 44.h,
                        decoration: BoxDecoration(
                          color: !isClient ? Color(0xffB93439) : Color(0xffCECECE),
                        ),
                        child: Center(
                          child: Text(
                            'Nurse',
                            style: TextStyle(
                              color: !isClient ? Colors.white : Color(0xff8B8B8B),
                              fontWeight: FontWeight.w700,
                              fontSize: 20.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Text(
                logIn.tr,
                style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold, color: Color(0xffB93439)),
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: const EdgeInsets.only(left: 20.0,bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Email",style: TextStyle(color: Color(0xff8B8B8B),fontSize: 18.sp,fontWeight: FontWeight.w700),),
                  ],
                ),
              ),
              Container(
                width: 338.w,
                height: 50.h,
                child: TextFormField(
                  controller: controller.emailController,
                  validator: (value){controller.validateEmail(value);},
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(
                      color: Color(0xff8B8B8B),
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:BorderSide(color: Color(0xff8B8B8B),width: 2)
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: const EdgeInsets.only(left: 20.0,bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Password",style: TextStyle(color: Color(0xff8B8B8B),fontSize: 18.sp,fontWeight: FontWeight.w700),),
                  ],
                ),
              ),
              Container(
                width: 338.w,
                height: 50.h,
                child: TextFormField(
                  obscureText: true,
                  controller: controller.passwordController,
                  validator: (value){controller.validatePassword(value);},
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(
                        color: Color(0xff8B8B8B),
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:BorderSide(color: Color(0xff8B8B8B),width: 2)
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Get.off(()=>ForgetPasswordScreen());
                  },
                  child: Text('Forget Password?', style: TextStyle(fontSize: 16,color: Color(0xff49768C))),
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                width: 338.w,
                height: 56.h,
                child: ElevatedButton(
                  onPressed: () {
                    controller.submitForm();
                    Get.off(()=>NurseHomeScreen());
                  },
          
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffB93439),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 15.h),
          
                  ),
                  child: Text('Log in', style: TextStyle(fontSize: 20.sp, color: Colors.white)),
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ",style: TextStyle(
                    color: Color(0xff8B8B8B),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600
                  ),),
                  GestureDetector(
                    onTap: () {
                      Get.off(()=>RegisterScreen());
                    },
                    child: Text('Register', style: TextStyle(color: Color(0xffB93439), fontWeight: FontWeight.w600,fontSize: 18.sp)),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );});
  }
}
