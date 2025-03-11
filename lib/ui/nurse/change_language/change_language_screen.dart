import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../services/localization_services.dart';
import '../../../services/memory.dart';


class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  bool isArabicSelected = false;
  bool isEnglishSelected = false;
  late CacheHelper cacheHelper; // تعريف cacheHelper كـ late

  @override
  void initState() {
    super.initState();
    _initializeCache(); // استدعاء الميثود الخاصة بتحميل البيانات
  }

  // تحميل الكاش وجلب اللغة المحفوظة
  Future<void> _initializeCache() async {
    cacheHelper = await CacheHelper.init();
    _loadSavedLanguage();
  }

  // تحميل اللغة المحفوظة
  void _loadSavedLanguage() {
    final savedLocale = cacheHelper.activeLocale;
    setState(() {
      isArabicSelected = savedLocale.languageCode == 'ar';
      isEnglishSelected = savedLocale.languageCode == 'en';
    });
  }

  // حفظ اللغة عند الضغط على "Save"
  void _saveLanguage() {
    final newLocale = isArabicSelected ? SupportedLocales.arabic : SupportedLocales.english;
    cacheHelper.activeLocale = newLocale;
    Get.updateLocale(newLocale);

    // رسالة تأكيد
    Get.snackbar("Success", "Language updated to ${newLocale.languageCode.toUpperCase()}",
        snackPosition: SnackPosition.BOTTOM);
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
              Text(
                "Language",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Color(0xffB93439)),
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
          children: [
            SizedBox(height: 20.h),

            // Arabic Language Toggle
            _languageTile("Arabic", isArabicSelected, () {
              setState(() {
                isArabicSelected = true;
                isEnglishSelected = false;
              });
            }),

            SizedBox(height: 12.h),

            // English Language Toggle
            _languageTile("English", isEnglishSelected, () {
              setState(() {
                isEnglishSelected = true;
                isArabicSelected = false;
              });
            }),

            Spacer(),

            // Save & Cancel Buttons
            _actionButton("Save", Color(0xffB93439), Colors.white, _saveLanguage),
            SizedBox(height: 12.h),
            _actionButton("Cancel", Colors.black87, Colors.white, () {
              Navigator.pop(context);
            }),

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _languageTile(String language, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              language,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: Color(0xffB93439)),
            ),
            Switch(
              value: isSelected,
              onChanged: (value) => onTap(),
              activeColor: Color(0xffB93439),
            ),
          ],
        ),
      ),
    );
  }

  Widget _actionButton(String text, Color bgColor, Color textColor, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: textColor),
        ),
      ),
    );
  }
}
