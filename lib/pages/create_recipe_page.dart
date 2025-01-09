import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recipe/components/ingredients_create_card.dart';
import 'package:recipe/components/instructions_create_card.dart';
import 'package:recipe/constants/constants.dart';

class CreateRecipePage extends StatefulWidget {
  const CreateRecipePage({super.key});

  @override
  State<CreateRecipePage> createState() => _CreateRecipePageState();
}

class _CreateRecipePageState extends State<CreateRecipePage> {
  File? galleryFile;
  final picker = ImagePicker();

  int numberOfInstructionsList = 2;

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
              const IngredientsCreateCard(),
              const SizedBox(height: 10),
              const InstructionsCreateCard(),
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
                    onPressed: null,
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
