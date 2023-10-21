import 'package:new_clocare_delivery_boy/screen/bottom_navigation/customer/customer_screen.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/home/home_screen.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/profile/profile_screen.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/work/work_screen.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
     WorkScreen(),
    const CustomerScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColor.primaryColor1,
        unselectedItemColor: Colors.black54,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.home),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.work),
            label: 'Work',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.upload),
            label: 'Customer',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.profile),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
