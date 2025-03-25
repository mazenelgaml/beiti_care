import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(left: 7,right: 7),
      width: 338.w,
      height: 100.h,
      child: Card(

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Color(0xff7D7D7D),width: 0.5)
        ),
        elevation: 0,
        margin: EdgeInsets.symmetric(vertical: 5),
        child: ListTile(
          leading: CircleAvatar(
            radius: 26,
            backgroundImage: AssetImage('assets/images/boy.png'),
          ),
          title: Text(
            "Ali Omar",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Color(0xff000000)),
          ),
          subtitle: Text("A highly experienced nurse who knows what he is doing and does it perfectly.", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: Color(0xff5E5C5C)),),
        ),
      ),
    );
  }
}