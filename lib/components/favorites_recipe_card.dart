import 'package:flutter/material.dart';

class FavoriteRecipeCard extends StatefulWidget {
  final String imagePath;
  const FavoriteRecipeCard({super.key, required this.imagePath});

  @override
  State<FavoriteRecipeCard> createState() => _FavoriteRecipeCardState();
}

class _FavoriteRecipeCardState extends State<FavoriteRecipeCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        height: 80,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.imagePath,
              width: 100,
              height: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Recipe Name",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.delete_outline_outlined),
                        iconSize: 20,
                        color: Colors.grey,
                      )
                    ],
                  ),
                  const Text(
                    "Recipe Description",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}