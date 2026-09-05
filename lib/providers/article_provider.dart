import 'package:flutter/foundation.dart';

import '../models/article.dart';
import '../services/api_service.dart';

class ArticleProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<Article> _articles = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Article> get articles => _articles;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchArticles() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _articles = await _apiService.fetchArticles();
    } catch (error) {
      _errorMessage =
          'Unable to load articles. Please check your internet connection.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}