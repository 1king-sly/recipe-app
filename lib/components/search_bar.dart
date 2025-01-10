// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:recipe/constants/constants.dart';

class MySearchBar extends StatefulWidget {
  final Function(int) setSearchPageIndex;

  const MySearchBar({super.key, required this.setSearchPageIndex});

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.setSearchPageIndex(5);
      },
      child: Container(
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
            const Flexible(
              flex: 4,
              child: TextField(
                enabled:false,
                decoration: InputDecoration(
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
    );
  }
}
