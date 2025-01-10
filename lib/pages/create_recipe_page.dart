import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recipe/components/ingredients_create_card.dart';
import 'package:recipe/components/instructions_create_card.dart';
import 'package:recipe/constants/constants.dart';

import 'package:recipe/types/data_types.dart';

class CreateRecipePage extends StatefulWidget {
  final Function(int) onRecipeCreated;
  const CreateRecipePage({super.key, required this.onRecipeCreated});

  @override
  State<CreateRecipePage> createState() => _CreateRecipePageState();
}

class _CreateRecipePageState extends State<CreateRecipePage> {
  File? galleryFile;
  final picker = ImagePicker();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController peopleController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  final List<TextEditingController> ingredients = [
    TextEditingController(),
    TextEditingController(),
  ];
  final List<TextEditingController> instructions = [
    TextEditingController(),
    TextEditingController(),
  ];

  @override
  void dispose() {
    for (var controller in ingredients) {
      controller.dispose();
    }
    for (var controller in instructions) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
            ),
            height: 250,
            width: double.infinity,
            child: galleryFile == null
                ? Center(
                    child: GestureDetector(
                      onTap: () {
                        _showPicker(context: context);
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.photo, color: Colors.grey.shade500),
                            const SizedBox(height: 10),
                            Text(
                              "Select a photo",
                              style: TextStyle(
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ]),
                    ),
                  )
                : Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: FileImage(galleryFile!), fit: BoxFit.cover),
                    ),
                  ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              TextField(
                maxLines: null,
                controller: titleController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  hintText: "Title of your amazing dish...",
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: descController,
                maxLines: null,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  hintText: "Description of your amazing dish...",
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
              const SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text("Serves"),
                TextField(
                  controller: peopleController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    hintText: "2 people",
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    constraints: const BoxConstraints(
                      maxWidth: 100,
                      maxHeight: 30,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ]),
              const SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text("Cook Time"),
                TextField(
                  controller: timeController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    hintText: "1hr 30mins",
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    constraints: const BoxConstraints(
                      maxWidth: 150,
                      maxHeight: 30,
                    ),
                  ),
                ),
              ]),
              const SizedBox(height: 10),
              IngredientsCreateCard(
                ingredientControllers: ingredients,
              ),
              const SizedBox(height: 10),
              InstructionsCreateCard(
                instructionControllers: instructions,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.grey.shade900,
                      disabledBackgroundColor: Colors.grey.shade200,
                      disabledForegroundColor: Colors.grey.shade500,
                      padding: const EdgeInsets.all(10),
                    ),
                    onPressed: null,
                    child: const Text("Save"),
                  ),
                  const SizedBox(width: 5),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: mainColor,
                      disabledBackgroundColor: mainColor,
                      disabledForegroundColor: Colors.grey.shade500,
                      padding: const EdgeInsets.all(10),
                    ),
                    onPressed: () {
                      List<String> ingredientList = ingredients
                          .map((controller) => controller.text)
                          .toList();

                      List<String> instructionList = instructions
                          .map((controller) => controller.text)
                          .toList();

                      recipes.insert(
                          0,
                          Recipe(
                            category: CategoryName.Lunch,
                            people: int.parse(peopleController.text),
                            name: titleController.text,
                            description: descController.text,
                            time: timeController.text,
                            user: RecipeOwner(name: "John Doe"),
                            images: ['assets/images/pilau.jpg'],
                            ingredients: ingredientList,
                            instructions: instructionList,
                          ));

                      widget.onRecipeCreated(0);
                    },
                    child: const Text(
                      "Publish",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ]),
          )
        ]),
      ),
    );
  }

  void _showPicker({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  getImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future getImage(
    ImageSource img,
  ) async {
    final pickedFile = await picker.pickImage(source: img);
    XFile? xfilePick = pickedFile;

    setState(
      () {
        if (xfilePick != null) {
          galleryFile = File(pickedFile!.path);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(// is this context <<<
              const SnackBar(content: Text('Nothing is selected')));
        }
      },
    );
  }
}
