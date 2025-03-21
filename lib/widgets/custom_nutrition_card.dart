import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NutritionCard extends StatelessWidget {
  final int rating;
  const NutritionCard({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/boy.png'),
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ahmed Mohamed',
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.bold,color: Colors.black),
                    ),
                    Row(
                      children: List.generate(
                        rating,
                            (index) => Icon(Icons.star, color: Color(0xffE07800), size: 16),
                      ),
                    )
                  ],
                )
               ,
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(

                  children: [
                   Image(image: AssetImage("assets/images/coins2.png"),width:17.w ,height: 16.h,),
                    SizedBox(width: 5.w),
                    Text('35 D.A',style: TextStyle(color: Color(0xffC69100),fontSize: 10.sp,fontWeight: FontWeight.w500),),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.access_time, color: Colors.black,size: 17,),
                    SizedBox(width: 5.w),
                    Text('40-60 Minutes',style: TextStyle(color: Colors.black,fontSize: 10.sp,fontWeight: FontWeight.w500)),
                  ],
                )
              ],
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'Number of cases served 22',
                style: TextStyle(color: Color(0xffB93439), fontWeight: FontWeight.w500,fontSize: 14.sp),
              ),
            ),
            SizedBox(height: 10.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffB93439),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
                onPressed: () {},
                child: Text(
                  'Book Now',
                  style: TextStyle(fontSize: 18.sp, color: Colors.white,fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}