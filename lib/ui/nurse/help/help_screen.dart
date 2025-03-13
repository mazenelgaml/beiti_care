import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../services/translation_key.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  final String phoneNumber = "+96582365988"; // رقم الهاتف للاتصال والواتساب
  final String emailAddress = "Nour@gmail.com"; // البريد الإلكتروني
  final String locationAddress = "Haa Alkhalidia, Jeddah"; // العنوان
  final String googleMapsQuery = "Haa Alkhalidia, Jeddah"; // العنوان بصيغة بحث جوجل ماب
  void _callPhone(String phone) async {
    final url = 'tel:$phone';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      print("❌ لا يمكن إجراء المكالمة");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 150.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 30.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    color: Color(0xffB93439),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 16),
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  Help.tr,
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Color(0xffB93439)),
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
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.h),

            // Card Container
            Center(
              child: Container(
                width: 338.w,
                height: 613.h,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey.shade200),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  children: [
                    // Logo
                    Image.asset("assets/images/logo.png", width: 100.w, height: 96.h),

                    SizedBox(height: 12.h),

                    // Illustration
                    Image.asset("assets/images/help.png", width: 231.w, height: 170.h),

                    SizedBox(height: 12.h),

                    // Title
                    Text(
                      "24/7 ${integratedhealthcareservices.tr}",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500, color: Color(0xff49768C)),
                    ),

                    SizedBox(height: 16.h),

                    // Contact Details
                    _infoRow(ContactUs.tr, phoneNumber, onTap: () => _callPhone(phoneNumber)), // فتح واتساب عند الضغط على الرقم
                    _infoRow(Location.tr, locationAddress, isBold: true, onTap: () => _openGoogleMaps(googleMapsQuery)), // فتح جوجل ماب عند الضغط على الموقع
                    _infoRow(email.tr, emailAddress, onTap: () => _sendEmail(emailAddress)),

                    SizedBox(height: 16.h),

                    // Social Media Icons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _socialIcon(FontAwesomeIcons.facebook),
                        _socialIcon(FontAwesomeIcons.whatsapp, onTap: () => _launchWhatsApp(phoneNumber)), // أيقونة واتساب
                        _socialIcon(FontAwesomeIcons.snapchat),
                        _socialIcon(FontAwesomeIcons.instagram),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String title, String value, {bool isBold = false, Function()? onTap}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$title  ",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp, color: Color(0xff49768C)),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
                color: Colors.blue, // لون أزرق ليبين إنه لينك
                decoration: TextDecoration.underline, // خط تحت النص
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _socialIcon(IconData icon, {Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Icon(icon, size: 22.sp, color: Colors.blueGrey.shade700),
      ),
    );
  }

  void _launchWhatsApp(String phoneNumber) async {
    final Uri url = Uri.parse("https://wa.me/$phoneNumber");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      Get.snackbar("Error", "Cannot open WhatsApp");
    }
  }

  void _sendEmail(String email) async {
    final Uri url = Uri.parse("mailto:$email");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      Get.snackbar("Error", "Cannot open email app");
    }
  }

  void _openGoogleMaps(String query) async {
    final Uri googleMapsUrl = Uri.parse("https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(query)}");
    if (await canLaunchUrl(googleMapsUrl)) {
      await launchUrl(googleMapsUrl, mode: LaunchMode.externalApplication);
    } else {
      Get.snackbar("Error", "Cannot open Google Maps");
    }
  }
}
