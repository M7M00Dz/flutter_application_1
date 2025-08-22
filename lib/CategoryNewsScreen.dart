import 'package:flutter/material.dart';

class CategoryNewsScreen extends StatelessWidget {
  final String category;

   CategoryNewsScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$category News"),
      ),
      body:Expanded(
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
    );
  }
}