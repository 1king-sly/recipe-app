import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:recipe/components/favorites_recipe_card.dart';
import 'package:recipe/constants/constants.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: LazyLoadScrollView(
        onEndOfPage: () {},
        child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return FavoriteRecipeCard(imagePath: images[index]);
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: 10),
            itemCount: images.length),
      ),
    ));
  }
}
