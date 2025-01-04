import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:recipe/components/blog_card.dart';
import 'package:recipe/constants/constants.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: LazyLoadScrollView(
          onEndOfPage: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return const BlogCard();
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                height: 15,
              ),
              itemCount: 20,
            ),
          ),
        ));
  }
}
