import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NutritionAndDietaryAssessmentCardPayment extends StatelessWidget {
  const NutritionAndDietaryAssessmentCardPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xffffffff),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 1,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 45.w,
                  height: 39.h,
                  decoration: BoxDecoration(
                      color: Color(0xffE8E7E7),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Color(0xff8B8B8B),width: 0.4)
                  ),
                  child: Image(image: AssetImage("assets/images/schedule.png"),width: 25.w,height: 25.h,),
                ),
                SizedBox(width: 8.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nutrition and Dietary Assessment",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffB93439),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "Nutrition services",
                      style: TextStyle(color: Color(0xff7D7D7D),fontSize: 11.sp,fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 8.h),
            Text(
              "Specialized nutrition services and comprehensive nutritional assessment",
              style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w500,color: Color(0xff5E5C5C)),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(

                  children: [
                    Image(image: AssetImage("assets/images/coins2.png"),width:17.w ,height: 16.h,),
                    SizedBox(width: 5.w),
                    Text('35 D.A',style: TextStyle(color: Color(0xffC69100),fontSize: 11.sp,fontWeight: FontWeight.w500),),
                  ],
                ),

              ],
            ),


          ],
        ),
      ),
    );
  }
}