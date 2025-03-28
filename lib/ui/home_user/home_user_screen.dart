import 'package:beiti_care/ui/home_user/widgets/sugesstions_widget.dart';
import 'package:beiti_care/ui/services/services_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../services/translation_key.dart';
import '../../widgets/custom_button_nav_bar_user.dart';
import '../../widgets/custom_nutrition_and_dietary_assessment_card.dart';
import '../notifications/notification_screen.dart';
import '../notifications_user/notifications_user_screen.dart' show NotificationsUser;
import '../search/search_screen.dart';
import 'controller/home_user_controller.dart' show HomeUserController;

class HomeUserScreen extends StatelessWidget {
  const HomeUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: HomeUserController(),
    builder: (HomeUserController controller) {
    return controller.isLoading?Scaffold(body: Center(child: CircularProgressIndicator(),),): Scaffold(
      backgroundColor: Color(0xffF3EFEF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipOval(
                            child:controller.userByIdModel?.user?.image == null || controller.userByIdModel?.user?.image == "" ? Image.asset(
                              "assets/images/pngtree-avatar-icon-profile-icon-member-login-vector-isolated-png-image_1978396.jpg",
                              width: 70.w,
                              height: 70.h,
                              fit: BoxFit.cover,
                            )
                                : Image.network(
                              controller.userByIdModel?.user?.image??"",
                              width: 70.w,
                              height: 70.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.userByIdModel?.user?.userName??"",
                                style:
                                TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                              ),
                              Row(
                                children: [
                                  Image(image: AssetImage("assets/images/locationIcon.png"),width: 10.w,height: 10.h,fit: BoxFit.fill,),
                                  SizedBox(width: 4.w),
                                  Text(controller.userByIdModel?.user?.address??"",
                                      style: TextStyle(color: Color(0xff5E5C5C),fontSize: 11.sp,fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
            
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(12.0),
                            child: InkWell(
                              onTap: (){Get.to(()=>NotificationsUser());},
                              child: Image(image: AssetImage("assets/images/notify.png"),width: 24.w,height: 24.h,fit: BoxFit.fill,),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(12.0),
                            child: InkWell(
                              onTap: (){Get.to(()=>SearchScreen());},
                              child: Image(image: AssetImage("assets/images/searchIconAbbBar.png"),width: 24.w,height: 24.h,fit: BoxFit.fill,),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Container(
                  height: 129.h,
                  width: 338.w,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(width: 41.w,height: 6.h,decoration: BoxDecoration(
                        color: Color(0xffB93439),
                        borderRadius: BorderRadius.circular(20)
                    ),),
                    SizedBox(width: 3.w,),
                    Container(width: 17.w,height: 6.h,decoration: BoxDecoration(
                        color: Color(0xffD9D9D9),
                        borderRadius: BorderRadius.circular(20)
                    ),),
                    SizedBox(width: 3.w,),
                    Container(width: 17.w,height: 6.h,decoration: BoxDecoration(
                        color: Color(0xffD9D9D9),
                        borderRadius: BorderRadius.circular(20)
                    ),)
                  ],
                ),
                CategoryIcons(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 20.w,right: 20.w,top: 15.h),
                      child: Text(Services.tr,style: TextStyle(color: Color(0xffB93439),fontSize: 16.sp,fontWeight: FontWeight.w600),),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 20.w,right: 20.w,top: 10.h),
                      child: InkWell(onTap:(){
                        Get.to(()=>ServicesScreen());
                      },child: Text(Seeall.tr,style: TextStyle(color: Color(0xff8B8B8B),fontSize: 16.sp,fontWeight: FontWeight.w600),)),
                    )
                  ],
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding:  EdgeInsets.only(bottom: 25.0.h,right: 20.w,left: 20.w),
                  child: Column(
                    children: List.generate(4, (index) => NutritionAndDietaryAssessmentCard()),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:Container(decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)
      ),margin:EdgeInsets.only(bottom: 20,left: 20,right: 20
      ),child: CurvedBottomNavBarUser(homeIcon: Color(0xffB93439),)),
    );});
  }
}
