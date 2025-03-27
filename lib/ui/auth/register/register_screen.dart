import 'package:beiti_care/ui/auth/Log_in/log_in_screen.dart';
import 'package:beiti_care/ui/auth/register/widget/add_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../services/translation_key.dart';
import 'controller/sign_up_controller.dart';


class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isClient = true;
  int selectedIndex = -1;
  String? selectedSpecialty;



  @override
  Widget build(BuildContext context) {

    return GetBuilder(
        init: SignupController(),
        builder: (SignupController controller) {
          return controller.isLoading?Scaffold(body: Center(child: CircularProgressIndicator(),),):Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF3EFEF),
        leading: null,
        automaticallyImplyLeading: false,
        centerTitle: true,
        toolbarHeight: 120.h,
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
            SizedBox(height: 15.h),
            Image.asset('assets/images/register.png', height: 230.99.h,width: 310.w,),
            SizedBox(height: 15.h),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => isClient = true),
                    child: Container(
                      height: 44.h,
                      decoration: BoxDecoration(
                        color: isClient ? Color(0xffB93439) : Color(0xffCECECE),
                      ),
                      child: Center(
                        child: Text(
                          client.tr,
                          style: TextStyle(
                            color: isClient ? Colors.white : Color(0xff8B8B8B),
                            fontWeight: FontWeight.w700,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => isClient = false),
                    child: Container(
                      height: 44.h,
                      decoration: BoxDecoration(
                        color: !isClient ? Color(0xffB93439) : Color(0xffCECECE),
                      ),
                      child: Center(
                        child: Text(
                          nurse.tr,
                          style: TextStyle(
                            color: !isClient ? Colors.white : Color(0xff8B8B8B),
                            fontWeight: FontWeight.w700,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            if (isClient) Form(
              key: controller.formKey1,
              child: Column(
                children: [
                  Text(
                    register.tr,
                    style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold, color: Color(0xffB93439)),
                  ),
                  SizedBox(height: 15.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,bottom: 5,right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(Full_Name.tr,style: TextStyle(color: Color(0xff8B8B8B),fontSize: 18.sp,fontWeight: FontWeight.w700),),
                      ],
                    ),
                  ),
                  Container(
                    width: 338.w,
                    height: 50.h,
                    child: TextFormField(
                      controller: controller.nameController,
                      validator: (v){controller.validateName(v);},
                      decoration: InputDecoration(
                        hintText: Full_Name.tr,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,bottom: 5,right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(email.tr,style: TextStyle(color: Color(0xff8B8B8B),fontSize: 18.sp,fontWeight: FontWeight.w700),),
                      ],
                    ),
                  ),
                  Container(
                    width: 338.w,
                    height: 50.h,
                    child: TextFormField(
              keyboardType: TextInputType.emailAddress,
                      controller: controller.emailController,
                      validator: (v){controller.validateEmail(v);},
                      decoration: InputDecoration(
                        hintText: email.tr,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,bottom: 5,right: 20.0),
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
                      controller: controller.phoneNumberController,
                      validator: (v){controller.validateNotEmpty(controller.phoneNumberController.text.trim());},
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
                  SizedBox(height: 10.h),
                  Container(
                    width: 338.w,
                    child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween
                      ,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(Age.tr,style: TextStyle(color: Color(0xff8B8B8B),fontSize: 18.sp,fontWeight: FontWeight.w700),),
                                ],
                              ),
                            ),
                            Container(
                              width: 159.w,
                              height: 50.h,
                              child: TextFormField(
                                controller: controller.ageController,
                                validator: (v){controller.validateNotEmpty(v);},
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: Age.tr,
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
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(Years.tr,style: TextStyle(color: Color(0xff8B8B8B),fontSize: 18.sp,fontWeight: FontWeight.w700),),
                                ],
                              ),
                            ),
                            Container(
                              width: 159.w,
                              height: 50.h,
                              child: TextFormField(
                                controller: controller.yearsController,
                                validator: (v){controller.validateNotEmpty(v);},
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: Years.tr,
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
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Container(
                    width: 338.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        genderButton(1, Icons.male, Male.tr),
                        SizedBox(width: 10),
                        genderButton(0, Icons.female, Feminine.tr),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,bottom: 5,right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(password.tr,style: TextStyle(color: Color(0xff8B8B8B),fontSize: 18.sp,fontWeight: FontWeight.w700),),
                      ],
                    ),
                  ),
                  Container(
                    width: 338.w,
                    height: 50.h,
                    child: TextFormField(
                      obscureText: true,
                      controller: controller.passwordController,
                      validator: (v){controller.validatePassword(v);},
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
                  SizedBox(height: 10.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,bottom: 5,right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(confirm_Password.tr,style: TextStyle(color: Color(0xff8B8B8B),fontSize: 18.sp,fontWeight: FontWeight.w700),),
                      ],
                    ),
                  ),
                  Container(
                    width: 338.w,
                    height: 50.h,
                    child: TextFormField(
                      obscureText: true,
                      controller: controller.confirmPasswordController,
                      validator: (v){controller.validateConfirmPassword(v);},
                      decoration: InputDecoration(
                        hintText: confirm_Password.tr,
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
                  Container(
                    width: 338.w,
                    height: 56.h,
                    child: ElevatedButton(
                      onPressed: () {
                        if (controller.formKey1.currentState!.validate())
                        {
                          controller.signUp1(context, selectedGender);
                        }
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffB93439),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 15.h),

                      ),
                      child: Text(register.tr, style: TextStyle(fontSize: 20.sp, color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ) else
              Form(
              key: controller.formKey2,
              child: Column(
                children: [
                  Text(
                    register.tr,
                    style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold, color: Color(0xffB93439)),
                  ),
                  SizedBox(height: 15.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,bottom: 5,right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(Full_Name.tr,style: TextStyle(color: Color(0xff8B8B8B),fontSize: 18.sp,fontWeight: FontWeight.w700),),
                      ],
                    ),
                  ),
                  Container(
                    width: 338.w,
                    height: 50.h,
                    child: TextFormField(

                       controller: controller.nameController,
                      validator: (v){controller.validateName(v);},

                      decoration: InputDecoration(
                        hintText: Full_Name.tr,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,bottom: 5,right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(email.tr,style: TextStyle(color: Color(0xff8B8B8B),fontSize: 18.sp,fontWeight: FontWeight.w700),),
                      ],
                    ),
                  ),
                  Container(
                    width: 338.w,
                    height: 50.h,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: controller.emailController,
                      validator: (v){controller.validateEmail(v);},

                      decoration: InputDecoration(
                        hintText: email.tr,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,bottom: 5,right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(image.tr,style: TextStyle(color: Color(0xff8B8B8B),fontSize: 18.sp,fontWeight: FontWeight.w700),),
                      ],
                    ),
                  ),
                  ImagePickerWidget(),
                  Container(
                    width: 338.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(Pleaseuploadyourmedicalqualificationcertificate.tr,textAlign: TextAlign.left,style: TextStyle(
                          color: Color(0xff8B8B8B),
                          fontSize: 12,
                          fontWeight: FontWeight.w500
                        ),),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,bottom: 5,right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(Experience.tr,style: TextStyle(color: Color(0xff8B8B8B),fontSize: 18.sp,fontWeight: FontWeight.w700),),
                      ],
                    ),
                  ),
                  Container(
                    width: 338.w,
                    height: 50.h,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: controller.experienceController,
                      validator: (v){controller.validateNotEmpty(v);},

                      decoration: InputDecoration(
                        hintText: Experience.tr,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,bottom: 5,right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(Specialty.tr,style: TextStyle(color: Color(0xff8B8B8B),fontSize: 18.sp,fontWeight: FontWeight.w700),),
                      ],
                    ),
                  ),

             Container(
               width: 338.w,
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(10),
                 border: Border.all(
                   color: Color(0xff8B8B8B),
                   width: 1.5
                 )
               ),
               child: Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 10),
                 child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedSpecialty,
                      hint: Text(
                        Specialty.tr,
                        style: TextStyle(color: Color(0xff8B8B8B),fontSize: 16.sp,fontWeight: FontWeight.w400),
                      ),
                      isExpanded: true,
                      icon: Icon(Icons.arrow_drop_down, color: Color(0xff8B8B8B),),
                      style: TextStyle(color: Color(0xff8B8B8B), fontSize: 16.sp,fontWeight: FontWeight.bold),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedSpecialty = newValue;
                        });
                      },
                      items: controller.chooseService?.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
               ),
             ),

                  SizedBox(height: 10.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,bottom: 5,right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(Location.tr,style: TextStyle(color: Color(0xff8B8B8B),fontSize: 18.sp,fontWeight: FontWeight.w700),),
                      ],
                    ),
                  ),
                  Container(
                    width: 338.w,
                    height: 50.h,
                    child: TextFormField(
                      controller: controller.locationController,
                      validator: (v){controller.validateNotEmpty(v);},

                      decoration: InputDecoration(
                        hintText: Location.tr,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,bottom: 5,right: 20.0),
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
                      controller: controller.phoneNumberController,
                      validator: (v) {
                        return controller.validateNotEmpty(controller.phoneNumberController.text.trim());
                      },
                      keyboardType: TextInputType.phone,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: phone_Number.tr,
                        hintStyle: TextStyle(
                          color: Color(0xff8B8B8B),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                      ),
                      dropdownIcon: Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                      initialCountryCode: 'EG',
                      disableLengthCheck: true,
                      onChanged: (phone) {
                        controller.setPhoneNumber(phone.completeNumber);
                      },
                    )

                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,bottom: 5,right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(ID_Card.tr,style: TextStyle(color: Color(0xff8B8B8B),fontSize: 18.sp,fontWeight: FontWeight.w700),),
                      ],
                    ),
                  ),
                  Container(
                    width: 338.w,
                    height: 50.h,
                    child: TextFormField(
                      controller: controller.idCardController,
                      validator: (v){controller.validateNotEmpty(v);},

                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: ID_Card.tr,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,bottom: 5,right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(password.tr,style: TextStyle(color: Color(0xff8B8B8B),fontSize: 18.sp,fontWeight: FontWeight.w700),),
                      ],
                    ),
                  ),
                  Container(
                    width: 338.w,
                    height: 50.h,
                    child: TextFormField(
                      obscureText: true,
                      controller: controller.passwordController,
                      validator: (v){controller.validatePassword(v);},


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
                  SizedBox(height: 10.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,bottom: 5,right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(confirm_Password.tr,style: TextStyle(color: Color(0xff8B8B8B),fontSize: 18.sp,fontWeight: FontWeight.w700),),
                      ],
                    ),
                  ),
                  Container(
                    width: 338.w,
                    height: 50.h,
                    child: TextFormField(
                      obscureText: true,
                      controller: controller.confirmPasswordController,
                      validator: (v){controller.validateConfirmPassword(v);},


                      decoration: InputDecoration(
                        hintText: confirm_Password.tr,
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
                  Container(
                    width: 338.w,
                    height: 56.h,
                    child: ElevatedButton(
                      onPressed: () {
                        if (controller.formKey2.currentState!.validate())
                        {
                          controller.signUp(context, selectedSpecialty??"");
                        }
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffB93439),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 15.h),

                      ),
                      child: Text(register.tr, style: TextStyle(fontSize: 20.sp, color: Colors.white)),
                    ),
                  ),
                ],),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AlreadyHaveAnAccount.tr,style: TextStyle(
                    color: Color(0xff8B8B8B),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600
                ),),
                GestureDetector(
                  onTap: () {
                    Get.off(()=>LoginScreen());
                  },
                  child: Text(logIn.tr, style: TextStyle(color: Color(0xffB93439), fontWeight: FontWeight.w600,fontSize: 18.sp)),
                ),
              ],
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );});
  }
   // لا شيء مختار بالبداية
  String selectedGender = ""; // لتخزين الجنس المختار

  Widget genderButton(int index, IconData icon, String text) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          if(text=="Male"||text=="ذكر"){
            selectedGender="Male";
          }else{
            selectedGender="Female";
          }// تخزين القيمة المختارة
        });
      },
      child: Container(
        width: 150,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey, width: 1.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isSelected ? Icons.check_circle : Icons.circle_outlined,
              color: Color(0xff8B8B8B),
            ),
            SizedBox(width: 3),
            Icon(icon, color: Colors.grey, size: 30),
            SizedBox(width: 3),
            Text(
              text,
              style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

}

