import 'package:flutter/material.dart';
import 'package:flutter_application_1/Custom_GridView.dart';
import 'package:flutter_application_1/models/c_models.dart';
import 'package:flutter_application_1/models/news_model.dart';
import 'package:flutter_application_1/services/news_services.dart';

void main() {
  runApp(NewsApp());
} 



class NewsApp extends StatefulWidget {
   NewsApp({Key? key}) : super(key: key);

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  @override

void initState() {
    getData();
    super.initState();
  }

List<NewsModel> generalNew = [];
List<c_models> sportList = [];
Future<void> getData() async {
  generalNew = await NewsServices().getGereralNews();
  sportList = await NewsServices().getSportNews();
  setState(() {});
}




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


              Custom_GridView(),

              Divider(thickness: 1),

              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "General News",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),


              Divider(thickness: 1),

              
             Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(thickness: 1.2),
              itemCount: generalNew.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
          
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            generalNew[index].title??"No Title Found ", 
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),             
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 5),
                          Text(
                            generalNew[index].description??"No description found",
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
                         child: Image.network(
                           generalNew[index].image??"https://cdn3.iconfinder.com/data/icons/file-and-folder-outline-icons-set/144/Image_Error-1024.png",
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
