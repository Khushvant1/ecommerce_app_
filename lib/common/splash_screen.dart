import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
          duration: 2000,
          splash: 'assets/images/logo.png',
          nextScreen: IntroScreen(),
          splashTransition: SplashTransition.fadeTransition,
          // pageTransitionType: PageTransitionType.scale,
          backgroundColor: Colors.white
    );
  }
}
