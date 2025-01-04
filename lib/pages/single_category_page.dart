import 'package:flutter/material.dart';
import 'package:recipe/components/recipe_card.dart';
import 'package:recipe/constants/constants.dart';
import 'package:recipe/types/data_types.dart';

class SingleCategoryPage extends StatefulWidget {
  final CategoryName categoryName;
  final List<Recipe> recipes;
  const SingleCategoryPage({super.key, required this.categoryName, required this.recipes});

  @override
  State<SingleCategoryPage> createState() => _SingleCategoryPageState();
}

class _SingleCategoryPageState extends State<SingleCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.categoryName.toString(),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: mainColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.78,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: images.length,
              itemBuilder: (context, index) {
                return RecipeCard(
                  imagePath: recipes[index].images[0],
                  recipeName: recipes[index].name,
                );
              }),
        ),
      ),
    );
  }
}
