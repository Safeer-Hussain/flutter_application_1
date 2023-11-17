import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/bottom_nav_bar.dart';

import 'cart_page.dart';
import 'shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: _pages[_selectedIndex],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
    );
  }

  final List _pages = [const ShopPage(), const CartPage()];

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
