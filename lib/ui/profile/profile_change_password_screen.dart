import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_button.dart';

class ProfileChangePasswordScreen extends StatefulWidget {
  const ProfileChangePasswordScreen({super.key});

  @override
  _ProfileChangePasswordScreenState createState() => _ProfileChangePasswordScreenState();
}

class _ProfileChangePasswordScreenState extends State<ProfileChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _savePassword() {
    if (_formKey.currentState!.validate()) {
      // Password validation passed; proceed with save logic
      print("Password changed successfully!");
      // You can add your API call or further actions here.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                "Profile",
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
          key: _formKey,
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
              SizedBox(height: 50.h),
              // Password field
              Text(
                "Password",
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
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
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
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 15.h),
              // Confirm Password field
              Text(
                "Confirm Password",
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
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
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
                    if (value == null || value.isEmpty) {
                      return 'Please confirm password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
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
              onPressed: _savePassword,
              name: 'Save',
              borderRadius: 10,
              btnColor: Color(0xffB93439),
              textColor: Colors.white,
            ),
            SizedBox(height: 8.h),
            CustomButton(
              onPressed: () {
                Navigator.pop(context);
              },
              name: 'Cancel',
              borderRadius: 10,
              btnColor: Color(0xff263238),
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
