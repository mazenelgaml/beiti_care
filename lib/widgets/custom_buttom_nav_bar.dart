import 'dart:ui';

import 'package:beiti_care/ui/nurse/home/nurse_home_screen.dart';
import 'package:beiti_care/ui/nurse/request/request_screen.dart';
import 'package:beiti_care/ui/nurse/wallet/wallet_screen.dart';
import 'package:beiti_care/ui/profile/profile_screen.dart';
import 'package:beiti_care/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/profile/More_screen.dart';

class CurvedBottomNavBar extends StatelessWidget {
  final Color? homeIcon;
  final Color? walletIcon;
  final String? profileIcon;
  final Color? requestsIcon;
  final Color? moreIcon;
  const CurvedBottomNavBar({super.key, this.homeIcon, this.walletIcon, this.profileIcon, this.requestsIcon, this.moreIcon});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CustomPaint(
          size: Size(MediaQuery.of(context).size.width, 80),
          painter: BottomNavBarPainter(),
        ),
        Positioned(
          top: -26,
          left: MediaQuery.of(context).size.width / 2 - 50,
          child: InkWell(
            onTap: (){
              Get.off(()=>ProfileScreen());
            },
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Color(0xffD9D9D9),
              child: Image.asset(
                profileIcon??'assets/images/profileIcon.png',
                width: 30,
                height: 30,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem('assets/images/homeIcon.png', "Home", homeIcon??Color(0xff797979),(){Get.to(()=>NurseHomeScreen());}),
              _buildNavItem('assets/images/walletIcon.png', "Wallet", walletIcon??Color(0xff797979),(){Get.to(()=>WalletScreen());}),
              SizedBox(width: 50), // Space for center profile
              _buildNavItem('assets/images/pending.png', "Requests", requestsIcon??Color(0xff797979),(){Get.to(()=>RequestsScreen());}),
              _buildNavItem('assets/images/moreIcon.png', "More", moreIcon??Color(0xff797979),(){Get.to(()=>MoreScreen());}),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(String imagePath, String label, Color color,Function onTap) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            width: 24,
            height: 24,
            color: color,
          ),
          Text(label, style: TextStyle(color: color, fontSize: 12)),
        ],
      ),
    );
  }
}

class BottomNavBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.grey.shade300;

    // Define border radius
    double borderRadius = 20.0;

    // Create a rounded rectangle path
    RRect roundedRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(borderRadius),
    );

    // Clip the rounded rectangle
    canvas.clipRRect(roundedRect);

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.5, 80, size.width * 0.65, 2);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
