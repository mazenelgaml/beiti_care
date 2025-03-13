import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../services/translation_key.dart';
import '../choose_credit_card/choose_credit_card_screen.dart';

class AddCreditCardScreen extends StatelessWidget {
  const AddCreditCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w,right: 16.w),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 24.w,
                  height: 24.h,
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
              SizedBox(width: 5.w),
              Text(
                Wallet.tr,
                style: TextStyle(
                  fontSize: 18.sp,
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
        padding: EdgeInsets.all(16.w),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/logo.png', // ضع الصورة المناسبة هنا
                  width: 116.w,
                  height: 111.h,
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.monetization_on, color: Colors.amber),
                    SizedBox(width: 5.w),
                    Text(
                      '0.00',
                      style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Cash Phone Number', style: TextStyle(fontSize: 14.sp)),
                ),
                SizedBox(height: 5.h),
                Container(
                  height: 50.h,
                  width: 338.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Color(0xff8B8B8B), width: 1.5),
                  ),
                  child: IntlPhoneField(
                    // controller: controller.phoneNumber,
                    // validator: (v){controller.validateNotEmpty(controller.phoneNumber.text);},
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: phone_Number.tr,
                      hintStyle: TextStyle(
                        color: Color(0xff8B8B8B),
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ), // توسيط النص
                      // ضبط المسافات الداخلية
                    ),
                    dropdownIcon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    initialCountryCode: 'EG', // 🇪🇬
                    disableLengthCheck: true, // إلغاء العداد
                    onChanged: (phone) {
                      print(phone.completeNumber); // الرقم بالكامل مع الكود
                    },
                  ),
                ),
                SizedBox(height: 10.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Enter the amount', style: TextStyle(fontSize: 14.sp)),
                ),
                SizedBox(height: 5.h),
                Container(
                  width: 338.w,
                  height: 50.h,
                  child: TextFormField(
                    obscureText: true,
                    // controller: controller.passwordController,
                    // validator: (value){controller.validatePassword(value);},
                    decoration: InputDecoration(
                      hintText: "Enter the amount",
                      hintStyle: TextStyle(
                          color: Color(0xff8B8B8B),
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:BorderSide(color: Color(0xff8B8B8B),width: 2)
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Password', style: TextStyle(fontSize: 14.sp)),
                ),
                SizedBox(height: 5.h),
                Container(
                  width: 338.w,
                  height: 50.h,
                  child: TextFormField(
                    obscureText: true,
                    // controller: controller.passwordController,
                    // validator: (value){controller.validatePassword(value);},
                    decoration: InputDecoration(
                      hintText: password.tr,
                      hintStyle: TextStyle(
                          color: Color(0xff8B8B8B),
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:BorderSide(color: Color(0xff8B8B8B),width: 2)
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      backgroundColor: Color(0xff49768C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    onPressed: () {
                      Get.to(()=>ChooseCreditCardScreen());
                    },
                    child: Text('Send', style: TextStyle(fontSize: 16.sp, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
