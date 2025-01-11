import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:recipe/constants/constants.dart';
import 'package:recipe/pages/single_recipe_page.dart';
import 'package:recipe/types/data_types.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController = TextEditingController();
  List filteredRecipes = [];

  void updateSearchResults() {
    setState(() {
      filteredRecipes = recipes
          .where(
            (recipe) =>
                recipe.name
                    .toLowerCase()
                    .contains(searchController.text.toLowerCase()) ||
                recipe.description
                    .toLowerCase()
                    .contains(searchController.text.toLowerCase()),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            height: 45,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: primaryColor,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              children: [
                const Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 25,
                ),
                const SizedBox(width: 10),
                Flexible(
                  flex: 4,
                  child: TextField(
                    autofocus: true,
                    controller: searchController,
                    onChanged: (_) => updateSearchResults(),
                    decoration: const InputDecoration(
                        hintText: "Search...",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none),
                  ),
                ),
                Container(
                  height: 25,
                  width: 1.5,
                  color: Colors.grey,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.tune,
                      color: Colors.grey,
                      size: 25,
                    ))
              ],
            ),
          ),
          const SizedBox(height: 10),
          searchController.text.isEmpty
              ? const SizedBox(
                  height: 400,
                  width: double.infinity,
                )
              : LazyLoadScrollView(
                  onEndOfPage: () {},
                  child: Flexible(
                      child: Wrap(
                    children: filteredRecipes.map<Widget>((recipe) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => SingleRecipePage(
                              recipe: recipe,
                            ),
                          ));
                        },
                        child: ListTile(
                          leading: Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(recipe.images[0]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text(
                            recipe.name,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            recipe.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: GestureDetector(
                            onTap: () {
                              setState(() {
                                // Toggle favorite status
                                favourites.contains(recipe) ? false : true;
                              });
                            },
                            child: Icon(
                              favourites.contains(recipe)
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              color: favourites.contains(recipe)
                                  ? mainColor
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  )),
                ),
        ],
      ),
    ));
  }
}
