import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import '../../../services/translation_key.dart';

class PolicyPrivacyScreen extends StatefulWidget {
  const PolicyPrivacyScreen({super.key});

  @override
  _PolicyPrivacyScreenState createState() => _PolicyPrivacyScreenState();
}

class _PolicyPrivacyScreenState extends State<PolicyPrivacyScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 300.w, // توسيع المساحة الخاصة بـ leading
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w), // دفع المحتوى ناحية اليمين
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
                  alignment: Alignment.center, // لضبط الأيقونة في المنتصف
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
              SizedBox(width: 5.w), // توسيع المسافة بين الأيقونة والنص
              Text(
                PolicyPrivacy.tr,
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

      body: Column()
    );
  }


}
