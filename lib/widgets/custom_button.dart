import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final String name;
  final double borderRaduis;
  final Color btnColor;
  const CustomButton({super.key, required this.onPressed, required this.name, required this.borderRaduis, required this.btnColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 338.w,
      height: 56.h,
      child: ElevatedButton(
        onPressed: onPressed(),

        style: ElevatedButton.styleFrom(
          backgroundColor: btnColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRaduis),
          ),
          padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 15.h),

        ),
        child: Text(name, style: TextStyle(fontSize: 20.sp, color: Colors.white)),
      ),
    );
  }
}
