import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NewsController extends GetxController {
  var newsList = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchNews();
  }

  Future<void> fetchNews() async {
    final String url =
        'https://newsapi.org/v2/everything?q=health+care&apiKey=a937dacf63a248118bcd897fdb5ffccb';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> result = jsonDecode(response.body);
      if (result['status'] == 'ok') {
        final articles = result['articles'] as List<dynamic>;
        newsList.clear();
        articles.forEach((article) {
          newsList.add({
            'image': article['urlToImage'] ?? '',
            'title': article['title'] ?? '',
            'description': article['description'] ?? '',
            'author': article['author'] ?? '',
            'publishedAt': article['publishedAt'] ?? '',
            'url': article['url'] ?? '',
          });
        });
      }
    } else {
      print('Failed to load news');
    }
  }
}
