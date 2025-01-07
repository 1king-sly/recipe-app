import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InstructionsCreateCard extends StatefulWidget {
  int numberOfInstructionsList;
   InstructionsCreateCard(
      {super.key, required this.numberOfInstructionsList});

  @override
  State<InstructionsCreateCard> createState() => _InstructionsCreateCardState();
}

class _InstructionsCreateCardState extends State<InstructionsCreateCard> {
  @override
  Widget build(BuildContext context) {
    List<Widget> ingredientWidgets = List.generate(
      widget.numberOfInstructionsList,
      (index) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {},
              child: Row(children: [
                Column(
                  children: [
                    Container(
                        height: 10,
                        width: 10,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Text({index + 1}.toString(),
                            style: TextStyle(color: Colors.grey.shade900))),
                    const Icon(Icons.drag_indicator_outlined),
                  ],
                ),
                Expanded(
                  flex: 4,
                  child: TextField(
                    minLines: null,
                    maxLines: null,
                    expands: true,
                    decoration: InputDecoration(
                      hintText: index % 2 == 0
                          ? "Mix the flour with water until it thickens"
                          : "Cover the mixture and leave it to sit at room temperature for 24 - 36 hours",
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
            "Instructions",
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
                  widget.numberOfInstructionsList += 1;
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
