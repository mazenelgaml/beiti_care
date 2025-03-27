import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../services/translation_key.dart';
import '../../widgets/custom_button.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? selectedService;

  List<String> services = [
    Nutrition.tr,
    Catheterization.tr,
    Consultations.tr,
    Physiotherapy.tr,
    HomeNursing.tr,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Search.tr,
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
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Servicetype.tr,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff5E5C5C),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      width: 338.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedService,
                          hint: Text(
                            Selecttheservice.tr,
                            style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                          ),
                          icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                          isExpanded: true,
                          borderRadius: BorderRadius.circular(12.r),
                          dropdownColor: Colors.white,
                          style: TextStyle(fontSize: 14.sp, color: Colors.black),
                          items: services.map((service) {
                            return DropdownMenuItem<String>(
                              value: service,
                              child: Text(
                                service,
                                style: TextStyle(
                                  color: selectedService == service
                                      ? const Color(0xff1E4F79)
                                      : Colors.black,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedService = value;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      Searchrangekm.tr,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff5E5C5C),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      width: 338.w,
                      height: 50.h,
                      child: TextFormField(
                        onTap: () {},
                        decoration: InputDecoration(
                          hintText: Selecttheservice.tr,
                          hintStyle: TextStyle(
                            fontSize: 14.sp,
                            color: selectedService == null
                                ? Colors.grey
                                : Colors.black,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 16.h),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CustomButton(
              onPressed: () {},
              name: Search.tr,
              borderRadius: 10,
              btnColor: Color(0xffB93439),
              textColor: Color(0xffFFFFFF),
              height: 50.h,
            ),
          ],
        ),
      ),

    );
  }
}
