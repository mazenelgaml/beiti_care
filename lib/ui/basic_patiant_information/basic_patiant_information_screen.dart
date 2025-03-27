import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:get/get.dart';
import '../../services/translation_key.dart';
import '../../widgets/custom_button.dart';
import 'controller/basic_patiant_information_controller.dart';

class BasicpatiantinformationScreen extends StatelessWidget {
  const BasicpatiantinformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: BasicPatientInformationController(),
    builder: (BasicPatientInformationController controller) {
    return controller.isLoading?Scaffold(body: Center(child: CircularProgressIndicator(),),): Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 300.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 23.w,right: 23.w),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  width: 24.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                    color: Color(0xffB93439),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
              SizedBox(width: 5.w),
              Text(
                Basicpatientinformation.tr,
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
              padding: const EdgeInsets.all(22.0),
              child: Row(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        ClipOval(
                          child: controller.selectedImage != null
                              ? Image.file(
                            controller.selectedImage!,
                            width: 70.w,
                            height: 70.h,
                            fit: BoxFit.cover,
                          )
                              : (controller.userByIdModel?.user?.image == null || controller.userByIdModel?.user?.image == "")
                              ? Image.asset(
                            "assets/images/pngtree-avatar-icon-profile-icon-member-login-vector-isolated-png-image_1978396.jpg",
                            width: 70.w,
                            height: 70.h,
                            fit: BoxFit.cover,
                          )
                              : Image.network(
                            controller.userByIdModel?.user?.image??"",
                            width: 70.w,
                            height: 70.h,
                            fit: BoxFit.cover,
                          ),
                        ),

                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () {
                              print(EditProfilePicture.tr);
                            },
                            child: Container(
                              width: 25.w,
                              height: 25.w,

                              alignment: Alignment.center,
                              child: Image.asset(
                                'assets/images/cameraicon.png', // استبدل بالمسار الفعلي لصورتك
                                width: 25.w,
                                height: 25.h,
                                fit: BoxFit.contain,
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
                          controller.userByIdModel?.user?.userName??"",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff000000),
                          ),
                        ),
                        Text(
                          controller.userByIdModel?.user?.email??"",
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
                    padding: const EdgeInsets.only(left: 20.0, bottom: 5,right:  20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          FullName.tr,
                          style: TextStyle(
                            color: Color(0xff8B8B8B),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h,),
                  Container(
                    width: 338.w,
                    height: 50.h,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: FullName.tr,
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
                  SizedBox(height: 16.h,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 5,right:  20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Email.tr,
                          style: TextStyle(
                            color: Color(0xff8B8B8B),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h,),
                  Container(
                    width: 338.w,
                    height: 50.h,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: Email.tr,
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
                  SizedBox(height: 16.h,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 5,right:  20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          PhoneNumber.tr,
                          style: TextStyle(
                            color: Color(0xff8B8B8B),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h,),

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
                        hintText: PhoneNumber.tr,
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
                  SizedBox(height: 16.h,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment:CrossAxisAlignment.start ,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Row(

                              children: [
                                Text(
                                  Age.tr,
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
                          Center(
                            child: Container(
                              width: 150.w,
                              height: 50.h,
                              child: TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: Age.tr,
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
                          ),
                        ],
                      ),


                      Column(
                        crossAxisAlignment:CrossAxisAlignment.start ,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only( bottom: 5),
                            child: Row(

                              children: [
                                Text(
                                  Years.tr,
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

                            width: 150.w,
                            height: 50.h,
                            child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: Years.tr,
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
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 16.h,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 5,right:  20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          IDCard.tr,
                          style: TextStyle(
                            color: Color(0xff8B8B8B),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h,),
                  Container(
                    width: 338.w,
                    height: 50.h,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: IDCard.tr,
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

                  SizedBox(height: 16.h,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 5,right: 20.0 ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Healthnumber.tr,
                          style: TextStyle(
                            color: Color(0xff8B8B8B),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h,),
                  Container(
                    width: 338.w,
                    height: 50.h,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: Healthnumber.tr,
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

                  SizedBox(height: 16.h,),
                  Row(
                    children: [
                      SizedBox(width: 16.w,),
                      Container(
                        width: 162.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical:10.h ),
                        child: Row(
                          children: [
                            Image.asset('assets/images/Group 76118.png', width: 30.w, height: 30.h),
                            Image.asset('assets/images/male.png', width: 30.w, height: 30.h),
                            SizedBox(width: 5.w),
                            Expanded(
                              child: Text(
                                Male.tr,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Color(0xff8B8B8B),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(width: 16.w,),
                      Container(
                        width: 165.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical:10.h ),
                        child: Row(
                          children: [
                            Image.asset('assets/images/Group 76118.png', width: 30.w, height: 30.h),
                            Image.asset('assets/images/female.png', width: 30.w, height: 30.h),
                            SizedBox(width: 5.w),
                            Expanded(
                              child: Text(
                                Feminine.tr,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Color(0xff8B8B8B),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Bloodtype.tr,
                          style: TextStyle(
                            color: Color(0xff8B8B8B),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h,),
                  Container(
                    width: 338.w,
                    height: 50.h,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: Bloodtype.tr,
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
                  SizedBox(height: 16.h,),
                  Container(
                    padding: EdgeInsets.only(right: 185.w),
                    child: Text(Generalhealthstatus.tr,style: TextStyle(color: Color(0xffB93439),fontSize: 16.sp,fontWeight: FontWeight.w500),),
                  ),
                  SizedBox(height: 16.h,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Chronicdiseases.tr,
                          style: TextStyle(
                            color: Color(0xff8B8B8B),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h,),
                  Container(
                    width: 338.w,
                    height: 50.h,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: Chronicdiseases.tr,
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
                  SizedBox(height: 16.h,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Allergytomedicationsorfoods.tr,
                          style: TextStyle(
                            color: Color(0xff8B8B8B),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h,),
                  Container(
                    width: 338.w,
                    height: 50.h,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: Allergytomedicationsorfoods.tr,
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
                  SizedBox(height: 16.h,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Medicationscurrently.tr,
                          style: TextStyle(
                            color: Color(0xff8B8B8B),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h,),
                  Container(
                    width: 338.w,
                    height: 50.h,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: Medicationscurrently.tr,
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
                  SizedBox(height: 16.h,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Lastdateforexamination.tr,
                          style: TextStyle(
                            color: Color(0xff8B8B8B),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h,),
                  Container(
                    width: 338.w,
                    height: 50.h,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: Lastdateforexamination.tr,
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
                  SizedBox(height: 16.h,),
                  Container(
                    padding: EdgeInsets.only(right: 195.w),
                    child: Text(Stateofemergency.tr,style: TextStyle(color: Color(0xffB93439),fontSize: 16.sp,fontWeight: FontWeight.w500),),
                  ),
                  SizedBox(height: 16.h,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          nearestcontactperson.tr,
                          style: TextStyle(
                            color: Color(0xff8B8B8B),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h,),
                  Container(
                    width: 338.w,
                    height: 50.h,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: nearestcontactperson.tr,
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
                  SizedBox(height: 16.h,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Dateoflasthospitaladmission.tr,
                          style: TextStyle(
                            color: Color(0xff8B8B8B),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h,),
                  Container(
                    width: 338.w,
                    height: 50.h,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: Dateoflasthospitaladmission.tr,
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
                  SizedBox(height: 16.h,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Havinganyprevioussurgeries.tr,
                          style: TextStyle(
                            color: Color(0xff8B8B8B),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h,),
                  Container(
                    width: 338.w,
                    height: 50.h,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: Havinganyprevioussurgeries.tr,
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
                  SizedBox(height: 16.h,),
                  Container(
                    padding: EdgeInsets.only(right: 85.w),
                    child: Text(Healthrecordandmedicalhistory.tr,style: TextStyle(color: Color(0xffB93439),fontSize: 16.sp,fontWeight: FontWeight.w500),),
                  ),
                  SizedBox(height: 16.h,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Previouslaboratorytestsandtheirdates.tr,
                          style: TextStyle(
                            color: Color(0xff8B8B8B),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h,),
                  Container(
                    width: 338.w,
                    height: 50.h,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: Previouslaboratorytestsandtheirdates.tr,
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
                  SizedBox(height: 16.h,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Medicalreportsrumorsandtests.tr,
                          style: TextStyle(
                            color: Color(0xff8B8B8B),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h,),
                  Container(
                    width: 338.w,
                    height: 50.h,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText:  Medicalreportsrumorsandtests.tr,
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
                  SizedBox(height: 16.h,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          MedicalDiagnosesandTreatmentHistory.tr,
                          style: TextStyle(
                            color: Color(0xff8B8B8B),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h,),
                  Container(
                    width: 338.w,
                    height: 50.h,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: MedicalDiagnosesandTreatmentHistory.tr,
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
                  SizedBox(height: 16.h,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Vaccinationsreceivedanddates.tr,
                          style: TextStyle(
                            color: Color(0xff8B8B8B),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h,),
                  Container(
                    width: 338.w,
                    height: 50.h,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: Vaccinationsreceivedanddates.tr,
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
                  SizedBox(height: 16.h,),
                  Container(
                    padding: EdgeInsets.only(right: 60.w),
                    child: Text(Previousmedicationsandtreatments.tr,style: TextStyle(color: Color(0xffB93439),fontSize: 16.sp,fontWeight: FontWeight.w500),),
                  ),
                  SizedBox(height: 16.h,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Listofmedicationsusedinthelastmonths.tr,
                          style: TextStyle(
                            color: Color(0xff8B8B8B),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h,),
                  Container(
                    width: 338.w,
                    height: 70.h,
                    child: TextFormField(
                      maxLines: 2,
                      decoration: InputDecoration(
                        hintText: Listofmedicationsusedinthelastmonths.tr,
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
                  SizedBox(height: 16.h,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Dosageandregularityoftakingit.tr,
                          style: TextStyle(
                            color: Color(0xff8B8B8B),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h,),
                  Container(
                    width: 338.w,
                    height: 50.h,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText:  Dosageandregularityoftakingit.tr,
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
                  SizedBox(height: 16.h,),
                  Container(
                    padding: EdgeInsets.only(right: 90.w,left: 90.w),
                    child: Text(Familyhealthhistory.tr,style: TextStyle(color: Color(0xffB93439),fontSize: 16.sp,fontWeight: FontWeight.w700),),
                  ),
                  SizedBox(height: 16.h,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, bottom: 5,right:  10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Thepresenceofhereditarydiseasesinthefamilydiabeteshighbloodpressureheartdisease.tr,
                          style: TextStyle(
                            color: Color(0xff8B8B8B),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h,),
                  Container(
                    width: 338.w,
                    child: TextFormField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: Thepresenceofhereditarydiseasesinthefamilydiabeteshighbloodpressureheartdisease.tr,
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
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h,),
                  Container(
                    padding: EdgeInsets.only(right: 25.w,left: 25.w),
                    child: Text(Viewallprevioustestsandanalyses.tr,style: TextStyle(color: Color(0xffB93439),fontSize: 19.sp,fontWeight: FontWeight.w700),),
                  ),
                  SizedBox(height: 16.h,),
                  Padding(
                    padding:  EdgeInsets.only(left: 20.w, bottom: 5,right: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Comparethelastresultsforanygiventest.tr,
                          style: TextStyle(
                            color: Color(0xff8B8B8B),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 15,),
                      Image.asset('assets/images/Group 41300.png',height: 176.h,width: 338.w,)
                    ],
                  ),
                  SizedBox(height: 16.h,),

                  Container(
                    padding: EdgeInsets.only(right: 30.w,left: 30.w),
                    child: Text(Uploadmedicalfilesandxrays.tr,style: TextStyle(color: Color(0xffB93439),fontSize: 19.sp,fontWeight: FontWeight.w700),),
                  ),
                  SizedBox(height: 16.h,),
                  Container(
                    width: 338.w,
                    child: Stack(
                      children: [
                        TextFormField(
                          maxLines: 3,
                          decoration: InputDecoration(
                            hintText: AbilitytouploadXraysMRIsandcardiacscans.tr,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintStyle: TextStyle(
                              color: Color(0xff8B8B8B),
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                            ),
                            contentPadding: EdgeInsets.all(16),
                          ),
                        ),
                        Positioned(
                          bottom: 12.h,
                          right: 15.w,
                          child: Image.asset('assets/images/Group 76106.png'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 5,right:  20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Comments.tr,
                          style: TextStyle(
                            color: Color(0xff8B8B8B),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h,),
                  Container(
                    width: 338.w,
                    child: TextFormField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: "",
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
                    name: Save.tr,
                    borderRadius: 10,
                    btnColor: Color(0xffB93439),
                    textColor: Colors.white,
                  ),
                  SizedBox(height: 8.h,),
                  CustomButton(
                    onPressed: () {},
                    name: Cancel.tr,
                    borderRadius: 10,
                    btnColor: Color(0xff49768C),
                    textColor: Colors.white,
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );});
  }
}