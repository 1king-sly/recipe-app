import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:recipe/pages/home_page.dart';



class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Lottie.asset(
          "assets/animations/cook_splash.json",
          height: 90,
          width: 90,
        ),
      ),
      nextScreen: const HomePage(),
      duration: 10500,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
