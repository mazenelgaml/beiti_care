import 'package:beiti_care/ui/auth/Log_in/log_in_screen.dart';
import 'package:beiti_care/ui/contact_us/contact_us_screen.dart';
import 'package:beiti_care/ui/nurse/help/help_screen.dart';
import 'package:beiti_care/ui/withdraw_history/withdraw_history_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../services/memory.dart';
import '../../services/translation_key.dart';
import '../../widgets/custom_buttom_nav_bar.dart';
import '../nurse/change_language/change_language_screen.dart';
import '../nurse/policy_privacy/policy_privacy_screen.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w,right: 16.w),
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
                More.tr,
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
      body: Center(
        child: Column(

          children: [
            SizedBox(height: 22.w),
          Container(
          width: 338.w,
          height: 50.h,
          margin: EdgeInsets.symmetric(vertical: 7.h), // تباعد بين العناصر
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xff8B8B8B), width: 1),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Image.asset(
                "assets/images/about.png",
                width: 20.w,
                height: 20.h,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 4.w),
              Expanded(
                child: Text(
                  About.tr,
                  style: TextStyle(
                    color: const Color(0xffB93439),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
            InkWell(
              onTap: (){
                Get.to(()=>ContactUsScreen());
              },
              child: Container(
                width: 338.w,
                height: 50.h,
                margin: EdgeInsets.symmetric(vertical: 7.h), // تباعد بين العناصر
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xff8B8B8B), width: 1),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/contactUs.png",
                      width: 20.w,
                      height: 20.h,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: Text(
                        ContactUs.tr,
                        style: TextStyle(
                          color: const Color(0xffB93439),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Get.to(()=>WithdrawHistoryScreen());
              },
              child: Container(
                width: 338.w,
                height: 50.h,
                margin: EdgeInsets.symmetric(vertical: 7.h), // تباعد بين العناصر
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xff8B8B8B), width: 1),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/withdraw.png",
                      width: 20.w,
                      height: 20.h,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: Text(
                        WithdrawHistory.tr,
                        style: TextStyle(
                          color: const Color(0xffB93439),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Get.to(()=>HelpScreen());
              },
              child: Container(
                width: 338.w,
                height: 50.h,
                margin: EdgeInsets.symmetric(vertical: 7.h), // تباعد بين العناصر
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xff8B8B8B), width: 1),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/helps.png",
                      width: 20.w,
                      height: 20.h,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: Text(
                        Help.tr,
                        style: TextStyle(
                          color: const Color(0xffB93439),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){Get.to(()=>LanguageScreen());},
              child: Container(
                width: 338.w,
                height: 50.h,
                margin: EdgeInsets.symmetric(vertical: 7.h), // تباعد بين العناصر
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xff8B8B8B), width: 1),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/language.png",
                      width: 20.w,
                      height: 20.h,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: Text(
                        Language.tr,
                        style: TextStyle(
                          color: const Color(0xffB93439),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Get.to(()=>PolicyPrivacyScreen());
              },
              child: Container(
                width: 338.w,
                height: 50.h,
                margin: EdgeInsets.symmetric(vertical: 7.h), // تباعد بين العناصر
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xff8B8B8B), width: 1),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/privacyPolicy.png",
                      width: 20.w,
                      height: 20.h,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: Text(
                        PolicyPrivacy.tr,
                        style: TextStyle(
                          color: const Color(0xffB93439),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Get.find<CacheHelper>().loggingOut();
                Get.off(()=>LoginScreen());
              },
              child: Container(
                width: 338.w,
                height: 50.h,
                margin: EdgeInsets.symmetric(vertical: 7.h), // تباعد بين العناصر
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xff8B8B8B), width: 1),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/logOut.png",
                      width: 20.w,
                      height: 20.h,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: Text(
                        Logout.tr,
                        style: TextStyle(
                          color: const Color(0xffB93439),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
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
      bottomNavigationBar: Container(decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)
      ),margin:EdgeInsets.only(bottom: 20,left: 20,right: 20
      ),child: CurvedBottomNavBar(moreIcon: Color(0xffB93439),)),
    );
  }
}
