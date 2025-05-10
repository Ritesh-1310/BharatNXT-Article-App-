import '../models/article_model.dart';
import '../services/api_service.dart';

class ArticleRepository {
  final ApiService apiService;

  ArticleRepository({required this.apiService});

  Future<List<Article>> getArticles() async {
    final articlesJson = await apiService.fetchArticles();
    return articlesJson.map((json) => Article.fromJson(json)).toList();
  }
}