import 'package:beiti_care/ui/onboarding/on_boarding_third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnBoardingSecondScreen extends StatelessWidget {
  const OnBoardingSecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        automaticallyImplyLeading: false,
        centerTitle: true,
        toolbarHeight: 150.h,
        title: Container(width: 122.w,height: 117.h,child: Image(image: AssetImage("assets/images/logo.png"),width: 122.w,height: 117.h,fit: BoxFit.fill,),decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center
        ,
        children: [
          Image(image: AssetImage("assets/images/onboarding2.png"),width: 374.55.w,height: 279.09.h,),
          Container(
            width: 296.w,
            child: Text(textAlign: TextAlign.center,style: TextStyle(color: Color(0xff929292),fontSize: 16,fontWeight: FontWeight.w700),"Medical care is now closer to you! 🏡 Request your specialized nurse anytime, anywhere"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(width: 17.w,height: 6.h,decoration: BoxDecoration(
                  color: Color(0xffD9D9D9),
                  borderRadius: BorderRadius.circular(20)
              ),),
              SizedBox(width: 3.w,),
              Container(width: 41.w,height: 6.h,decoration: BoxDecoration(
                  color: Color(0xffB93439),
                  borderRadius: BorderRadius.circular(20)
              ),),
              SizedBox(width: 3.w,),
              Container(width: 17.w,height: 6.h,decoration: BoxDecoration(
                  color: Color(0xffD9D9D9),
                  borderRadius: BorderRadius.circular(20)
              ),)
            ],
          ),
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
                    child: Text("Skip",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700),),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Get.off(()=>OnBoardingThirdScreen());
                },
                child: Container(
                  width: 135.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                      color: Color(0xffB93439),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text("Next",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700),),
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
