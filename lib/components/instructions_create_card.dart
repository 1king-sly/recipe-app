import 'package:flutter/material.dart';

class InstructionsCreateCard extends StatefulWidget {
  final List<TextEditingController> instructionControllers;

  const InstructionsCreateCard(
      {super.key, required this.instructionControllers});

  @override
  State<InstructionsCreateCard> createState() => _InstructionsCreateCardState();
}

class _InstructionsCreateCardState extends State<InstructionsCreateCard> {
  @override
  Widget build(BuildContext context) {
    int numberOfInstructionsList = widget.instructionControllers.length;
    List<Widget> ingredientWidgets =
        List.generate(numberOfInstructionsList, (index) {
      return Padding(
        key: Key('$index'),
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: GestureDetector(
          onTap: () {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        (index + 1).toString(),
                        style: TextStyle(color: Colors.grey.shade900),
                      ),
                    ),
                  ),
                  Icon(Icons.drag_indicator_outlined,
                      size: 16, color: Colors.grey.shade500),
                ],
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  maxLines: null,
                  controller: widget.instructionControllers[index],
                  decoration: InputDecoration(
                    hintText: index % 2 == 0
                        ? "Mix the flour with water until it thickens"
                        : "Cover the mixture and leave it to sit at room temperature for 24 - 36 hours",
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.grey.shade200),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Instructions",
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
                        widget.instructionControllers.removeAt(oldIndex);
                    widget.instructionControllers.insert(newIndex, controller);
                  });
                },
                children: ingredientWidgets,
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    widget.instructionControllers.add(TextEditingController());
                  });
                },
                child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_outlined),
                      SizedBox(width: 10),
                      Text("Add Instruction")
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
