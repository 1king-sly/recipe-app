import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:recipe/constants/constants.dart';
import 'package:recipe/pages/single_recipe_page.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: LazyLoadScrollView(
        onEndOfPage: () {},
        child: favourites.isEmpty
            ? Center(
                child: Text(
                "No recipes marked favourites",
                style: TextStyle(color: Colors.grey.shade600),
              ))
            : ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => SingleRecipePage(
                          recipe: favourites[index],
                        ),
                      ));
                    },
                    child: ListTile(
                      // titleAlignment: ListTileTitleAlignment.top,
                      leading: Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(favourites[index].images[0]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(favourites[index].name,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                      subtitle: Text(
                        favourites[index].description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: GestureDetector(
                        onTap: () {
                          setState(() {
                            favourites.remove(favourites[index]);
                          });
                        },
                        child: Icon(
                          Icons.delete_outline_outlined,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemCount: favourites.length),
      ),
    ));
  }
}
