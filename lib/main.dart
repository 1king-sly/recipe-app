import 'package:flutter/material.dart';
import 'package:recipe/pages/home_page.dart';
import 'package:recipe/pages/splash_screen.dart';

void main() {
  runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner:false,
      home: const SplashScreen(),
    ));
}



