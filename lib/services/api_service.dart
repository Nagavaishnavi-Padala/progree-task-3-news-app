import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/article.dart';

class ApiService {
  static const String _baseUrl =
      'https://jsonplaceholder.typicode.com/posts';

  Future<List<Article>> fetchArticles() async {
    final response = await http
        .get(Uri.parse(_baseUrl))
        .timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      return data
          .map((json) => Article.fromJson(json))
          .toList();
    }

    throw Exception(
      'Failed to load articles (${response.statusCode})',
    );
  }
}