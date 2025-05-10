import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/favorite_controller.dart';
import '../models/article_model.dart';

class ArticleDetailScreen extends StatelessWidget {
  final Article article;

  const ArticleDetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article Details'),
        actions: [
          Consumer<FavoriteController>(
            builder: (context, controller, child) {
              return IconButton(
                icon: Icon(
                  controller.isFavorite(article) ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                ),
                onPressed: () => controller.toggleFavorite(article),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article.title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            Text(
              article.body,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}