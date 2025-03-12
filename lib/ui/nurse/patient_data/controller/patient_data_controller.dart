import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../services/translation_key.dart';

class PatientDataScreen extends StatelessWidget {
  const PatientDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(8.w),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: 24.w,
              height: 24.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xffB93439),
              ),
              child: Icon(Icons.arrow_back, color: Colors.white, size: 18),
            ),
          ),
        ),
        title: Text(
          Patientdata.tr,
          style: TextStyle(
              color: Color(0xffB93439), fontWeight: FontWeight.bold, fontSize: 18.sp),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLabel(Code.tr),
            _buildTextField(Code.tr),

            SizedBox(height: 10.h),
            _buildLabel(Recordashortvideoorphotoswhiledraggingoptional.tr),
            _buildTextField(Recordashortvideoorphotoswhiledraggingoptional.tr, icon: Icons.camera_alt),

            SizedBox(height: 10.h),
            _buildLabel(Pictureofthetubeafterplacingthebarcode.tr),
            _buildTextField(Pictureofthetubeafterplacingthebarcode.tr, icon: Icons.camera_alt),

            SizedBox(height: 15.h),
            Text(Recordwithdrawaldata.tr, style: TextStyle(color: Colors.red, fontSize: 16.sp, fontWeight: FontWeight.w600)),

            SizedBox(height: 10.h),
            _buildLabel(Nursesname.tr),
            _buildTextField(Nursesname.tr),

            SizedBox(height: 10.h),
            _buildLabel(Location.tr),
            _buildTextField(Location.tr),

            SizedBox(height: 10.h),
            _buildLabel(Date.tr),
            _buildTextField(Date.tr, icon: Icons.calendar_today),

            SizedBox(height: 20.h),
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffB93439),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Text(Send.tr, style: TextStyle(color: Colors.white, fontSize: 16.sp)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.h),
      child: Text(text, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.grey.shade700)),
    );
  }

  Widget _buildTextField(String hint, {IconData? icon}) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: icon != null ? Icon(icon, color: Colors.grey) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Color(0xffB93439)),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
      ),
    );
  }
}
