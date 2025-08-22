import 'package:flutter/material.dart';
import 'package:flutter_application_1/CategoryNewsScreen.dart';

void main() {
  runApp(NewsApp());
} 





class NewsApp extends StatelessWidget {
   NewsApp({Key? key}) : super(key: key);

  final List<String> categories = [
  "Sports", "Politics", "Business", "Tech",
  "Health", "Travel", "Science", "funny",
];

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
                    itemBuilder: (context, index) => 
                    GestureDetector(onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryNewsScreen(category: categories[index],)));
                    },
                      child: Column(
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
                           Text(
                            categories[index],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
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
              itemCount: 10,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
          
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "News Title ",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),             
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 5),
                          Text(
                            "This is a short description for news item number $index. It looks better wrapped.",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.grey.shade800,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),

          
                       ClipRRect(
                         borderRadius: BorderRadius.circular(17),
                         child: Image.asset(
                           "assets/image.png",
                           height: 120,
                           width: 120,
                           fit: BoxFit.cover,
                         ),
                       ),
                     ],
                   ),
                 ),
               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}
