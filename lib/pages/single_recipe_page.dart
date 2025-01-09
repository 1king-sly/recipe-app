import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:recipe/components/recipe_owner_card.dart';
import 'package:recipe/constants/constants.dart';
import 'package:recipe/types/data_types.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SingleRecipePage extends StatefulWidget {
  final Recipe recipe;

  const SingleRecipePage({super.key, required this.recipe});

  @override
  State<SingleRecipePage> createState() => _SingleRecipePageState();
}

class _SingleRecipePageState extends State<SingleRecipePage> {
  @override
  Widget build(BuildContext context) {
    PageController _controller = PageController();
    List<Widget> ingredientWidgets =
        widget.recipe.ingredients.map((ingredient) {
      return Column(
        children: [
          Text(ingredient),
          const SizedBox(height: 2),
        ],
      );
    }).toList();
    List<Widget> instructionWidgets =
        widget.recipe.instructions.map((instruction) {
      return Column(
        children: [
          Text(instruction),
          const SizedBox(height: 2),
        ],
      );
    }).toList();

    final List<Widget> imageSliders = widget.recipe.images
        .map((item) => Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.asset(item,
                        fit: BoxFit.cover, width: double.infinity),
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
                        foregroundDecoration: const BoxDecoration(
                          color: Color.fromRGBO(255, 102, 14, 0.2),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                      ),
                    ),
                  ],
                ),
              ),
            ))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.recipe.name,
          style: const TextStyle(
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
              Text(
                widget.recipe.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      PageView(
                        controller: _controller,
                        children: imageSliders,
                      ),
                      Container(
                        alignment: const Alignment(0, 0.9),
                        child: SmoothPageIndicator(
                          controller: _controller,
                          count: imageSliders.length,
                          effect: const ExpandingDotsEffect(
                              dotHeight: 12,
                              dotWidth: 12,
                              activeDotColor: mainColor),
                        ),
                      )
                    ],
                  )),
              const SizedBox(
                height: 5,
              ),
              RecipeOwnerCard(
                user: RecipeOwner(
                    name: widget.recipe.user.name,
                    imagePath: widget.recipe.user.imagePath),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                ),
                child: Center(
                  child: Text(
                    widget.recipe.description,
                    // style: TextStyle(
                    //   fontSize: 14,
                    //   color: Colors.grey,
                    // ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider(),
              Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.alarm_outlined,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 5),
                  Text(widget.recipe.time),
                ],
              )),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Ingredients",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Row(children: [
                              const Icon(
                                Icons.people_outlined,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                widget.recipe.people.toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                ),
                              ),
                            ]),
                          ],
                        ),
                        const Divider(),
                        ...ingredientWidgets,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Instructions",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        const Divider(),
                        ...instructionWidgets,
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
