import 'package:flutter/material.dart';
import 'package:ecommerce_app/dashboard_screen.dart';
import 'package:ecommerce_app/screens/favorite_screen.dart';
import 'package:ecommerce_app/screens/search_screen.dart';
import 'package:ecommerce_app/screens/setting_screen.dart';
import 'package:ecommerce_app/screens/shop_cart_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key});

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int myCurrentIndex = 0;

  final List<Widget> pages = [
    DashboardScreen(),
    FavoriteScreen(),
    ShopCartScreen(),
    SearchScreen(),
    SettingScreen()
  ];

  void onTabTapped(int index) {
    setState(() {
      myCurrentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          pages[myCurrentIndex],
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 56.h,
              width: 375.w,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  // topLeft: Radius.circular(24),
                  // topRight: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Home
                  navItem(icon: Icons.home_outlined, index: 0, label: 'Home'),

                  /// Wishlist
                  navItem(icon: Icons.favorite_border, index: 1, label: 'Wishlist'),

                  const SizedBox(width: 60), // space for cart button

                  /// Search
                  navItem(icon: Icons.search, index: 3, label: 'Search'),

                  /// Settings
                  navItem(icon: Icons.settings_outlined, index: 4, label: 'Setting'),
                ],
              ),
            ),
          ),
          // cart button
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () => onTabTapped(2),
                child: Container(
                  height: 56,
                  width: 53.85,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: myCurrentIndex == 2 ? Colors.redAccent : Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 14,
                      )
                    ],
                  ),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: myCurrentIndex == 2 ? Colors.white : Colors.black,
                    // color: Colors.black,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///  Custom nav item widget
  Widget navItem({required IconData icon, required int index, required String label}) {
    return GestureDetector(
      onTap: () => onTabTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: myCurrentIndex == index ? Colors.redAccent : Colors.black,
            size: 28,
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: GoogleFonts.montserrat(
              fontSize: 11.sp,
              color: myCurrentIndex == index ? Colors.redAccent : Colors.black,
              fontWeight: FontWeight.w500
            ),
          )
        ],
      ),
    );
  }
}
