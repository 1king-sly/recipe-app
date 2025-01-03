import 'package:flutter/material.dart';

class BlogCard extends StatefulWidget {
  const BlogCard({super.key});

  @override
  State<BlogCard> createState() => _BlogCardState();
}

class _BlogCardState extends State<BlogCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      width: double.infinity,
      child: Column(
        children: [
          Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                  "assets/images/user.jpg",
                ),
                fit: BoxFit.cover,
              ))),
          const SizedBox(height: 10),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: Row(children: [
              // if (widget.user.imagePath != null)
              Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("assets/images/user.jpg"),
                        fit: BoxFit.cover)),
              ),
              // else
              //   CircleAvatar(
              //     backgroundColor: Colors.grey.shade800,
              //     child: Text(widget.user.name[0]),
              //   ),
              const SizedBox(width: 10),
              const Text("Byrone Kingsly",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ))
            ]),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            width: double.infinity,
            child: const Text(
              "Blog description",
              style: TextStyle(fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
