import 'package:beiti_care/ui/nurse/home/nurse_home_screen.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

import '../../../../models/login_model.dart';
import '../../../../services/end_points.dart';
import '../../../../services/memory.dart';
import '../../../../services/translation_key.dart';
import '../../../onboarding/on_boarding_first_screen.dart';

class FingerPrintController extends GetxController{
  bool isLoading=false;
  final BuildContext context;
  final String email;
  FingerPrintController(this.context, this.email);
  @override
  Future<void> onInit() async {
    super.onInit();
    await CacheHelper.init();
    // Automatically show the fingerprint alert after the screen builds
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showAlertAndAuthenticate(context);
    });
  }
  final LocalAuthentication auth = LocalAuthentication();

  /// Show an alert dialog then trigger fingerprint authentication
  void _showAlertAndAuthenticate(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing by tapping outside
      builder: (context) {
        return Stack(
            children: [AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    enterFingerprint.tr,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const Icon(Icons.fingerprint, size: 60, color: Colors.blue),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      Get.off(() => NurseHomeScreen()); // Start fingerprint authentication
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child:  Text(cancel.tr, style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ), Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: GestureDetector(
                  onTap: _authenticate,
                  child: const Icon(
                    Icons.fingerprint,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
              ),
            ),]
        );
      },
    );
  }

  /// Trigger fingerprint authentication directly.
  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason: scanFingerprintToAuthenticate.tr,
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );
    } catch (e) {
      print("${authenticationError.tr} $e");
    }

    if (authenticated) {

      await sendFingerPrint(context,email);
    }
  }
  Future<void> sendFingerPrint(BuildContext context,String email) async {
    isLoading = true;
    update();
    String token = await Get.find<CacheHelper>().getData(key: "token");
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: EndPoint.baseUrl,
        validateStatus: (status) => status != null && status < 500,
      ),
    );

    isLoading = true;
    update();

    try {
      final response = await dio.post(
        "/api/auth//fingerPrint",
        data: {
          "email":email
        },

        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization":"Bearer $token "
        }),
      );

      if (response.statusCode == 200) {

        Get.off(() => NurseHomeScreen());

      } else {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          title: "خطأ",
          text: "البريد الإلكتروني أو كلمة المرور غير صحيحة، يرجى المحاولة مرة أخرى.",
        );
      }
    } catch (e) {
      print('خطأ تسجيل الدخول: $e');
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        title: "خطأ في الاتصال",
        text: "حدث خطأ أثناء الاتصال بالخادم.",
      );
    } finally {
      isLoading = false;
      update();
    }
  }

}