import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  final List<String>?iconPaths;
  const CustomBottomNavBar({super.key, this.iconPaths});

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;
  final List<String> _iconPaths = [
    "assets/images/homeIcon.png",
    "assets/images/walletIcon.png",
    "assets/images/pending.png",
    "assets/images/moreIcon.png",
  ];

  final List<String> _labels = ["Home", "Wallet", "Requests", "More"];
String profile="assets/images/profileIcon.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Selected: ${_labels[_selectedIndex]}",
            style: const TextStyle(fontSize: 18)),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: () {

        },
      backgroundColor: Colors.transparent,
        elevation: 2,

        child: CircleAvatar(
          backgroundColor: Colors.grey[400],
          radius: 50,

          child: Image.asset(
            profile,
            width: 28,
            height: 28,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: _iconPaths.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? Colors.red : Colors.grey[600];
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(widget.iconPaths?.length==0||widget.iconPaths==null?_iconPaths[index]:widget.iconPaths?[index]??_iconPaths[index], width: 24, height: 24, color: color),
              const SizedBox(height: 3),
              Text(
                _labels[index],
                style: TextStyle(fontSize: 12, color: color),
              ),
            ],
          );
        },
        backgroundColor: Colors.grey[300]!,
        activeIndex: _selectedIndex,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        gapLocation: GapLocation.center,
        leftCornerRadius: 20,
        rightCornerRadius: 20,
        onTap: (index) => setState(() {
          _selectedIndex = index;}),
      ),
    );
  }
}
