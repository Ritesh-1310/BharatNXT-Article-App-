import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/article_model.dart';
import '../utils/constants.dart';

class FavoriteController with ChangeNotifier {
  List<Article> _favoriteArticles = [];

  List<Article> get favoriteArticles => _favoriteArticles;

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(AppConstants.favoritesKey);
    if (jsonString != null) {
      final List<dynamic> jsonList = json.decode(jsonString);
      _favoriteArticles = jsonList.map((json) => Article.fromJson(json)).toList();
      notifyListeners();
    }
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = json.encode(
      _favoriteArticles.map((article) => article.toJson()).toList(),
    );
    await prefs.setString(AppConstants.favoritesKey, jsonString);
  }

  bool isFavorite(Article article) {
    return _favoriteArticles.any((a) => a.id == article.id);
  }

  Future<void> toggleFavorite(Article article) async {
    if (isFavorite(article)) {
      _favoriteArticles.removeWhere((a) => a.id == article.id);
    } else {
      _favoriteArticles.add(article);
    }
    await _saveFavorites();
    notifyListeners();
  }
}