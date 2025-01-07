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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 150,
            width: double.infinity,
            child: galleryFile != null
                ? GestureDetector(
                    onTap: () {
                      _showPicker(context: context);
                    },
                    child: const Center(
                      child: Column(children: [
                        Icon(Icons.photo_camera_front_sharp),
                        SizedBox(height: 10),
                        Text("Select a photo")
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
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              const TextField(
                decoration: InputDecoration(
                  hintText: "Title of your amazing dish...",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
              const SizedBox(height: 10),
              const TextField(
                minLines: null,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  hintText: "Description of your amazing dish...",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
              const SizedBox(height: 10),
              const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Serves"),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "2 people",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ]),
              const SizedBox(height: 10),
              const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Cook Time"),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "1hr 30mins",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ]),
              const SizedBox(height: 10),
              const IngredientsCreateCard(),
              const SizedBox(height: 10),
              const InstructionsCreateCard(),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor:Colors.grey.shade900,
                      disabledBackgroundColor: Colors.grey.shade200,
                      disabledForegroundColor:Colors.grey.shade500,
                      padding:const EdgeInsets.all(10),

                    ),
                    onPressed:null,
                    child: const Text("Save"),
                  ),

                  const SizedBox(width:5),

                      OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor:mainColor,
                      disabledBackgroundColor: mainColor,
                      disabledForegroundColor:Colors.grey.shade500,
                      padding:const EdgeInsets.all(10),

                    ),
                    onPressed:null,
                    child: const Text("Publish"),
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
