import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/c_models.dart';
import 'package:flutter_application_1/services/news_services.dart';
class Science_Page extends StatefulWidget {
  final String category;

   Science_Page({Key? key, required this.category}) : super(key: key);

  @override
  State<Science_Page> createState() => _Science_PageState();
}

class _Science_PageState extends State<Science_Page> {
  @override

void initState() {
    getData();
    super.initState();
  }

List<c_models> ScienceList = [];
Future<void> getData() async {
  
  ScienceList = await NewsServices().getscienceNews();
  setState(() {});
}


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body:Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(thickness: 1.2),
              itemCount: ScienceList.length,
          
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
          
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [


                          Text(
                            ScienceList[index].title??"title not found",
                        
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),             
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),


                          SizedBox(height: 5),


                          Text(
                            ScienceList[index].subtitle??"description not found",
                       
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.grey.shade800,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),


                          SizedBox(height: 5),


                          Text(
                            ScienceList[index].url??"url not found",
                        
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Colors.grey.shade800,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),


                        ],
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