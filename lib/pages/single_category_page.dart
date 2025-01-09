import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:recipe/constants/constants.dart';
import 'package:recipe/pages/single_recipe_page.dart';
import 'package:recipe/types/data_types.dart';
import 'dart:developer';

class SingleCategoryPage extends StatefulWidget {
  final CategoryName categoryName;
  final List<Recipe> recipes;
  const SingleCategoryPage(
      {super.key, required this.categoryName, required this.recipes});

  @override
  State<SingleCategoryPage> createState() => _SingleCategoryPageState();
}

class _SingleCategoryPageState extends State<SingleCategoryPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.categoryName.name,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: mainColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: LazyLoadScrollView(
        onEndOfPage: () {},
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              itemCount: widget.recipes.length,
              itemBuilder: (context, index) {
                log(widget.recipes[index] as String);
                isFavorite =
                    favourites.contains(widget.recipes[index]) ? true : false;

                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => SingleRecipePage(
                        recipe: widget.recipes[index],
                      ),
                    ));
                  },
                  child: ListTile(
                    leading: Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(widget.recipes[index].images[0]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(widget.recipes[index].name),
                    subtitle: Text(
                      widget.recipes[index].description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        setState(() {
                          favourites.contains(widget.recipes[index])
                              ? null
                              : favourites.add(widget.recipes[index]);
                        });
                      },
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_outline,
                        color: isFavorite ? mainColor : Colors.grey,
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
