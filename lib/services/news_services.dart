import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/news_model.dart';

class NewsServices {
  final dio = Dio();

  Future<List<NewsModel>> getGereralNews() async {
    Response response = await dio.get(
      'https://newsapi.org/v2/everything?q=bitcoin&apiKey=9e33e104a56b434ca8b0030e2ec7acd2',
    );
    Map<String, dynamic> datafromJSON = response.data;
    List<dynamic> articles = datafromJSON['articles'];

    List<NewsModel> generalNews = [];
    for (var article in articles) {
      NewsModel GeneralList = NewsModel(
        title: article['title'],
        description: article['description'],
        image: article['urlToImage'],
      );
      generalNews.add(GeneralList);
    }
    return generalNews;
  }
}
