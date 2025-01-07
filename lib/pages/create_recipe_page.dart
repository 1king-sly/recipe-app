import 'dart:io';
 
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
    return  Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children:[
            SizedBox(
              height:150,
              width:double.infinity,
              child: galleryFile != null ? GestureDetector(
                onTap:(){
                  _showPicker(context:context);
                },
                child:const Center(
                  child: Column(
                    children:[
                      Icon(Icons.photo_camera_front_sharp),
                       SizedBox( height:10),
                       Text("Select a photo")
                    ]
                  ),
                ),
              ): Container(
                height:double.infinity,
                width:double.infinity,
                decoration:BoxDecoration(
                  image:DecorationImage(
                    image:FileImage(galleryFile!),
                    fit:BoxFit.cover
                  )
                )
              )
            ),
          ]
        ),
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