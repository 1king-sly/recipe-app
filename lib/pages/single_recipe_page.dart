import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:recipe/components/recipe_owner_card.dart';
import 'package:recipe/constants/constants.dart';
import 'package:recipe/types/data_types.dart';

class SingleRecipePage extends StatefulWidget {
  final String imagePath;

  final List<Widget> imageSliders = images
      .map((item) => Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: const Text(
                          'Sample image',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ))
      .toList();
  SingleRecipePage({super.key, required this.imagePath});

  @override
  State<SingleRecipePage> createState() => _SingleRecipePageState();
}

class _SingleRecipePageState extends State<SingleRecipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Recipe Name",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: mainColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Recipe Name",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 5),
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
                items: widget.imageSliders,
              ),
              const SizedBox(
                height: 5,
              ),
              RecipeOwnerCard(
                user: RecipeOwner(
                    name: "Byrone Kingsly",
                    imagePath: "assets/images/user.jpg"),
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider(),
              const Center(child: Text("1 hr 30 mins")),
              const Divider(),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Ingredients",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              "2 People",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Text("1. One Cup of Water"),
                        SizedBox(height: 2),
                        Text("1. One Cup of Water"),
                        SizedBox(height: 2),
                        Text("1. One Cup of Water"),
                        SizedBox(height: 2),
                        Text("1. One Cup of Water"),
                        SizedBox(height: 2),
                        Text("1. One Cup of Water"),
                        SizedBox(height: 2),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Instructions",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        Divider(),
                        Text("1. Boil the water for 15 minutes"),
                        SizedBox(height: 2),
                        Text("1. Boil the water for 15 minutes"),
                        SizedBox(height: 2),
                        Text("1. Boil the water for 15 minutes"),
                        SizedBox(height: 2),
                        Text("1. Boil the water for 15 minutes"),
                        SizedBox(height: 2),
                        Text("1. Boil the water for 15 minutes"),
                        SizedBox(height: 2),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
