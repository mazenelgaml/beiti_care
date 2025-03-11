import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoreScreen extends StatelessWidget {


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
                "More",
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
                  "About",
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
                    "assets/images/contactUs.png",
                    width: 20.w,
                    height: 20.h,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: Text(
                      "Contact Us",
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
                    "assets/images/withdraw.png",
                    width: 20.w,
                    height: 20.h,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: Text(
                      "Withdraw History",
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
                    "assets/images/helps.png",
                    width: 20.w,
                    height: 20.h,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: Text(
                      "Help",
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
                    "assets/images/language.png",
                    width: 20.w,
                    height: 20.h,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: Text(
                      "Language",
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
                    "assets/images/privacyPolicy.png",
                    width: 20.w,
                    height: 20.h,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: Text(
                      "PolicyPrivacy",
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
                    "assets/images/logOut.png",
                    width: 20.w,
                    height: 20.h,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: Text(
                      "Log out",
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
          ],
        ),
      ),
    );
  }
}
