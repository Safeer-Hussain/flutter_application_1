import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  final void Function(int)? onTabChange;
  const MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: GNav(
          color: Colors.grey[400],
          tabActiveBorder: Border.all(color: Colors.black87),
          tabBackgroundColor: Colors.grey.shade100,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          onTabChange: onTabChange,
          tabs: const [
            GButton(icon: Icons.home, text: "Shop"),
            GButton(icon: Icons.shopping_bag_rounded, text: "Cart"),
          ]),
    );
  }
}
