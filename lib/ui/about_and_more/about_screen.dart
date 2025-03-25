import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../services/translation_key.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3EFEF),
      appBar: AppBar(
        leadingWidth: 270.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 35.w,right:35.w ),
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
                About1.tr,
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
        padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 129.h,
                width: 338.w,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                Ournursingservices.tr,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffB93439),
                ),
              ),
              SizedBox(height: 10.h),
              ListView.separated(
                separatorBuilder: (context, index){
                  return SizedBox(height:10.h);
                } ,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 12,
                itemBuilder: (context, index) {
                  return Text(
                    Weprovidecomprehensivehealthcareinyourhome.tr,
                    style: TextStyle(color: Color(0xff8B8B8B), fontSize: 18.sp),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}