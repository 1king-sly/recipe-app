import 'package:flutter/material.dart';

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
              Container(
                width: 65,
                height: 65,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/appstore.png'),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(height: 5),
              const Text("Categories",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal))
            ],
          );
        },
        itemCount: 20,
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          width: 20,
        ),
      ),
    );
  }
}
