import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:recipe/constants/constants.dart';
import 'package:recipe/pages/single_recipe_page.dart';
import 'package:recipe/types/data_types.dart';

class SingleCategoryPage extends StatefulWidget {
  final CategoryName categoryName;
  final List<Recipe> recipes;
  const SingleCategoryPage(
      {super.key, required this.categoryName, required this.recipes});

  @override
  State<SingleCategoryPage> createState() => _SingleCategoryPageState();
}

class _SingleCategoryPageState extends State<SingleCategoryPage> {
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
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => SingleRecipePage(
                        recipe: recipes[index],
                      ),
                    ));
                  },
                  child: ListTile(
                      leading: Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(recipes[index].images[0]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(recipes[index].name),
                      subtitle: Text(recipes[index].description,maxLines: 2,
          overflow: TextOverflow.ellipsis,)),
                );
              }),
        ),
      ),
    );
  }
}
