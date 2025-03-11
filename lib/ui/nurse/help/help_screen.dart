import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 30.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    color: Color(0xffB93439),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 16),
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                "Help",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Color(0xffB93439),),
              ),
            ],
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.h),

            // Card Container
            Center(
              child: Container(
                width: 338.w,
                height: 613.h,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey.shade200),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  children: [
                    // Logo
                    Image.asset("assets/images/logo.png", width: 100.w, height: 96.h),

                    SizedBox(height: 12.h),

                    // Illustration
                    Image.asset("assets/images/help.png", width: 231.w, height: 170.h),

                    SizedBox(height: 12.h),

                    // Title
                    Text(
                      "24/7 integrated healthcare services",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500, color: Color(0xff49768C)),
                    ),

                    SizedBox(height: 16.h),

                    // Contact Details
                    _infoRow("Contact Us", "+96582365988"),
                    _infoRow("Location", "Haa Alkhalidia, Jeddah", isBold: true),
                    _infoRow("Email", "Nour@gmail.com"),

                    SizedBox(height: 16.h),

                    // Social Media Icons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _socialIcon(FontAwesomeIcons.facebook),
                        _socialIcon(FontAwesomeIcons.whatsapp),
                        _socialIcon(FontAwesomeIcons.snapchat),
                        _socialIcon(FontAwesomeIcons.instagram),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String title, String value, {bool isBold = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$title  ",
            style: TextStyle(fontWeight:FontWeight.w600,fontSize: 18.sp, color: Color(0xff49768C)),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400, color: Color(0xff49768C)),
          ),
        ],
      ),
    );
  }

  Widget _socialIcon(IconData icon) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Icon(icon, size: 22.sp, color: Colors.blueGrey.shade700),
    );
  }
}
