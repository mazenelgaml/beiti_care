import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../services/translation_key.dart';
import '../../widgets/custom_payment.dart';

class UserCheckoutScreen extends StatefulWidget {
  const UserCheckoutScreen({super.key});

  @override
  _UserCheckoutScreenState createState() => _UserCheckoutScreenState();
}

class _UserCheckoutScreenState extends State<UserCheckoutScreen> {
  void showPaymentSuccessPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true, // يمنع إغلاق النافذة بالضغط خارجها
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16), // حواف دائرية
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            width: 300,
            height: 350,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  PaymentComplete.tr,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffB93439),
                  ),
                ),
                SizedBox(height: 20),
                Image.asset("assets/images/checkoutSucess.png", width: 180.w,height: 177.8.h,), // صورة علامة الصح
                SizedBox(height: 20),
                Text(
                  ThankYouForYourOrder.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffB93439),
                  ),
                ),
                SizedBox(height: 20),

              ],
            ),
          ),
        );
      },
    );
  }
  void showPaymentFailPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true, // يمنع إغلاق النافذة بالضغط خارجها
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16), // حواف دائرية
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            width: 300,
            height: 350,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  PaymentUnComplete.tr,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffB93439),
                  ),
                ),
                SizedBox(height: 20),
                Image.asset("assets/images/paymenfail.png", width: 180.w,height: 177.8.h,), // صورة علامة الصح
                SizedBox(height: 20),
                Text(
                  Pleaseconfirmthedata.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffB93439),
                  ),
                ),
                SizedBox(height: 20),

              ],
            ),
          ),
        );
      },
    );
  }


  String? selectedPaymentMethod = sampling.tr; // القيمة الافتراضية
  bool saveCreditInfo = false; // متغير لحفظ بيانات البطاقة

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F3F0),
      appBar: AppBar(
        leadingWidth: 300.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 24.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                    color: Color(0xffB93439),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Icon(Icons.arrow_back_ios_new_rounded,
                      color: Colors.white, size: 16),
                ),
              ),
              SizedBox(width: 5.w),
              Text(
                CheckOut.tr,
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
        backgroundColor: Color(0xFFF8F3F0),
      ),
      body:  SingleChildScrollView(
    child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    // بطاقة الخدمة
    NutritionAndDietaryAssessmentCardPayment(),
    SizedBox(height: 20),

    // اختيار وسيلة الدفع
    Text(
    Chooseapaymentmethod.tr,
    style: TextStyle(
    fontWeight: FontWeight.w500,
    color: Color(0xffB93439),
    fontSize: 16.sp,
    ),
    ),
    SizedBox(height: 10),

    // الدفع عند الاستلام
    GestureDetector(
    onTap: () => setState(() => selectedPaymentMethod = sampling.tr),
    child: paymentOption(
    Paymentuponsampling.tr,
    selectedPaymentMethod == sampling.tr),
    ),

    // الدفع بفيزا
    GestureDetector(
    onTap: () => setState(() => selectedPaymentMethod = visa.tr),
    child: paymentOption(PaymentbyVisa.tr,
    selectedPaymentMethod == visa.tr),
    ),

    // إظهار الحقول الخاصة ببطاقة الفيزا فقط عند اختيار الدفع بها
    if (selectedPaymentMethod == visa.tr) ...[
          SizedBox(height: 20.h),

// حقل رقم البطاقة مع العنوان
      Text(CardNumber.tr,
          style: TextStyle(color: Color(0xff8B8B8B), fontSize: 16.sp, fontWeight: FontWeight.w500)),
      SizedBox(height: 5.h),
      buildTextField(CardNumber.tr),
      SizedBox(height: 10.h),

// حقل اسم البطاقة مع العنوان
      Text(NameOnCard.tr,
          style: TextStyle(color: Color(0xff8B8B8B), fontSize: 16.sp, fontWeight: FontWeight.w500)),
      SizedBox(height: 5.h),
      buildTextField(NameOnCard.tr),
      SizedBox(height: 10.h),

// حقل CVV و Expiry مع العناوين
      Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(CVV.tr,
                    style: TextStyle(color: Color(0xff8B8B8B), fontSize: 16.sp, fontWeight: FontWeight.w500)),
                SizedBox(height: 5.h),
                buildTextField(CVV.tr),
              ],
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(Expiry.tr,
                    style: TextStyle(color: Color(0xff8B8B8B), fontSize: 16.sp, fontWeight: FontWeight.w500)),
                SizedBox(height: 5.h),
                buildTextField(Expiry.tr),
              ],
            ),
          ),
        ],
      ),
      SizedBox(height: 10.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(SaveYourCreditInformation.tr,
              style: TextStyle(
                  color: Color(0xffB93439),
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp)),
          Switch(
            inactiveTrackColor: Color(0xff8B8B8B),
            inactiveThumbColor: Color(0xffffffff),
            activeTrackColor: Color(0xffB93439),
            activeColor: Color(0xffffffff),
            value: saveCreditInfo,
            onChanged: (val) => setState(() => saveCreditInfo = val),
          ),
        ],
      ),

    ],



    SizedBox(height: 20), // بديل عن Spacer()

    // زر الدفع
    Center(
    child: SizedBox(
    width: 338.w,
    height: 65.h,
    child: ElevatedButton(
    style: ElevatedButton.styleFrom(
    backgroundColor: Color(0xffB93439),
    padding: EdgeInsets.symmetric(vertical: 14),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
    ),
    ),
    onPressed: () {
    if (selectedPaymentMethod == visa.tr) {
      showPaymentSuccessPopup(context);
    } else {
      showPaymentFailPopup(context);
    }
    },
    child: Text(
    Pay.tr,
    style: TextStyle(
    color: Colors.white,
    fontSize: 20.sp,
    fontWeight: FontWeight.w600),
    ),
    ),
    ),
    )
    ],
    ),
    ),


    ));
  }

  // دالة لإنشاء خيار الدفع
  Widget paymentOption(String title, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: isSelected ? Color(0xffB93439) : Color(0xff8B8B8B),
            ),
          ),
          SizedBox(width: 12.w),
          Image.asset(
            isSelected
                ? "assets/images/7118red.png"
                : "assets/images/Group 76118.png",
            width: 24.w,
          ),
        ],
      ),
    );
  }

  // دالة لإنشاء حقول الإدخال
  Widget buildTextField(String label) {
    return TextFormField(
      decoration: InputDecoration(

        hintText: label,
        hintStyle: TextStyle(color: Color(0xff8B8B8B),fontSize: 16.sp,fontWeight: FontWeight.w500),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffB93439),),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
