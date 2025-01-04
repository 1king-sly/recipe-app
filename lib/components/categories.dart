import 'package:flutter/material.dart';
import 'package:recipe/pages/single_category_page.dart';
import 'package:recipe/types/data_types.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) => SingleCategoryPage(
                            categoryName: categories[index].name.toString())),
                  );
                },
                child: Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(categories[index].imagePath),
                          fit: BoxFit.cover)),
                ),
              ),
              const SizedBox(height: 5),
              Text(categories[index].name.toString(),
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.normal))
            ],
          );
        },
        itemCount: categories.length,
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          width: 20,
        ),
      ),
    );
  }
}
