import 'package:bharat_nxt_article_app/controllers/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../controllers/article_controller.dart';
import 'article_detail_screen.dart';
import 'favorites_screen.dart';
import 'widgets/article_card.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/error_widget.dart';
import 'widgets/loading_widget.dart';
import 'widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ArticleController>(context, listen: false).fetchArticles();
      Provider.of<FavoriteController>(context, listen: false).loadFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Article Reader'),
      body: Column(
        children: [
          const SearchBarWidget(),
          Expanded(
            child: Consumer<ArticleController>(
              builder: (context, controller, child) {
                if (controller.isLoading && controller.articles.isEmpty) {
                  return const LoadingWidget();
                }

                if (controller.hasError) {
                  return ErrorMessageWidget(
                    message: controller.error,
                    onRetry: () => controller.fetchArticles(),
                  );
                }

                return SmartRefresher(
                  controller: _refreshController,
                  onRefresh: () async {
                    controller.refreshArticles();
                    _refreshController.refreshCompleted();
                  },
                  child: ListView.builder(
                    itemCount: controller.articles.length,
                    itemBuilder: (context, index) {
                      final article = controller.articles[index];
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
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FavoritesScreen(),
            ),
          );
        },
        child: const Icon(Icons.favorite),
      ),
    );
  }
}