import 'package:beiti_care/ui/onboarding/on_boarding_first_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:splash_view/source/presentation/pages/splash_view.dart';
import 'package:splash_view/source/presentation/widgets/done.dart';

import '../../services/memory.dart';


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
   OnBoardingFirstScreen()
            // Get.find<CacheHelper>().checkUserIsSignedIn?const HomeScreen():Get.find<CacheHelper>().checkUserIsEnteredAPI?const LoginScreen(): const StartScreen()

        ),

        logo: const Stack(
            alignment: Alignment.topCenter,
            children:[
              Image(image: AssetImage('assets/images/logo.png')),

            ]
        ) );
  }
}
