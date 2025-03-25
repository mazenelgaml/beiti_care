import 'package:beiti_care/ui/medical_tests/medical_tests_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../services/translation_key.dart';
import '../../widgets/custom_button_nav_bar_user.dart';
import '../history/history_screen.dart';
import '../therapeutic_examinations/therapeutic_examinations_screen.dart';
import '../user_edit_profile/user_edit_profile_screen.dart';


class UserProfileOptionsScreen extends StatefulWidget {
  const UserProfileOptionsScreen({super.key});

  @override
  _UserProfileOptionsScreenState createState() => _UserProfileOptionsScreenState();
}

class _UserProfileOptionsScreenState extends State<UserProfileOptionsScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 300.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 23.w),
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
                              print(EditProfilePicture.tr);
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
                          value: 0.7,
                          backgroundColor: Colors.grey[300],
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                          strokeWidth: 6,
                        ),
                      ),
                      Text(
                        "70%",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 12.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Completeyourprofile.tr,
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey),
                      ),
                      Text(
                        Completeyourfile.tr,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Color(0xffB93439),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h,),
            GestureDetector(
              onTap: () {
                print("Edit Profile clicked");
                Get.to(UserEditProfileScreen());
              },
              child: Container(
                width: 338.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: Color(0xffDBDBDB),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Text(
                        EditProfile.tr,
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Color(0xff49768C),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            GestureDetector(
              onTap: () {
                print("Medical tests clicked");
                Get.to(medicaltestsScreen());
              },
              child: Container(
                width: 338.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: Color(0xffDBDBDB),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Text(
                        Medicaltests.tr,
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Color(0xff49768C),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            GestureDetector(
              onTap: () {
                print("History clicked");
                Get.to(HistoryScreen());
              },
              child: Container(
                width: 338.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: Color(0xffDBDBDB),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Text(
                        History1.tr,
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Color(0xff49768C),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            GestureDetector(
              onTap: () {
                print("Therapeutic examinations clicked");
                Get.to(()=>TherapeuticexaminationsScreen());
              },
              child: Container(
                width: 338.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: Color(0xffDBDBDB),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Text(
                        Therapeuticexaminations.tr,
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Color(0xff49768C),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),


 bottomNavigationBar:Container(decoration: BoxDecoration(
     borderRadius: BorderRadius.circular(20)
 ),margin:EdgeInsets.only(bottom: 20,left: 20,right: 20
 ),child: CurvedBottomNavBarUser(profileIcon: "assets/images/profileIconActive.png",)),
    );
  }


}