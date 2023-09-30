import 'dart:convert';
import 'package:http/http.dart';
import 'package:news_app_with_api/model/article_model.dart';

//! Service for request the data from the API

class HomeServiceApi {
  final endPointURL =
      "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=18eb60d76bc143b59ff8b7bf2d228d87";

//! Function for requesting the data to the given URL

  Future<List<Article>> getArticles() async {
    Response res = await get(Uri.parse(endPointURL));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      //! Exception Handling

      throw ("Sorry! Can't Get Articles Right Now :(");
    }
  }
}
