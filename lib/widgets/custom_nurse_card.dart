import 'dart:async';
import 'package:beiti_care/ui/user_check_out/user_check_out_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../services/translation_key.dart';

class NurseCard extends StatelessWidget {
  final int rating;
  const NurseCard({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    void showWaitingPopup(BuildContext context) {
      showDialog(
        context: context,
        barrierDismissible: false, // يمنع إغلاق النافذة عند الضغط خارجها
        builder: (BuildContext context) {
          return WaitingDialog();
        },
      );
    }

    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Color(0xff7D7D7D), width: 0.5)),
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/images/nurse.png'),
                ),
                SizedBox(width: 8),
                Text(
                  "Ahmed Mohamed",
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff000000)),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              Specializednutritionservicesandcomprehensivenutritionalassessment.tr,
              style: TextStyle(
                  color: Color(0xff5E5C5C),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image(
                          image: AssetImage("assets/images/coins2.png"),
                          width: 18.w,
                          height: 16.h,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          '35 D.A',
                          style: TextStyle(
                              color: Color(0xffC69100),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(width: 16.w),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: Colors.black,
                          size: 18,
                        ),
                        SizedBox(width: 5.w),
                        Text('40-60 ${Minutes.tr}',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: List.generate(
                    5,
                        (index) => Icon(
                      index < rating
                          ? Icons.star_rate_rounded
                          : Icons.star_border_rounded,
                      color: index < rating
                          ? Color(0xffE07800)
                          : Color(0xff8B8B8B),
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(Numberofcasesserved22.tr,
                    style: TextStyle(
                        color: Color(0xffB93439),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500)),
              ],
            ),
            SizedBox(height: 10),
            SizedBox(height: 10),
            Center(
              child: Container(
                width: 140.w,
                height: 48.h,
                child: ElevatedButton(
                  onPressed: () {
                    showWaitingPopup(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Color(0xffB93439),
                  ),
                  child: Center(
                      child: Text(
                        BookNow.tr,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 15.sp),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WaitingDialog extends StatefulWidget {
  const WaitingDialog({super.key});

  @override
  _WaitingDialogState createState() => _WaitingDialogState();
}

class _WaitingDialogState extends State<WaitingDialog> {
  int remainingSeconds = 30; // بدء العداد من 30 ثانية
  late Timer _timer;
  bool isTimeUp = false; // متغير للتحكم في لون الزر

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
      } else {
        setState(() {
          isTimeUp = true; // تغيير لون الزر عند انتهاء العداد
        });
        _timer.cancel(); // إيقاف العداد
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 274.w,
      height: 413.h,
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 96.h,
                width: 100.w,
              ), // ضع صورة التطبيق هنا
              SizedBox(height: 10),
              Image.asset(
                isTimeUp ?"assets/images/waitting_red.png":'assets/images/waitting.png',
                height: 80.h,
                width: 80.w,
              ),
              SizedBox(height: 10),
              Text(
                "Waiting for nurse approval,\nresponse within 30 seconds",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15.sp,
                    color: Color(0xff7D7D7D),
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              Text(
                "( 00:${remainingSeconds.toString().padLeft(2, '0')} )",
                style: TextStyle(
                    fontSize: 15.sp,
                    color: Color(0xff7D7D7D),
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 15),
              Container(
                width: 141.w,
                height: 55.h,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(()=>UserCheckoutScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor:
                    isTimeUp ? Color(0xffB93439) : Color(0xff8B8B8B), // يتغير عند انتهاء العداد
                    padding:
                    EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  ),
                  child: Center(
                      child: Text(
                        "Done",
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.w600),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
