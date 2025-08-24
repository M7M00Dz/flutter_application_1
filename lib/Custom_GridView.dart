import 'package:flutter/material.dart';
import 'package:flutter_application_1/CategoryNewsScreen.dart';
import 'package:flutter_application_1/Science_Page.dart';

class Custom_GridView extends StatelessWidget {
  Custom_GridView({super.key});

  final List<Widget> pages = [
  CategoryNewsScreen(category: "sports",),
  Science_Page(category: "science",),
  Science_Page(category: "science",),
  Science_Page(category: "science",),
  Science_Page(category: "science",),
  Science_Page(category: "science",),
  Science_Page(category: "science",),
  Science_Page(category: "science",),
];


  final List<String> categories = [
    "Sports",
    "Politics",
    "Business",
    "Tech",
    "Health",
    "Travel",
    "Science",
    "funny",
  ];
  final List<String> images = [
    "assets/img1.jpg",
    "assets/img2.jpg",
    "assets/img3.jpg",
    "assets/img4.jpg",
    "assets/img5.jpg",
    "assets/img6.jpg",
    "assets/img7.jpg",
    "assets/img8.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: SizedBox(
        height: 240,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => pages[index],
                ),
              );
            },
            child: Column(
              children: [
                Container(
                  height: 85,
                  width: 85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(images[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  categories[index],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
              ],
            ),
          ),

          itemCount: categories.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }
}
