import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String name;
  final double borderRadius;
  final Color btnColor;
  final Color textColor;
  final double? height;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.name,
    required this.borderRadius,
    required this.btnColor,
    required this.textColor, this.height,

  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 338.w,
      height: height ?? 60.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: btnColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 15.h),
        ),
        child: Text(name, style: TextStyle(fontSize: 18.sp, color: textColor)),
      ),
    );
  }
}
