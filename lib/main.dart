import 'package:beiti_care/services/app_translation.dart';
import 'package:beiti_care/services/localization_services.dart';
import 'package:beiti_care/services/memory.dart';
import 'package:beiti_care/ui/nutrition/nutrition_screen.dart';
import 'package:beiti_care/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => CacheHelper.init(), permanent: true);
  Get.put(LocalizationService.init(), permanent: true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      designSize: const Size(390 , 844), // حجم التصميم الأساسي، عدّله حسب UI
      minTextAdapt: true,
      splitScreenMode: true,
        builder: (context, child) {return GetMaterialApp(
        title: 'BeitiCare',
        debugShowCheckedModeBanner: false,
        home: NutritionScreen(),
        translations: AppTranslations(),
        locale: Get.find<LocalizationService>().activeLocale,
        supportedLocales: SupportedLocales.all,
        fallbackLocale: SupportedLocales.english,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      );}
    );

  }
}
