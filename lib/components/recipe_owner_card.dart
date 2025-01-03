import 'package:flutter/material.dart';
import 'package:recipe/constants/constants.dart';
import 'package:recipe/types/data_types.dart';

class RecipeOwnerCard extends StatefulWidget {
  final RecipeOwner user;

  const RecipeOwnerCard({super.key, required this.user});

  @override
  State<RecipeOwnerCard> createState() => _RecipeOwnerCardState();
}

class _RecipeOwnerCardState extends State<RecipeOwnerCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: primaryColor,
        ),
        child: Row(children: [
          if (widget.user.imagePath != null)
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(widget.user.imagePath!),
                      fit: BoxFit.cover)),
            )
          else
            CircleAvatar(
              backgroundColor: Colors.grey.shade800,
              child: Text(widget.user.name[0]),
            ),
          const SizedBox(width: 10),
          Text(widget.user.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ))
        ]));
  }
}
