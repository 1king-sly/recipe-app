import 'package:flutter/material.dart';
import 'package:recipe/constants/constants.dart';
import 'package:recipe/pages/splash_screen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: mainColor),
      useMaterial3: true,
    ),
    debugShowCheckedModeBanner: false,
    home: const SplashScreen(),
  ));
}
