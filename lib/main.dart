import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/article_controller.dart';
import 'controllers/favorite_controller.dart';
import 'repositories/article_repository.dart';
import 'services/api_service.dart';
import 'views/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ArticleController(
            repository: ArticleRepository(
              apiService: ApiService(),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => FavoriteController(),
        ),
      ],
      child: MaterialApp(
        title: 'Article Reader',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            brightness: Brightness.light,
          ),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
        ),
        themeMode: ThemeMode.system,
        home: const HomeScreen(),
      ),
    );
  }
}