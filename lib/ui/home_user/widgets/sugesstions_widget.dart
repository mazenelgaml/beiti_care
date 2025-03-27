import 'package:beiti_care/ui/suggestions/suggestions_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../services/translation_key.dart';

class CategoryIcons extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {"title": Nutrition.tr},
    {"title":   Catheterization.tr},
    {"title": Consultations.tr},
    {"title": surgery.tr},
    {"title": drug.tr},
    {"title": Medicaltests.tr},
  ];

   CategoryIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.only(left: 15.0.w,right: 15.w,top: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Suggestions.tr,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              InkWell(
                onTap: (){
                  Get.to(()=>SuggestionsScreen());
                },
                child: Text(
                  Seeall.tr,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff8B8B8B),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
    height: 65.h , // Adjust height as needed
    child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: categories.length,
    itemBuilder: (context, index) {
    return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Column(
    children: [
    Container(
      height:45.h,
    width: 45.w,
    decoration: BoxDecoration(
    color: Color(0xffE8E7E7),
    borderRadius: BorderRadius.circular(5),
      border: Border.all(color: Color(0xff8B8B8B),width: 0.5)
    ),
    child: Image(
    image: AssetImage("assets/images/schedule.png"),
    width: 40,
    height: 40,
    ),
    ),
    SizedBox(height: 5),
    Text(
    categories[index]["title"]!,
    style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.w600,color: Color(0xff929292)),
    ),
    ],
    ),
    );
    },
    ),
        )],
    );
  }
}
