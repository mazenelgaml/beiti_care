import 'package:beiti_care/ui/nurse/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../services/translation_key.dart';
import '../../../widgets/custom_buttom_nav_bar.dart';
import '../../notifications/notification_screen.dart';



class NurseHomeScreen extends StatelessWidget {

  const NurseHomeScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: HomeController(),
        builder: (HomeController controller) {
    return controller.isLoading?Scaffold(body: Center(child: CircularProgressIndicator(),),): Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(

    leading: null,
    automaticallyImplyLeading: false,
    elevation: 0,
    backgroundColor: Colors.white,
    actions: [
    Padding(
    padding: EdgeInsets.all(12.0),
    child: InkWell(
    onTap: (){Get.to(()=>NotificationScreen());},
    child: Image(image: AssetImage("assets/images/notify.png"),width: 24.w,height: 24.h,fit: BoxFit.fill,),
    ),
    ),
    ],
    ),
    body: Column(
    children: [
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Row(
    children: [
    ClipOval(
    child:controller.nurseByIdModel?.data?.image==null||controller.nurseByIdModel?.data?.image==""?Image.asset(
      "assets/images/pngtree-avatar-icon-profile-icon-member-login-vector-isolated-png-image_1978396.jpg",

      width: 70.w,
      height: 70.h,
      fit: BoxFit.cover,
    ):Image.network(controller.nurseByIdModel?.data?.image??"",width: 70.w,
      height: 70.h,fit: BoxFit.cover,),
          ),
    SizedBox(width: 12.w),
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Column(
      children: [
        Text(
        controller.nurseByIdModel?.data?.userName??"",
        style:
        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
        ),
        Row(
          children: [
            Text("${controller.nurseByIdModel?.data?.rating}",
              style:
              TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),),
            Icon(Icons.star,color: Colors.amber,size: 15,)
          ],
        )
      ],
    ),
    Row(
    children: [
    Image(image: AssetImage("assets/images/locationIcon.png"),width: 10.w,height: 10.h,fit: BoxFit.fill,),
    SizedBox(width: 4.w),
    Text(controller.nurseByIdModel?.data?.location??"",
    style: TextStyle(color: Color(0xff5E5C5C),fontSize: 11.sp,fontWeight: FontWeight.w500)),
    ],
    ),
    ],
    ),
    ],
    ),
    ),
    SizedBox(height: 16.h),
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: GridView.count(
    shrinkWrap: true,
    crossAxisCount: 2,
    crossAxisSpacing: 12,
    mainAxisSpacing: 12,
    childAspectRatio: 2,
    children: [
    _buildInfoCard(patient.tr, "assets/images/patient.png", "2"),
    _buildInfoCard(Completed.tr, "assets/images/completed.png", "2"),
    _buildInfoCard(Pending.tr,"assets/images/pending.png", "2"),
    _buildInfoCard(TotalRevenue.tr, "assets/images/coins.png", "1500"),
    ],
    ),
    ),
    SizedBox(height: 16.h),
    Expanded(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Image.asset("assets/images/notif.png", width: 335.61.w,height: 291.36.h,), // Replace with your asset
    SizedBox(height: 16.h),
    Text(Youhavenorequests.tr,
    style: TextStyle(color: Color(0xff8B8B8B), fontSize: 14.sp,fontWeight: FontWeight.w600)),
    ],
    ),
    ),
    ],


    ),

    //params
    bottomNavigationBar: Container(decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20)
    ),margin:EdgeInsets.only(bottom: 20,left: 20,right: 20
    ),child: CurvedBottomNavBar(homeIcon: Color(0xffB93439),)),


    );
    }
    );

  }

  Widget _buildInfoCard(String title, String icon, String value)
    {
      return Container(
        width: 159.w,
        height: 84.h,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image(image: AssetImage(icon),
                  width: 18.w,
                  height: 18.h,
                  fit: BoxFit.fill,),
                SizedBox(width: 8.w),
                Text(title, style: TextStyle(color: Color(0xff838282),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600)),
              ],
            ),
            SizedBox(height: 8.h),
            Text(value, style: TextStyle(fontSize: 25.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xff49768C))),
          ],
        ),
      );

  }
}

