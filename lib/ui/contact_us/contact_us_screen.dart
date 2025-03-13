import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../services/translation_key.dart';
import '../../widgets/custom_button.dart';
import 'controller/contact_us_controller.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ContactUsController(),
    builder: (ContactUsController controller) {
    return controller.isLoading?Scaffold(body: Center(child: CircularProgressIndicator(),),): Scaffold(
    appBar: AppBar(
    leadingWidth: 170.w,
    leading: Padding(
    padding: EdgeInsets.only(left: 16.w),
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
    ContactUs.tr,
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
    body: SingleChildScrollView(
      child: Form(
        key: controller.formKey,
        child: Column(
        children: [
        SizedBox(height: 20.h,),
        Padding(
        padding: const EdgeInsets.only(left: 20.0, bottom: 5),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        Text(
        Full_Name.tr,
        style: TextStyle(
        color: Color(0xff8B8B8B),
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        ),
        ),
        ],
        ),
        ),
        SizedBox(height: 5.h,),
        Container(
        width: 338.w,
        height: 50.h,
        child: TextFormField(
        controller: controller.fullNameController,
        validator: (value){controller.validateNotEmpty(value);},
        decoration: InputDecoration(
        hintText: Full_Name.tr,
        hintStyle: TextStyle(
        color: Color(0xff8B8B8B),
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Color(0xff264EB9), width: 2),
        ),
        ),
        ),
        ),
        SizedBox(height: 12.h,),
        Padding(
        padding: const EdgeInsets.only(left: 20.0, bottom: 5),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        Text(
        Message.tr,
        style: TextStyle(
        color: Color(0xff8B8B8B),
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        ),
        ),
        ],
        ),
        ),
        SizedBox(height: 5.h,),
        Container(
        width: 338.w,
        child: TextFormField(
          controller: controller.messageController,
          validator: (value){controller.validateNotEmpty(value);},
        maxLines: 5, // السماح بكتابة أكثر من سطر
        decoration: InputDecoration(
        hintText: Message.tr,
        hintStyle: TextStyle(
        color: Color(0xff8B8B8B),
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Color(0xff264EB9), width: 2),
        ),
        contentPadding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 12.h,
        ), // تحسين المسافات
        ),
        ),
        ),


        ],
        ),
      ),
    ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(25.0),
        child: CustomButton(
          onPressed: () async{

            controller.submitForm(context);
          },
          name:  Send.tr,
          borderRadius: 10,
          btnColor: Color(0xffB93439),
          textColor: Colors.white,
        ),
      ),
    );
    }
    );
  }
}
