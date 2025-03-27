import 'package:beiti_care/ui/home_user/home_user_screen.dart';
import 'package:beiti_care/ui/nurse/home/nurse_home_screen.dart';
import 'package:beiti_care/ui/onboarding/on_boarding_first_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

import '../../../services/translation_key.dart';

class FingerprintAuthScreen extends StatefulWidget {
  final String toWhere;
  const FingerprintAuthScreen({super.key, required this.toWhere});

  @override
  _FingerprintAuthScreenState createState() => _FingerprintAuthScreenState();
}

class _FingerprintAuthScreenState extends State<FingerprintAuthScreen> {
  final LocalAuthentication auth = LocalAuthentication();

  /// Show an alert dialog then trigger fingerprint authentication
  void _showAlertAndAuthenticate() {
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
                   if(widget.toWhere=="nurse")
                   {
                     Get.off(()=>NurseHomeScreen());
                   }else{
                     Get.off(()=>HomeUserScreen());
                   } // Start fingerprint authentication
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
      if(widget.toWhere=="nurse")
      {
        Get.off(()=>NurseHomeScreen());
      }else{
        Get.off(()=>HomeUserScreen());
      }
    }
  }
  void initState() {
    super.initState();
    // Automatically show the fingerprint alert after the screen builds
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showAlertAndAuthenticate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white
      ,
      body: Stack(
        children: [
          // App logo at the top center
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Image.asset(
                'assets/images/logo.png', // Replace with your logo path
                height: 100,
              ),
            ),
          ),
          // Fingerprint icon at the bottom center that shows the alert on tap

        ],
      ),
    );
  }
}
