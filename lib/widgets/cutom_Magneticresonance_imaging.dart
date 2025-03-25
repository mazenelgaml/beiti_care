import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';
import '../../services/translation_key.dart';

class Magneticresonanceimaging extends StatelessWidget {
  const Magneticresonanceimaging({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 400.w,
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
                Magneticresonanceimaging1.tr,
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
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 10.h),
        child: SingleChildScrollView( // Wrap Column with SingleChildScrollView
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/images (6).png'),
              SizedBox(height: 10.h),
              Text('''${LoremIpsumissimplydummy.tr} ''',style: TextStyle(fontSize: 17.sp,color: Color(0xff8B8B8B)),),
              Text('''${butalsotheleap.tr} ''',style: TextStyle(fontSize: 17.sp,color: Color(0xff8B8B8B)),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Dr / Omar",
                    style: TextStyle(
                      color: Color(0xffB93439),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "${Date.tr} : 2/2/2025",
                    style: TextStyle(
                      color: Color(0xff989494),
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: () {
                      _showConsultationDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffB93439),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      Requestaconsultation.tr,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showConsultationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/c11c701e-a5f2-499b-95e6-18728cd8bde9-removebg-preview 3.png',
                    height: 60.h,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  Doyouwanttorequestaconsultation.tr,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff49768C),
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Image.asset('assets/images/Group 76118.png'),
                    SizedBox(width: 10.w),
                    Text(Doctor.tr, style: TextStyle(fontSize: 14.sp)),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Image.asset('assets/images/Group 76118.png'),
                    SizedBox(width: 10.w),
                    Text(Nurse.tr, style: TextStyle(fontSize: 14.sp)),
                  ],
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff49768C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                    ),
                    child: Text(
                      WhatsApp.tr,
                      style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}