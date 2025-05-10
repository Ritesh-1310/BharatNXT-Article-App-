import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/favorite_controller.dart';
import 'article_detail_screen.dart';
import 'widgets/article_card.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/error_widget.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Favorites'),
      body: Consumer<FavoriteController>(
        builder: (context, controller, child) {
          if (controller.favoriteArticles.isEmpty) {
            return const ErrorMessageWidget(
              message: 'No favorite articles yet!',
              showRetry: false,
            );
          }

          return ListView.builder(
            itemCount: controller.favoriteArticles.length,
            itemBuilder: (context, index) {
              final article = controller.favoriteArticles[index];
              return ArticleCard(
                article: article,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArticleDetailScreen(article: article),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}