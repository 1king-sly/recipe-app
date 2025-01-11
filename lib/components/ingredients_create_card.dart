import 'package:flutter/material.dart';

class IngredientsCreateCard extends StatefulWidget {
  final List<TextEditingController> ingredientControllers;

  const IngredientsCreateCard({super.key, required this.ingredientControllers});

  @override
  State<IngredientsCreateCard> createState() => _IngredientsCreateCardState();
}

class _IngredientsCreateCardState extends State<IngredientsCreateCard> {
  @override
  Widget build(BuildContext context) {
    int numberOfIngredientsList = widget.ingredientControllers.length;

    List<Widget> ingredientWidgets = List.generate(
      numberOfIngredientsList,
      (index) {
        return Padding(
          key: Key('$index'),
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: Row(children: [
                  const Icon(Icons.drag_indicator_outlined),
                  Expanded(
                    flex: 4,
                    child: TextField(
                      maxLines: null,
                      controller: widget.ingredientControllers[index],
                      decoration: InputDecoration(
                        hintText: index % 2 == 0 ? "100ml water" : "200g flour",
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        );
      },
    );
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.grey.shade200),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Ingredients",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Flexible(
                child: ReorderableListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    onReorder: (int oldIndex, int newIndex) {
                      setState(() {
                        if (newIndex > oldIndex) newIndex -= 1;
                        final controller =
                            widget.ingredientControllers.removeAt(oldIndex);
                        widget.ingredientControllers
                            .insert(newIndex, controller);
                      });
                    },
                    children: ingredientWidgets)),
            const SizedBox(height: 10),
            Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    widget.ingredientControllers.add(TextEditingController());
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
      ),
    );
  }
}
