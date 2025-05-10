import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/article_controller.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ArticleController>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (query) => controller.searchArticles(query),
        decoration: InputDecoration(
          hintText: 'Search articles...',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 0),
        ),
      ),
    );
  }
}