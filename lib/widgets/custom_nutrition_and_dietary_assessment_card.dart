import 'package:beiti_care/ui/nutrition/nutrition_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../services/translation_key.dart';

class NutritionAndDietaryAssessmentCard extends StatelessWidget {
  const NutritionAndDietaryAssessmentCard({super.key});

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
                SizedBox(width: 8),
                Text(
                  NutritionandDietaryAssessment.tr,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffB93439),
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            Text(
              Nutritionservices.tr,
              style: TextStyle(color: Color(0xff7D7D7D),fontSize: 11.sp,fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8),
            Text(
              Specializednutritionservicesandcomprehensivenutritionalassessment.tr,
              style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w500,color: Color(0xff5E5C5C)),
            ),
            SizedBox(height: 10),
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
                SizedBox(width: 16.w),
                Row(
                  children: [
                    Icon(Icons.access_time, color: Colors.black,size: 17,),
                    SizedBox(width: 5.w),
                    Text('40-60 ${Minutes.tr}',style: TextStyle(color: Colors.black,fontSize: 11.sp,fontWeight: FontWeight.w500)),
                  ],
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width:169.w ,
                  height: 40.h,
                  child: ElevatedButton(


                    onPressed: () {
                      Get.to(()=>NutritionScreen());
                    },

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(Findanurse.tr,style: TextStyle(color: Colors.white,fontSize: 12.sp,fontWeight: FontWeight.w500),),
                        Icon(Icons.search,color: Colors.white,),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(

                      backgroundColor: Color(0xff49768C),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),

                    ),
                  ),
                ),
                Container(
                  width: 117.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color:Color(0xff8B8B8B),width: 0.4)
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(ShowMore.tr,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12.sp,color: Color(0xff49768C)),),
                    style: ElevatedButton.styleFrom(

                      backgroundColor: Color(0xffF0F0F0),

                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),

                    ),                ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}