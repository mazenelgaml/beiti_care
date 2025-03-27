import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:get/get.dart';
import '../../services/translation_key.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_button_nav_bar_user.dart';
import '../basic_patiant_information/basic_patiant_information_screen.dart';
import '../user_change_password/user_change_password_screen.dart';
import 'controller/user_edit_profile_controller.dart';

class UserEditProfileScreen extends StatefulWidget {
  const UserEditProfileScreen({super.key});

  @override
  _UserEditProfileScreenState createState() => _UserEditProfileScreenState();
}

class _UserEditProfileScreenState extends State<UserEditProfileScreen> {


  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: UserEditProfileController(),
    builder: (UserEditProfileController controller) {
    return controller.isLoading?Scaffold(body: Center(child: CircularProgressIndicator(),),):Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 300.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 23.w),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
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
                ],
              ),
            ),
            Container(
              width: 338.w,
              height: 70.h,
              decoration: BoxDecoration(
                color: Color(0xffDBDBDB),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 50.w,
                        height: 50.h,
                        child: CircularProgressIndicator(
                          value:controller.numericValue,
                          backgroundColor: Colors.grey[300],
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                          strokeWidth: 6,
                        ),
                      ),
                      Text(
                        controller.percentage,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap:(){
                          Get.to(()=>BasicpatiantinformationScreen());
                        },
                        child: Text(
                          Completeyourprofile.tr,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey),
                        ),
                      ),
                      Text(
                        Completeyourfile.tr,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xffB93439),
                        ),
                      ),
                    ],
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
                    padding: const EdgeInsets.only(left: 20.0, bottom: 5,right:  20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          FullName.tr,
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
                        hintText: FullName.tr,
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
                    padding: const EdgeInsets.only(left: 20.0, bottom: 5,right:  20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Email.tr,
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
                        hintText: Email.tr,
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
                    padding: const EdgeInsets.only(left: 20.0, bottom: 5,right:  20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          PhoneNumber.tr,
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
                    height: 50.h,
                    width: 338.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color(0xff8B8B8B), width: 1.5),
                    ),
                    child: IntlPhoneField(
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: PhoneNumber.tr,
                        hintStyle: TextStyle(
                          color: Color(0xff8B8B8B),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      dropdownIcon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      ),
                      initialCountryCode: 'EG',
                      disableLengthCheck: true,
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                    ),
                  ),
                  SizedBox(height: 16.h,),
                  CustomButton(
                    onPressed: () {
                      Get.to(()=>UserChangePasswordScreen());
                    },
                    name: Password.tr,
                    borderRadius: 10,
                    btnColor: Colors.white,
                    textColor: Color(0xff49768C),
                  ),
                  SizedBox(height: 8.h,),
                  CustomButton(
                    onPressed: () {
                      controller.updateUserProfile(context);
                    },
                    name: Save.tr,
                    borderRadius: 10,
                    btnColor: Color(0xffB93439),
                    textColor: Colors.white,
                  ),
                  SizedBox(height: 8.h,),
                  CustomButton(
                    onPressed: () {
                      controller.username.clear();
                      controller.email.clear();
                      controller.phoneNumber.clear();
                    },
                    name: Cancel.tr,
                    borderRadius: 10,
                    btnColor: Color(0xff49768C),
                    textColor: Colors.white,
                  ),
                  SizedBox(height: 8.h,),
                  Container(
                    margin: EdgeInsets.only(bottom: 30.h),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffB93439)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: 338.w,
                    height: 60.h,
                    child: ElevatedButton(
                      onPressed: () {
                        // Show confirmation dialog
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              title: Row(
                                children: [
                                  Image.asset("assets/images/trash.png",width: 24.w,height: 24.h,),
                                  SizedBox(width: 8),
                                  Text(
                                    Areyousureyouwanttodeletetheaccount.tr,
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(); // Close the popup
                                  },
                                  child: Text(
                                    No.tr,
                                    style: TextStyle(fontSize: 16, color: Colors.grey),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    controller.deleteUserAccount();
                                  },
                                  child: Text(
                                    Yes.tr,
                                    style: TextStyle(fontSize: 16, color: Color(0xff264EB9)),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/Group.png",
                            width: 24.w,
                            height: 24.h,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            DeleteAccount.tr,
                            style: TextStyle(fontSize: 18.sp, color: Color(0xffB93439)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:Container(decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)
      ),margin:EdgeInsets.only(bottom: 20,left: 20,right: 20
      ),child: CurvedBottomNavBarUser(profileIcon: "assets/images/profileIconActive.png",)),

    );});
  }
}