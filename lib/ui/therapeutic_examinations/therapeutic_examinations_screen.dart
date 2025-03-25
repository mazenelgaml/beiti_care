import 'package:beiti_care/ui/genetic_testing/genetic_testing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../services/translation_key.dart';
import '../functional_tests/functional_tests_screen.dart';
import '../imaging_test/imaging_test_screen.dart';
import '../laboratory_tests/laboratory_test_screen.dart';


class TherapeuticexaminationsScreen extends StatefulWidget {
  const TherapeuticexaminationsScreen({super.key});

  @override
  _TherapeuticexaminationsScreenState createState() => _TherapeuticexaminationsScreenState();
}

class _TherapeuticexaminationsScreenState extends State<TherapeuticexaminationsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 300.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 23.w,right: 23.w),
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
                Therapeuticexaminations1.tr,
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
        child: Container(
          padding: EdgeInsets.only(top: 20.h),
          child: Center(
            child: Column(
              children: [

                GestureDetector(
                  onTap: () {
                    print("Laboratory tests clicked");
                    Get.to(LaboratorytestsScreen());

                  },
                  child: Container(
                    width: 338.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: Color(0xffDBDBDB),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      children: [
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Text(
                            Laboratorytests1.tr,
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Color(0xff49768C),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h,),
                GestureDetector(
                  onTap: () {
                    print("Imaging testsclicked");
                    Get.to(ImagingtestScreen());

                  },
                  child: Container(
                    width: 338.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: Color(0xffDBDBDB),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      children: [
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Text(
                            Imagingtests1.tr,
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Color(0xff49768C),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h,),
                GestureDetector(
                  onTap: () {
                    print("Functional tests");
                    Get.to(functionaltestsScreen());

                  },
                  child: Container(
                    width: 338.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: Color(0xffDBDBDB),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      children: [
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Text(
                            Functionaltests.tr,
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Color(0xff49768C),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h,),
                GestureDetector(
                  onTap: () {
                    print("Genetic testing clicked");
                    Get.to(()=>GeneticTestingScreen());
                  },
                  child: Container(
                    width: 338.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: Color(0xffDBDBDB),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      children: [
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Text(
                            Genetictesting.tr,
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Color(0xff49768C),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
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