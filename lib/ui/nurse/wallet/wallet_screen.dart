import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../services/translation_key.dart';
import '../../../widgets/custom_buttom_nav_bar.dart';
import '../../add_credit_card/add_credit_card_screen.dart';
import '../../withdraw_history/withdraw_history_screen.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Wallet.tr,
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
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30.h),
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logo.png', // استبدل باسم الصورة الفعلي
                    width: 116.w,
                    height: 111.h,
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.monetization_on, color: Colors.amber, size: 24.w),
                      SizedBox(width: 4.w),
                      Text(
                        "0.00",
                        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(),
                        backgroundColor: Colors.blueGrey,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                      ),
                      onPressed: () {
                        Get.to(()=>AddCreditCardScreen());
                      },
                      child: Text(Pay.tr, style: TextStyle(fontSize: 16.sp, color: Colors.white)),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(),
                        backgroundColor: Color(0xffB93439),
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                      ),
                      onPressed: () {Get.to(()=>WithdrawHistoryScreen());},
                      child: Text(Withdraw.tr, style: TextStyle(fontSize: 16.sp, color: Colors.white)),
                    ),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)
      ),margin:EdgeInsets.only(bottom: 20,left: 20,right: 20
      ),child: CurvedBottomNavBar(walletIcon: Color(0xffB93439),)),
    );
  }
}
