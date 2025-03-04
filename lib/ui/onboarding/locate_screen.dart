import 'package:beiti_care/ui/auth/Log_in/log_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LocateScreen extends StatelessWidget {
  const LocateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        centerTitle: true,
        toolbarHeight: 150.h,
        title: Container(width: 122.w,height: 117.h,child: Image(image: AssetImage("assets/images/logo.png"),width: 122.w,height: 117.h,fit: BoxFit.fill,),decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center
        ,
        children: [
          Image(image: AssetImage("assets/images/location.png"),width: 356.4.w,height: 265.56.h,),
    Column(
      children: [
        Text("Get My Location",style: TextStyle(color: Color(0xff264EB9),fontSize: 20.sp,fontWeight: FontWeight.w700),)
        ,Container(
                width: 296.w,
                child: Text(textAlign: TextAlign.center,style: TextStyle(color: Color(0xff929292),fontSize: 16,fontWeight: FontWeight.w700),"We will use the location of the device near you to search for a nurse when you request the service."),
              ),
      ],
    ),
          SizedBox(height: 150.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                child: Container(
                  width: 135.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                      color: Color(0xff89949A),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text("Not NOW",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700),),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Get.off(()=>LoginScreen());
                },
                child: Container(
                  width: 135.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                      color: Color(0xffB93439),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text("Locate",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700),),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
