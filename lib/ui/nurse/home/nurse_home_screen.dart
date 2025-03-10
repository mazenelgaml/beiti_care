import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_buttom_nav_bar.dart';


class NurseHomeScreen extends StatefulWidget {

  const NurseHomeScreen({super.key});

  @override
  State<NurseHomeScreen> createState() => _NurseHomeScreenState();
}

class _NurseHomeScreenState extends State<NurseHomeScreen> {
  int _selectedIndex = 0;
  final List<String> _iconPaths = [
    "assets/images/homeIcon.png",
    "assets/images/walletIcon.png",
    "assets/images/pending.png",
    "assets/images/moreIcon.png",
  ];

  final List<String> _labels = ["Home", "Wallet", "Requests", "More"];
  String profile="assets/images/profileIcon.png";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        leading: null,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 25,

                  backgroundImage: AssetImage(

                      "assets/images/boy.png"), // Replace with your asset
                ),
                 SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      "Omar Mohamed",
                      style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children:  [
                        Image(image: AssetImage("assets/images/locationIcon.png"),width: 10.w,height: 10.h,fit: BoxFit.fill,),
                        SizedBox(width: 4.w),
                        Text("Dokki Square Street - Egypt",
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
                _buildInfoCard("patient", "assets/images/patient.png", "0"),
                _buildInfoCard("Completed", "assets/images/completed.png", "0"),
                _buildInfoCard("Pending","assets/images/pending.png", "0"),
                _buildInfoCard("Total Revenue", "assets/images/coins.png", "0"),
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
                 Text("You have no requests.",
                    style: TextStyle(color: Color(0xff8B8B8B), fontSize: 14.sp,fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ],


      ),

        //params
      floatingActionButton: FloatingActionButton(

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: () {

        },
        backgroundColor: Colors.transparent,
        elevation: 2,

        child: CircleAvatar(
          backgroundColor: Colors.grey[400],
          radius: 50,

          child: Image.asset(
            profile,
            width: 28,
            height: 28,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)
        ),
        margin: EdgeInsets.only(bottom: 20,left: 20,right: 20),
        child: AnimatedBottomNavigationBar.builder(

          itemCount: _iconPaths.length,
          tabBuilder: (int index, bool isActive) {
            final color = isActive ? Colors.red : Colors.grey[600];
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(_iconPaths[index], width: 24, height: 24, color: color),
                const SizedBox(height: 3),
                Text(
                  _labels[index],
                  style: TextStyle(fontSize: 12, color: color),
                ),
              ],
            );
          },
          notchMargin: 15,
          backgroundColor: Colors.grey[300]!,
          activeIndex: _selectedIndex,
          notchSmoothness: NotchSmoothness.smoothEdge,
          gapLocation: GapLocation.center,
          leftCornerRadius: 20,
          rightCornerRadius: 20,

          onTap: (index) => setState(() {
            _selectedIndex = index;}),
        ),
      ),



    );

  }

  Widget _buildInfoCard(String title, String icon, String value) {
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
              Image(image: AssetImage(icon),width:18.w ,height:18.h ,fit: BoxFit.fill,),
               SizedBox(width: 8.w),
              Text(title, style:  TextStyle(color: Color(0xff838282),fontSize:12.sp ,fontWeight: FontWeight.w600)),
            ],
          ),
           SizedBox(height: 8.h),
          Text(value, style:  TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w600, color: Color(0xff49768C))),
        ],
      ),
    );
  }
}

