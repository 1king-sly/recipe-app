import 'package:flutter/material.dart';

class CreateRecipePage extends StatefulWidget {
  const CreateRecipePage({super.key});

  @override
  State<CreateRecipePage> createState() => _CreateRecipePageState();
}

class _CreateRecipePageState extends State<CreateRecipePage> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(child:  Center(
      child: Text("Create Recipe Page"),
    ));
  }
}