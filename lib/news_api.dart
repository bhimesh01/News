import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'article.dart';

class News {
  List<Article> news = [];
  Future<void> getNews() async {
    var url = Uri.parse(
        "http://newsapi.org/v2/top-headlines?country=in&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=cb472ff5149f4d4d97a7b0cc35ac7f25");

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            title: element['title'] ?? '',
            author: element['author'] ?? '',
            description: element['description'] ?? '',
            urlToImage: element['urlToImage'] ?? '',
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"] ?? '',
            articleUrl: element["url"] ?? '',
          );
          news.add(article);
        }
      });
    }
  }
}

class NewsForCategorie {
  List<Article> news = [];

  Future<void> getNewsForCategory(String category) async {
    /*String url = "http://newsapi.org/v2/everything?q=$category&apiKey=${apiKey}";*/
    var url = Uri.parse(
        "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=cb472ff5149f4d4d97a7b0cc35ac7f25");

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            title: element['title'] ?? '',
            author: element['author'] ?? '',
            description: element['description'] ?? '',
            urlToImage: element['urlToImage'] ?? '',
            publshedAt: DateTime.parse(element['publishedAt'] ?? ''),
            content: element["content"] ?? '',
            articleUrl: element["url"],
          );
          news.add(article);
        }
      });
    }
  }
}
