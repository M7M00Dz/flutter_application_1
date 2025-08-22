import 'package:flutter/material.dart';

void main() {
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('News'),
          centerTitle: false,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: SizedBox(
                  height: 240,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 15,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) => Column(
                      children: [
                        Container(
                          height: 85,
                          width: 85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage("assets/image.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Text(
                          "Title",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),

                    itemCount: 8,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                  ),
                ),
              ),
              Divider(thickness: 1),

              Expanded(
                child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(thickness: 1.2),
                  itemBuilder: (context, index) => SizedBox(
                    height: 200,
                    width: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "newss title",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 25,
                              ),
                            ),
                            Text(
                              "newss description",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 25,
                                color: Colors.grey.shade800,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          
                          height: 140,
                          width: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            image: DecorationImage(
                              image: AssetImage("assets/image.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  itemCount: 10,
                  shrinkWrap: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
