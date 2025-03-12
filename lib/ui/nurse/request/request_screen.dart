import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../services/translation_key.dart';
import '../../../widgets/custom_buttom_nav_bar.dart';

class RequestsScreen extends StatelessWidget {
  final List<Map<String, String>> requests = [
    {
      "name": "Mohamed Ahmed",
      "location": "Mall Of Egypt",
      "distance": "1.5 mi , 30min",
      "test": "Blood Urea (Urea or BUN )",
      "code": "Code 20A"
    },
    {
      "name": "Mohamed Ahmed",
      "location": "Mall Of Egypt",
      "distance": "1.5 mi , 30min",
      "test": "Blood Urea (Urea or BUN )"
    },
    {
      "name": "Mohamed Ahmed",
      "location": "Mall Of Egypt",
      "distance": "1.5 mi , 30min",
      "test": "Blood Urea (Urea or BUN )"
    },
  ];

   RequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 11,vertical: 11), // تقليل المساحة حول الأيقونة
          child: GestureDetector(
            onTap: (){},
            child: Container(
              width: 24.w,
              height: 24.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                color: Color(0xffB93439),
              ),
              child: Center(
                child: Icon(Icons.arrow_back, color: Colors.white, size: 20), // تقليل الحجم لو لازم
              ),
            ),
          ),
        ),

        title: Text(
          Requests.tr,
          style: TextStyle(color: Color(0xffB93439), fontWeight: FontWeight.bold),
        ),

        actions:  [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: InkWell(
              onTap: (){},
              child: Image(image: AssetImage("assets/images/notify.png"),width: 24.w,height: 24.h,fit: BoxFit.fill,),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          itemCount: requests.length,
          itemBuilder: (context, index) {
            return RequestCard(requests[index]);
          },
        ),
      ),
      bottomNavigationBar: Container(decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)
      ),margin:EdgeInsets.only(bottom: 20,left: 20,right: 20
      ),child: CurvedBottomNavBar(requestsIcon: Color(0xffB93439),)),
    );
  }
}

class RequestCard extends StatelessWidget {
  final Map<String, String> request;

  RequestCard(this.request);

  @override
  Widget build(BuildContext context) {
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
                      Text(request["name"] ?? "",
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp)),
                      Text(request["location"] ?? "",
                          style: TextStyle(color: Color(0xffB93439), fontSize: 12.sp,fontWeight:FontWeight.w500)),
                      SizedBox(height: 5),
                      if (request.containsKey("code"))
                        Text(request["code"] ?? "",
                            style: TextStyle(color: Color(0xffB93439), fontSize: 12.sp, fontWeight: FontWeight.bold)),
                      Text(request["test"] ?? "",
                          style: TextStyle(color: Color(0xff49768C), fontSize: 14.sp, decoration: TextDecoration.underline)),
                    ],
                  ),
                ),
                Text(request["distance"] ?? "",
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
                    onPressed: () {},
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
                    onPressed: () {},
                    child: Text(Accept.tr, style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}