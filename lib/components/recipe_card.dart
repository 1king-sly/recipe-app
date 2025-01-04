import 'package:flutter/material.dart';
import 'package:recipe/constants/constants.dart';
import 'package:recipe/pages/single_recipe_page.dart';
import 'package:recipe/types/data_types.dart';

class RecipeCard extends StatefulWidget {
  final String imagePath;
  final String recipeName;
  const RecipeCard({super.key, required this.imagePath, required this.recipeName});

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
                final recipe = recipes.firstWhere(
          (recipe) => recipe.name == widget.recipeName,
          orElse: () => throw Exception('Recipe not found'),
        );
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (BuildContext context) => SingleRecipePage(
              imagePath: widget.imagePath, recipe:recipe ,
            ),
          ),
        );
      },
      onDoubleTap: () {
        setState(() {
          isFavorite = isFavorite ? false : true;
        });
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.only(topRight: Radius.circular(20)),
              color: primaryColor,
              image: DecorationImage(
                image: AssetImage(
                  widget.imagePath,
                ),
                fit: BoxFit.cover,
              ),
            ),
            foregroundDecoration: const BoxDecoration(
              color: Color.fromRGBO(255, 102, 14, 0.2),
              borderRadius: BorderRadius.only(topRight: Radius.circular(20)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(color: Colors.black),
                    padding: const EdgeInsets.only(left: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(
                          widget.recipeName,
                          style:const TextStyle(fontSize: 13, color: Colors.white),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isFavorite = isFavorite ? false : true;
                            });
                          },
                          icon: Icon(
                            isFavorite
                                ? Icons.favorite
                                : Icons.favorite_outline,
                            color: isFavorite ? mainColor : Colors.white,
                          ),
                        )
                      ],
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
