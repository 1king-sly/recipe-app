import 'package:flutter/material.dart';
import 'package:recipe/constants/constants.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
  return const SafeArea(

    child:   Center(
      child: Text(" Favorites Page"),
    ));  }
}