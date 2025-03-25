import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuggestionCard extends StatelessWidget {
  final String title;

  const SuggestionCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(

      color: Color(0xffffffff),

      shape: RoundedRectangleBorder(
        side: BorderSide(color: Color(0xff8B8B8B),width: 0.4),
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      margin: EdgeInsets.symmetric(vertical: 2.5),
      child: ListTile(
        leading: Container(
          width: 50.w,
          height: 41.h,
          decoration: BoxDecoration(
              color: Color(0xffE8E7E7),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Color(0xff8B8B8B),width: 0.4)
          ),
          child: Image(image: AssetImage("assets/images/schedule.png"),width: 30.w,height: 30.h,),
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Color(0xff929292)),
        ),
      ),
    );
  }
}