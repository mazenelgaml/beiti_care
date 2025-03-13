import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WithdrawHistoryScreen extends StatelessWidget {
  final List<Map<String, String>> transactions = List.generate(
    6,
        (index) => {
      "phone": "01023625821",
      "amount": "500 EGP",
      "date": "22/1/2024",
      "status": "process is complete"
    },
  );

  WithdrawHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 250.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w,right: 16.w),
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
                    color: const Color(0xffB93439),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
              SizedBox(width: 5.w),
              Text(
                'Withdraw History',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xffB93439),
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
        padding: EdgeInsets.all(16.w),
        child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final transaction = transactions[index];
            return Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cash Phone Number: ${transaction['phone']}",
                      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5.h),
                    Text("Amount: ${transaction['amount']}", style: TextStyle(fontSize: 14.sp)),
                    SizedBox(height: 5.h),
                    Text("${transaction['date']}", style: TextStyle(fontSize: 14.sp)),
                    SizedBox(height: 5.h),
                    Text(
                      transaction['status']!,
                      style: TextStyle(fontSize: 14.sp, color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
