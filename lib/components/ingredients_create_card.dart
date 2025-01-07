import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IngredientsCreateCard extends StatefulWidget {
   int numberOfIngredientsList;
   IngredientsCreateCard(
      {super.key, required this.numberOfIngredientsList});

  @override
  State<IngredientsCreateCard> createState() => _IngredientsCreateCardState();
}

class _IngredientsCreateCardState extends State<IngredientsCreateCard> {
  @override
  Widget build(BuildContext context) {
    List<Widget> ingredientWidgets = List.generate(
      widget.numberOfIngredientsList,
      (index) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {},
              child: Row(children: [
                const Icon(Icons.drag_indicator_outlined),
                Expanded(
                  flex: 4,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: index % 2 == 0 ? "100ml water" : "200g flour",
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ]),
            ),
          ],
        );
      },
    );
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: Colors.grey.shade200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Ingredients",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          ListView(children: ingredientWidgets),
          const SizedBox(height: 10),
          Center(
            child: GestureDetector(
              onTap: () {
                 setState(() {
                  widget.numberOfIngredientsList += 1;
                });
              },
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_outlined),
                    SizedBox(width: 10),
                    Text("Add Ingredient")
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
