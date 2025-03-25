import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../services/translation_key.dart';
import '../../widgets/custom_buttom_nav_bar.dart';
import '../../widgets/custom_button_nav_bar_user.dart';

class MoreUserScreen extends StatefulWidget {
  const MoreUserScreen({super.key});

  @override
  _MoreUserScreenState createState() => _MoreUserScreenState();
}

class _MoreUserScreenState extends State<MoreUserScreen> {
  int _selectedIndex = 0;

  List<String> get notifications => [
    About1.tr,
    ContactUs.tr,
    Help.tr,
    Language.tr,
    PolicyPrivacy.tr,
    Logout.tr,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3EFEF),
      appBar: AppBar(
        leadingWidth: 270.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 25.w),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 30.w,
                  height: 30.h,
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
              SizedBox(width: 10.w),
              Text(
                More1.tr,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xffB93439),
                ),
              ),
            ],
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Color(0xffF3EFEF),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: notifications.isEmpty
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/Group 39920.png',
                width: 500.w,
                height: 300.h,
              ),
              SizedBox(height: 20.h),
              Text(
                Nonotifications.tr,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        )
            : ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: _buildFileItem(notifications[index], context),
            );
          },
        ),
      ),


      bottomNavigationBar:Container(decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)
      ),margin:EdgeInsets.only(bottom: 20,left: 20,right: 20
      ),child: CurvedBottomNavBarUser(moreIcon: Color(0xffB93439),)),
    );
  }



  Widget _buildFileItem(String notification, BuildContext context) {
    String imagePath;

    if (notification == About1.tr) {
      imagePath = 'assets/images/about.png';
    } else if (notification == ContactUs.tr) {
      imagePath = 'assets/images/contactUs.png';
    } else if (notification == Help.tr) {
      imagePath = 'assets/images/helps.png';
    } else if (notification == Language.tr) {
      imagePath = 'assets/images/language.png';
    } else if (notification == PolicyPrivacy.tr) {
      imagePath = 'assets/images/privacyPolicy.png';
    } else if (notification == Logout.tr) {
      imagePath = 'assets/images/logOut.png';
    } else {
      imagePath = 'assets/images/default_icon.png';
    }

    return GestureDetector(
      onTap: () {
        if (notification == About1.tr) {
          print("about page");
        } else if (notification == ContactUs.tr) {
          print("Contact Us page");
        } else if (notification == Help.tr) {
          print("Help page");
        } else if (notification == Language.tr) {
          print("Language page");
        } else if (notification == PolicyPrivacy.tr) {
          print("PolicyPrivacy page");
        } else if (notification == Logout.tr) {
          print("Log out");
        }
      },
      child: Container(
        width: 338.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade400),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          children: [
            Image.asset(imagePath, width: 30.w, height: 30.h),
            SizedBox(width: 10.w),
            Expanded(
              child: Text(
                notification,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Color(0xff49768C),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}