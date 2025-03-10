import 'package:beiti_care/ui/onboarding/on_boarding_first_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:splash_view/source/presentation/pages/splash_view.dart';
import 'package:splash_view/source/presentation/widgets/done.dart';

import '../../services/memory.dart';
import '../auth/finger_print/finger_print_screen.dart';


class SplashScreen extends StatefulWidget {


  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SplashView(

        backgroundColor: const Color(0xffffffff),
        duration: const Duration(seconds: 4),
        done: Done(
            FingerprintAuthScreen()
            // Get.find<CacheHelper>().checkUserIsSignedIn?const HomeScreen():Get.find<CacheHelper>().checkUserIsEnteredAPI?const LoginScreen(): const StartScreen()

        ),

        logo:  Container(
          width: Get.width,
          height: Get.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFD3EEFC), // Light blue at the top
                Color(0xFFEAA8AA), // Light pink at the bottom
              ],
            ),
          ),
          child: Center(child: Image(image: AssetImage('assets/images/splash.png'))),
        ) );
  }
}
