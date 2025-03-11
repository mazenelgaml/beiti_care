import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../widgets/custom_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 150.w, // توسيع المساحة الخاصة بـ leading
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w), // دفع المحتوى ناحية اليمين
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
                    color: Color(0xffB93439),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center, // لضبط الأيقونة في المنتصف
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
              SizedBox(width: 5.w), // توسيع المسافة بين الأيقونة والنص
              Text(
                "Profile",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffB93439),
                ),
              ),
            ],
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            "assets/images/boy.png",
                            width: 70.w,
                            height: 70.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        // زر التعديل فوق الصورة
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () {
                              print("Edit Profile Picture");
                            },
                            child: Container(
                              width: 25.w,
                              height: 25.w,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black45,
                                    blurRadius: 4,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rania Mohamed",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff000000),
                          ),
                        ),
                        Text(
                          "raniamohamed@gmail.com",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff8B8B8B),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Full Name",
                          style: TextStyle(
                            color: Color(0xff8B8B8B),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 338.w,
                    height: 50.h,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Full Name",
                        hintStyle: TextStyle(
                          color: Color(0xff8B8B8B),
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xff8B8B8B), width: 2),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(
                            color: Color(0xff8B8B8B),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 338.w,
                    height: 50.h,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(
                          color: Color(0xff8B8B8B),
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xff8B8B8B), width: 2),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          " Phone Number",
                          style: TextStyle(
                            color: Color(0xff8B8B8B),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50.h,
                    width: 338.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color(0xff8B8B8B), width: 1.5),
                    ),
                    child: IntlPhoneField(
                      // controller: controller.phoneNumberController,
                      // validator: (v){controller.validateNotEmpty(controller.phoneNumberController.text.trim());},
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Phone Number",
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
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Introduction",
                          style: TextStyle(
                            color: Color(0xff8B8B8B),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 338.w,
                    child: TextFormField(
                      maxLines: 5, // السماح بكتابة أكثر من سطر
                      decoration: InputDecoration(
                        hintText: "Introduction",
                        hintStyle: TextStyle(
                          color: Color(0xff8B8B8B),
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xff8B8B8B), width: 2),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 12.h,
                        ), // تحسين المسافات
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h,),
                  CustomButton(
                    onPressed: () {},
                    name: 'Password',
                    borderRadius: 10,
                    btnColor: Colors.white.withOpacity(0.1),
                    textColor: Colors.black,
                  ),
                  SizedBox(height: 8.h,),
                  CustomButton(
                    onPressed: () {},
                    name: 'Save',
                    borderRadius: 10,
                    btnColor: Color(0xffB93439),
                    textColor: Colors.white,
                  ),
                  SizedBox(height: 8.h,),
                  CustomButton(
                    onPressed: () {},
                    name: 'Cancel',
                    borderRadius: 10,
                    btnColor: Color(0xff263238),
                    textColor: Colors.white,
                  ),
                  SizedBox(height: 8.h,),
                  SizedBox(
                    width: 338.w,
                    height: 60.h,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, // توسيط العناصر
                        children: [
                          Image.asset(
                            "assets/images/Group.png",
                            width: 24.w,
                            height: 24.h,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 8.w), // إضافة مسافة صغيرة بين الأيقونة والنص
                          Text(
                            "Delete Account",
                            style: TextStyle(fontSize: 18.sp, color: Color(0xffB93439)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
