import 'package:beiti_care/ui/auth/change_password/change_password_screen.dart';
import 'package:beiti_care/ui/auth/change_password/controller/change_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../services/translation_key.dart';
import '../otp/otp_screen.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
          children: [
            SizedBox(height: 40.h),
            Image.asset('assets/images/forgetpassword.png', height: 230.99.h,width: 310.w,),
            SizedBox(height: 40.h),
            Text(forgetPassword.tr,
            style: TextStyle(
              color: Color(0xff49768C),
              fontSize: 20.sp,
              fontWeight: FontWeight.bold
            ),),
            Container(
              width: 274.w,
              height: 48.h,
              child: Text(enterPhoneNumberForOTP.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff8B8B8B),
                fontWeight: FontWeight.w400,
                fontSize: 16
              ),),
            ),
            SizedBox(height: 50.h),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(phone_Number.tr,style: TextStyle(color: Color(0xff8B8B8B),fontSize: 18.sp,fontWeight: FontWeight.w700),),
                ],
              ),
            ),
            Container(
              height: 50.h,
              width: 338.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Color(0xff8B8B8B),
                  width: 1.5,
                ),
              ),
              child: IntlPhoneField(
                // controller: controller.phoneNumberController,
                // validator: (v){controller.validateNotEmpty(controller.phoneNumberController.text.trim());},
                textAlign: TextAlign.left,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: phone_Number.tr,
                  hintStyle: TextStyle(color: Color(0xff8B8B8B),fontWeight: FontWeight.w400,fontSize: 14 ), // توسيط النص
                  // ضبط المسافات الداخلية
                ),
                dropdownIcon: Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                initialCountryCode: 'EG', // 🇪🇬
                disableLengthCheck: true, // إلغاء العداد
                onChanged: (phone) {
                  print(phone.completeNumber); // الرقم بالكامل مع الكود
                },
              ),
            ),
            SizedBox(height: 40.h),
            Container(
              width: 338.w,
              height: 56.h,
              child: ElevatedButton(
                onPressed: () {
                  // controller.submitForm();
                  Get.off(()=>OtpScreen());
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffB93439),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 15.h),

                ),
                child: Text(sendOTP.tr, style: TextStyle(fontSize: 20.sp, color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
