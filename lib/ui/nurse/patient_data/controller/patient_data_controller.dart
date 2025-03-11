import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          "Patient data",
          style: TextStyle(
              color: Color(0xffB93439), fontWeight: FontWeight.bold, fontSize: 18.sp),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLabel("Code"),
            _buildTextField("Code"),

            SizedBox(height: 10.h),
            _buildLabel("Record a short video or photos while dragging (optional)"),
            _buildTextField("Record a short video or photos while dragging (optional)", icon: Icons.camera_alt),

            SizedBox(height: 10.h),
            _buildLabel("Picture of the tube after placing the barcode"),
            _buildTextField("Picture of the tube after placing the barcode", icon: Icons.camera_alt),

            SizedBox(height: 15.h),
            Text("Record withdrawal data", style: TextStyle(color: Colors.red, fontSize: 16.sp, fontWeight: FontWeight.w600)),

            SizedBox(height: 10.h),
            _buildLabel("Nurse's name"),
            _buildTextField("Nurse's name"),

            SizedBox(height: 10.h),
            _buildLabel("Location"),
            _buildTextField("Location"),

            SizedBox(height: 10.h),
            _buildLabel("Date"),
            _buildTextField("Date", icon: Icons.calendar_today),

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
                child: Text("Send", style: TextStyle(color: Colors.white, fontSize: 16.sp)),
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
