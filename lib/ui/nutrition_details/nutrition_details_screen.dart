import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_nurse_card.dart';
import '../../widgets/custom_review_card.dart';


class NutritionDetailsScreen extends StatelessWidget {
  final List<String> reviews = [
    "A highly experienced nurse who knows what he is doing and does it perfectly.",
    "A highly experienced nurse who knows what he is doing and does it perfectly.",
    "A highly experienced nurse who knows what he is doing and does it perfectly.",
    "A highly experienced nurse who knows what he is doing and does it perfectly.",
  ];

   NutritionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3EFEF),
      appBar: AppBar(

        leadingWidth: 350.w, // توسيع المساحة الخاصة بـ leading
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w,right: 16.w), // دفع المحتوى ناحية اليمين
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
                'Nutrition and Dietary Assessment',
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
        backgroundColor: Color(0xFFF3EFEF),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NurseCard(rating: 4,),
            SizedBox(height: 16),
            Text(
              "Customer reviews",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600,  color: Color(0xffB93439),),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: reviews.length,
                itemBuilder: (context, index) {
                  return ReviewCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}




