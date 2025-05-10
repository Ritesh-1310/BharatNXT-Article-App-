import 'package:flutter/material.dart';
import '../models/article_model.dart';
import '../repositories/article_repository.dart';

class ArticleController with ChangeNotifier {
  final ArticleRepository repository;

  ArticleController({required this.repository});

  List<Article> _articles = [];
  List<Article> _filteredArticles = [];
  bool _isLoading = false;
  String _error = '';
  String _searchQuery = '';

  List<Article> get articles => _filteredArticles;
  bool get isLoading => _isLoading;
  String get error => _error;
  bool get hasError => _error.isNotEmpty;

  Future<void> fetchArticles() async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      _articles = await repository.getArticles();
      _filteredArticles = _articles;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void searchArticles(String query) {
    _searchQuery = query.toLowerCase();
    if (_searchQuery.isEmpty) {
      _filteredArticles = _articles;
    } else {
      _filteredArticles = _articles.where((article) {
        return article.title.toLowerCase().contains(_searchQuery) ||
            article.body.toLowerCase().contains(_searchQuery);
      }).toList();
    }
    notifyListeners();
  }

  void refreshArticles() async {
    await fetchArticles();
  }
}