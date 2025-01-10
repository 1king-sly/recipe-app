import 'package:flutter/material.dart';
import 'package:recipe/components/categories.dart';
import 'package:recipe/components/recipe_card.dart';
import 'package:recipe/components/search_bar.dart';
import 'package:recipe/constants/constants.dart';
import 'package:recipe/pages/create_recipe_page.dart';
import 'package:recipe/pages/blog_page.dart';
import 'package:recipe/pages/favorites_page.dart';
import 'package:recipe/pages/profile_page.dart';
import 'package:recipe/types/data_types.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  int currentIndex = 0;
  List<Widget> screens = [];
  
  @override
  void initState() {
    super.initState();
    screens = [
     const Home(),
    const  FavoritesPage(),
      CreateRecipePage(onRecipeCreated: setCurrentIndex),
    const  BlogPage(),
    const  ProfilePage(),
    ];
  }

  // Function to update the currentIndex
  void setCurrentIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Recipes",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        backgroundColor: mainColor,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_outlined,
                color: Colors.white,
                size: 20,
              ))
        ],
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              currentIndex = 2;
            });
          },
          shape: const CircleBorder(),
          backgroundColor: mainColor,
          child: const Icon(Icons.add_circle_outlined,
              color: Colors.white, size: 30)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        height: 60,
        color: Colors.white,
        elevation: 1,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 0;
                });
              },
              icon: Icon(
                Icons.home_outlined,
                color: currentIndex == 0 ? mainColor : Colors.grey.shade400,
                size: 25,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 1;
                });
              },
              icon: Icon(
                Icons.favorite_outline,
                color: currentIndex == 1 ? mainColor : Colors.grey.shade400,
                size: 25,
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 3;
                });
              },
              icon: Icon(Icons.newspaper_outlined,
                  color: currentIndex == 3 ? mainColor : Colors.grey.shade400,
                  size: 25),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 4;
                });
              },
              icon: Icon(
                Icons.person,
                color: currentIndex == 4 ? mainColor : Colors.grey.shade400,
                size: 25,
              ),
            ),
          ],
        ),
      ),
      body: screens[currentIndex],
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const MySearchBar(),
            const SizedBox(
              height: 20,
            ),
            const Categories(),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Popular Recipes",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_right_outlined)),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.78,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return RecipeCard(
                    imagePath: recipes[index].images[0],
                    recipeName: recipes[index].name,
                    recipe: recipes[index],
                  );
                })
          ],
        ),
      ),
      ),
    );
  }
}
