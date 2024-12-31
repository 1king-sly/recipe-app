import 'package:flutter/material.dart';
import 'package:recipe/components/categories.dart';
import 'package:recipe/components/search_bar.dart';
import 'package:recipe/constants/constants.dart';
import 'package:recipe/pages/create_recipe_page.dart';
import 'package:recipe/pages/dashboard_page.dart';
import 'package:recipe/pages/favorites_page.dart';
import 'package:recipe/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List screens = const [
    Home(),
    FavoritesPage(),
    CreateRecipePage(),
    DashboardPage(),
    ProfilePage(),
  ];
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
                Icons.favorite,
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
              icon: Icon(Icons.dashboard_outlined,
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
    return const Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            MySearchBar(),
            SizedBox(
              height: 20,
            ),
            Categories()
          ],
        ),
      )),
    );
  }
}
