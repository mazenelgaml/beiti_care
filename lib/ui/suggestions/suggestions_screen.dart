import 'package:beiti_care/ui/consultation/consultation_screen.dart';
import 'package:beiti_care/ui/nutrition/nutrition_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../services/translation_key.dart';
import '../../widgets/custom_suggestion_card.dart';
import '../Medical_test/medical_testt_screen.dart';
import '../notifications_user/notifications_user_screen.dart';
import '../nutrition_and_dietary_assessment/nutrition_and_dietary_assessment_screen.dart';

class SuggestionsScreen extends StatelessWidget {
  final List<String> suggestions = [
    Medicaltests.tr,
    Catheterization.tr,
    Nutrition.tr,
    Consultations.tr,

  ];

   SuggestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        leadingWidth: 300.w, // توسيع المساحة الخاصة بـ leading
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w,right: 16.w), // دفع المحتوى ناحية اليمين
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
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
                Suggestions.tr,
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
        backgroundColor: Color(0xFFF3EFEF),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              height: 129.h,
              width: 338.w,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.only(left: 10,right: 10),
                itemCount: suggestions.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      if(suggestions[index]==Nutrition.tr){
                        Get.to(()=>NutritionAndDietaryAssessmentScreen());
                      }else if(suggestions[index]==Medicaltests.tr){
                        Get.to(()=>MedicalTesttScreen());
                      }else if(suggestions[index]==Consultations.tr){
                        Get.to(()=>ConsultationScreen());
                      }
                    },
                    child: SizedBox(
                        height: 67.h,
                        width: 338.w,
                        child: SuggestionCard(title: suggestions[index])),
                  );
                },
                separatorBuilder: (context, index){
                  return SizedBox(
                    height: 6.h,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


