import 'package:beiti_care/ui/auth/Log_in/log_in_screen.dart';
import 'package:beiti_care/ui/auth/register/widget/add_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'controller/sign_up_controller.dart';


class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isClient = true;
  int selectedIndex = 0;
  String? selectedSpecialty;

  final List<String> specialties = [
    "Nutrition",
    "Catheterization",
    "Consultations",
    "General Surgery",
    "Pediatrics",
    "Orthopedics",
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SignupController(),
        builder: (SignupController controller) {
          return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF3EFEF),
        leading: null,
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
                          'Client',
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
                          'Nurse',
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
            isClient?Form(
              key: controller.formKey1,
              child: Column(
                children: [
                  Text(
                    'Register',
                    style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold, color: Color(0xffB93439)),
                  ),
                  SizedBox(height: 15.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Full Name",style: TextStyle(color: Color(0xff8B8B8B),fontSize: 18.sp,fontWeight: FontWeight.w700),),
                      ],
                    ),
                  ),
                  Container(
                    width: 338.w,
                    height: 50.h,
                    child: TextFormField(
                      obscureText: true,
                      controller: controller.nameController,
                      validator: (v){controller.validateName(v);},
                      decoration: InputDecoration(
                        hintText: "Full Name",
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
                    padding: const EdgeInsets.only(left: 20.0,bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Email",style: TextStyle(color: Color(0xff8B8B8B),fontSize: 18.sp,fontWeight: FontWeight.w700),),
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
                        hintText: "Email",
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
                    padding: const EdgeInsets.only(left: 20.0,bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(" Phone Number",style: TextStyle(color: Color(0xff8B8B8B),fontSize: 18.sp,fontWeight: FontWeight.w700),),
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
                        hintText: "Phone Number",
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
                                  Text(" Age",style: TextStyle(color: Color(0xff8B8B8B),fontSize: 18.sp,fontWeight: FontWeight.w700),),
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
                                  hintText: "Age",
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
                                  Text(" Years",style: TextStyle(color: Color(0xff8B8B8B),fontSize: 18.sp,fontWeight: FontWeight.w700),),
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
                                  hintText: "Years",
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
                        genderButton(1, Icons.male, "Male"),
                        SizedBox(width: 10),
                        genderButton(0, Icons.female, "Feminine"),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Password",style: TextStyle(color: Color(0xff8B8B8B),fontSize: 18.sp,fontWeight: FontWeight.w700),),
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
                        hintText: "Password",
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
                    padding: const EdgeInsets.only(left: 20.0,bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(" Confirm Password",style: TextStyle(color: Color(0xff8B8B8B),fontSize: 18.sp,fontWeight: FontWeight.w700),),
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
                        hintText: " Confirm Password",
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
                        controller.submitForm();
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffB93439),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 15.h),

                      ),
                      child: Text('Register', style: TextStyle(fontSize: 20.sp, color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ):
            Form(
              child: Column(
                children: [
                  Text(
                    'Register',
                    style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold, color: Color(0xffB93439)),
                  ),
                  SizedBox(height: 15.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Full Name",style: TextStyle(color: Color(0xff8B8B8B),fontSize: 18.sp,fontWeight: FontWeight.w700),),
                      ],
                    ),
                  ),
                  Container(
                    width: 338.w,
                    height: 50.h,
                    child: TextFormField(
                      obscureText: true,
                       controller: controller.nameController,
                      validator: (v){controller.validateName(v);},

                      decoration: InputDecoration(
                        hintText: "Full Name",
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
                    padding: const EdgeInsets.only(left: 20.0,bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Email",style: TextStyle(color: Color(0xff8B8B8B),fontSize: 18.sp,fontWeight: FontWeight.w700),),
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
                        hintText: "Email",
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
                    padding: const EdgeInsets.only(left: 20.0,bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Image",style: TextStyle(color: Color(0xff8B8B8B),fontSize: 18.sp,fontWeight: FontWeight.w700),),
                      ],
                    ),
                  ),
                  ImagePickerWidget(),
                  Container(
                    width: 338.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Please upload your medical qualification certificate.",textAlign: TextAlign.left,style: TextStyle(
                          color: Color(0xff8B8B8B),
                          fontSize: 12,
                          fontWeight: FontWeight.w500
                        ),),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Experience",style: TextStyle(color: Color(0xff8B8B8B),fontSize: 18.sp,fontWeight: FontWeight.w700),),
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
                        hintText: "Experience",
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
                    padding: const EdgeInsets.only(left: 20.0,bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Specialty",style: TextStyle(color: Color(0xff8B8B8B),fontSize: 18.sp,fontWeight: FontWeight.w700),),
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
                        "Specialty",
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
                      items: specialties.map<DropdownMenuItem<String>>((String value) {
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
                    padding: const EdgeInsets.only(left: 20.0,bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Location",style: TextStyle(color: Color(0xff8B8B8B),fontSize: 18.sp,fontWeight: FontWeight.w700),),
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
                        hintText: "Location",
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
                    padding: const EdgeInsets.only(left: 20.0,bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(" Phone Number",style: TextStyle(color: Color(0xff8B8B8B),fontSize: 18.sp,fontWeight: FontWeight.w700),),
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

                      keyboardType: TextInputType.phone,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Phone Number",
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
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("ID Card",style: TextStyle(color: Color(0xff8B8B8B),fontSize: 18.sp,fontWeight: FontWeight.w700),),
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
                        hintText: "ID Card",
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
                    padding: const EdgeInsets.only(left: 20.0,bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Password",style: TextStyle(color: Color(0xff8B8B8B),fontSize: 18.sp,fontWeight: FontWeight.w700),),
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
                        hintText: "Password",
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
                    padding: const EdgeInsets.only(left: 20.0,bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(" Confirm Password",style: TextStyle(color: Color(0xff8B8B8B),fontSize: 18.sp,fontWeight: FontWeight.w700),),
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
                        hintText: " Confirm Password",
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
                        controller.submitForm();
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffB93439),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 15.h),

                      ),
                      child: Text('Register', style: TextStyle(fontSize: 20.sp, color: Colors.white)),
                    ),
                  ),
                ],),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account ? ",style: TextStyle(
                    color: Color(0xff8B8B8B),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600
                ),),
                GestureDetector(
                  onTap: () {
                    Get.off(()=>LoginScreen());
                  },
                  child: Text('Log in', style: TextStyle(color: Color(0xffB93439), fontWeight: FontWeight.w600,fontSize: 18.sp)),
                ),
              ],
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );});
  }
  Widget genderButton(int index, IconData icon, String text) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
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
              color: isSelected ? Color(0xff8B8B8B) : Color(0xff8B8B8B),
            ),
            SizedBox(width: 3),
            Icon(icon, color: Colors.grey,size: 30,),
            SizedBox(width: 3),
            Text(
              text,
              style: TextStyle(color: Colors.grey, fontSize: 16,fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

