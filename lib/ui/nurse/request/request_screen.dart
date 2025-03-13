import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../services/translation_key.dart';
import '../../../widgets/custom_buttom_nav_bar.dart';
import 'controller/request_controller.dart';

class RequestsScreen extends StatelessWidget {


   RequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: RequestController(),
    builder: (RequestController controller) {
    return controller.isLoading?Scaffold(body: Center(child: CircularProgressIndicator(),),): Scaffold(
      appBar: AppBar(
        leadingWidth: 200.w, // توسيع المساحة الخاصة بـ leading
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
                Requests.tr,
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
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          itemCount: controller.nurseSessionsModel?.length,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 1,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage("assets/images/boy.png"), // Change as needed
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(controller.nurseSessionsModel?[index].client?.userName ?? "",
                                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp)),
                              Text(controller.nurseSessionsModel?[index].nurse?.location ?? "",
                                  style: TextStyle(color: Color(0xffB93439), fontSize: 12.sp,fontWeight:FontWeight.w500)),
                              SizedBox(height: 5),
                              Text(controller.nurseSessionsModel?[index].client?.medicalHistory?.laboratoryTests?[index]?? "",
                                  style: TextStyle(color: Color(0xff49768C), fontSize: 14.sp, decoration: TextDecoration.underline)),
                            ],
                          ),
                        ),
                        Text(  "",
                            style: TextStyle(color: Color(0xff878686), fontSize: 11.sp)),
                      ],
                    ),

                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 98.w,
                          height: 35.h,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            onPressed: () {
                              controller.cancelSession(controller.nurseSessionsModel?[index].id??"");
                            },
                            child: Text(cancel.tr, style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: 98.w,
                          height: 35.h,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffB93439),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            onPressed: () {
                              controller.confirmSession(controller.nurseSessionsModel?[index].id??"");
                            },
                            child: Text(Accept.tr, style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Container(decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)
      ),margin:EdgeInsets.only(bottom: 20,left: 20,right: 20
      ),child: CurvedBottomNavBar(requestsIcon: Color(0xffB93439),)),
    );
    }
    );
  }
}

