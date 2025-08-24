import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/c_models.dart';
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

  Future<List<c_models>> getSportNews() async {
    Response response = await dio.get(
      'https://newsapi.org/v2/top-headlines/sources?category=sports&apiKey=9e33e104a56b434ca8b0030e2ec7acd2',
    );
    Map<String, dynamic> datafromJSON = response.data;
    List<dynamic> articles = datafromJSON['sources'];

    List<c_models> generalNews = [];
    for (var article in articles) {
      c_models sportList = c_models(
        title: article['name'],
        subtitle: article['description'],
        url: article['url'],
      );
      generalNews.add(sportList);
    }
    return generalNews;
  }

    Future<List<c_models>> getscienceNews() async {
    Response response = await dio.get(
      'https://newsapi.org/v2/top-headlines/sources?category=science&apiKey=9e33e104a56b434ca8b0030e2ec7acd2',
    );
    Map<String, dynamic> datafromJSON = response.data;
    List<dynamic> articles = datafromJSON['sources'];

    List<c_models> generalNews = [];
    for (var article in articles) {
      c_models scienceList = c_models(
        title: article['name'],
        subtitle: article['description'],
        url: article['url'],
      );
      generalNews.add(scienceList);
    }
    return generalNews;
  }
}
