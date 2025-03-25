
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../services/translation_key.dart';

class TestresultScreen extends StatelessWidget {
  const TestresultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3EFEF),
      appBar: AppBar(
        leadingWidth: 270.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 25.w,right: 25.w),
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
                Testresults.tr,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFileItem(),
            SizedBox(height: 10.h),
            Spacer(), // This will push the buttons to the bottom
            _buildBottomButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildFileItem() {
    return Container(
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
          Image.asset('assets/images/pdf.png', width: 30.w, height: 30.h),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              Bloodtestresult.tr,
              style: TextStyle(
                fontSize: 18.sp,
                color: Color(0xff49768C),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          IconButton(onPressed: (){

          }, icon: Image.asset('assets/images/download.png'))
        ],
      ),
    );
  }

  Widget _buildBottomButtons(context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              _showConsultationDialog(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffB93439),
              padding: EdgeInsets.symmetric(vertical: 15.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              Requestaconsultation.tr,
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff49768C),
              padding: EdgeInsets.symmetric(vertical: 15.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              Keepencryptedcopies.tr,
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
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