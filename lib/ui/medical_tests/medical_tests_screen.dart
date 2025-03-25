import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../services/translation_key.dart';

class medicaltestsScreen extends StatelessWidget {
  const medicaltestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3EFEF),
      appBar: AppBar(
        leadingWidth: 270.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 25.w,right: 25.w),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 30.w,
                  height: 30.h,
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
              SizedBox(width: 10.w),
              Text(
                Medicaltests.tr,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xffB93439),
                ),
              ),
            ],
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Color(0xffF3EFEF),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(right: 25.w),
              child: Text(Viewallprevioustestsandanalyses.tr,style: TextStyle(color: Color(0xffB93439),fontSize: 19.sp,fontWeight: FontWeight.w700),),
            ),
            SizedBox(height: 16.h,),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, bottom: 5),
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
            Padding(
              padding: const EdgeInsets.only(left: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('assets/images/Group 41300.png')
                ],
              ),
            ),
            SizedBox(height: 20.h,),
            _buildFileItem(),
            SizedBox(height: 10.h),
            _buildFileItem(),
            SizedBox(height: 10.h),
            _buildFileItem(),
          ],
        ),
      ),
    );
  }

  Widget _buildFileItem() {
    return Container(
      width: 338.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade400),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: [
          Image.asset('assets/images/pdf.png', width: 30.w, height: 30.h),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              Bloodtestresult.tr,
              style: TextStyle(
                fontSize: 18.sp,
                color: Color(0xff49768C),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          IconButton(onPressed: (){

          }, icon: Image.asset('assets/images/download.png'))
        ],
      ),
    );
  }
}