
import 'package:flutter/material.dart';
import 'package:recipe/constants/constants.dart';

class RecipeCard extends StatefulWidget {
  final String imagePath;
  const RecipeCard({super.key, required this.imagePath});

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
                        const Text(
                          "Recipe Name",
                          style: TextStyle(fontSize: 13, color: Colors.white),
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
