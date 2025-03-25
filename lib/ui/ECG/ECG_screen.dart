import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../services/translation_key.dart';

class EcgScreen extends StatefulWidget {
  const EcgScreen({super.key});

  @override
  State<EcgScreen> createState() => _EcgScreenState();
}

class _EcgScreenState extends State<EcgScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 18.w,right: 18.w),
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
                ECG1.tr,
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.w),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Make the image responsive
                Container(
                  width:338.w ,
                  height: 177.h,// Original image aspect ratio
                  child: Image.asset('assets/images/graph.png', fit: BoxFit.fill),
                ),
                SizedBox(height: 10.h),
                Text(
                  LoremIpsumissimplydummy.tr,
                  style: TextStyle(fontSize: 17.sp, color: Color(0xff8B8B8B)),
                ),
                SizedBox(height: 8.h),
                Text(
                  butalsotheleap.tr,
                  style: TextStyle(fontSize: 17.sp, color: Color(0xff8B8B8B)),
                ),
                SizedBox(height: 15.h),
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
                SizedBox(
                  width: 338.w,
                  height: 60.h,
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showConsultationDialog(BuildContext context) {
    String selectedOption = ""; // تعريف المتغير داخل الدالة
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder( // 👈 استخدام StatefulBuilder لتحديث الحالة داخل الحوار
          builder: (context, setState) {
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
                        'assets/images/logo.png',
                        height: 65.h,
                        width: 68.w,
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
                    SizedBox(height: 15.h),
                    InkWell(
                      onTap: () {
                        setState(() { // 👈 تحديث الحالة داخل StatefulBuilder
                          selectedOption = "Doctor";
                        });
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            selectedOption == "Doctor"
                                ? 'assets/images/7118red.png' // الصورة بعد التحديد
                                : 'assets/images/Group 76118.png', // الصورة العادية
                          ),
                          SizedBox(width: 10.w),
                          Text(Doctor.tr, style: TextStyle(fontSize: 14.sp)),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.h),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedOption = "Nurse";
                        });
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            selectedOption == "Nurse"
                                ? 'assets/images/7118red.png'
                                : 'assets/images/Group 76118.png',
                          ),
                          SizedBox(width: 10.w),
                          Text(Nurse.tr, style: TextStyle(fontSize: 14.sp)),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Center(
                      child: SizedBox(
                        width: 170.w,
                        height: 55.h,
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
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

}