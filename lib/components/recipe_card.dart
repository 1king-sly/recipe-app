import 'package:flutter/material.dart';
import 'package:recipe/constants/constants.dart';

class RecipeCard extends StatelessWidget {
  final String imagePath;
  const RecipeCard({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: primaryColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Image.asset(
                    imagePath,
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Recipe Name",
                        style: TextStyle(
                          fontSize: 12,
                        ))),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
