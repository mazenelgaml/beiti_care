import 'dart:async';

import 'package:beiti_care/ui/auth/change_password/change_password_screen.dart';
import 'package:beiti_care/ui/auth/change_password/controller/change_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  int _secondsRemaining = 120;
 // Set initial time (2 minutes)
  late Timer _timer;

  bool _isResendActive = false;

  String otpCode = '';

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _secondsRemaining = 120; // Reset timer
    _isResendActive = false;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        setState(() {
          _isResendActive = true;
          _timer.cancel();
        });
      }
    });
  }

  String get formattedTime {
    int minutes = _secondsRemaining ~/ 60;
    int seconds = _secondsRemaining % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void onResendTap() {
    if (_isResendActive) {
      startTimer();
    }
  }

  void verifyOtp() {
    if (otpCode.length == 6) {
      // Handle OTP verification logic here
      print("Entered OTP: $otpCode");
    } else {
      print("Please enter a 6-digit OTP.");
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF3EFEF),
        leading: null,
        centerTitle: true,
        toolbarHeight: 150.h,
        title: Container(
          width: 122.w,
          height: 117.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
          child: Image.asset("assets/images/logo.png", fit: BoxFit.fill),
        ),
      ),
      backgroundColor: Color(0xffF3EFEF),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30.h),
            Image.asset('assets/images/otp.png', height: 230.99.h,width: 310.w,),
            SizedBox(height: 30.h),
            Text("OTP Verification",
              style: TextStyle(
                  color: Color(0xff49768C),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold
              ),),
            Container(
              width: 300.w,
              height: 48.h,
              child: Text("Please enter the code send to your mobile number ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff8B8B8B),
                    fontWeight: FontWeight.w400,
                    fontSize: 16
                ),),
            ), Text("01027489652 ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff49768C),
                  fontWeight: FontWeight.w400,
                  fontSize: 16
              ),),
            SizedBox(height: 20.h),
            Text(
              formattedTime,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Pinput(
              length: 6,
              onChanged: (value) {
                setState(() {
                  otpCode = value;
                });
              },
              onCompleted: (value) => verifyOtp(),
              defaultPinTheme: PinTheme(
                width: 50,
                height: 50,
                textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("I didn’t receive any code.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xff838282)            ),),
                TextButton(
                  onPressed: onResendTap,
                  child: Text(
                    "RESEND",
                    style: TextStyle(
                      color: _isResendActive ? Color(0xff49768C) : Color(0xff838282),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            Container(
              width: 338.w,
              height: 56.h,
              child: ElevatedButton(
                onPressed: () {
                  // controller.submitForm();
                  Get.off(()=>ChangePasswordScreen());
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffB93439),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 15.h),

                ),
                child: Text('Submit', style: TextStyle(fontSize: 20.sp, color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
