import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/article_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ArticleProvider()..fetchArticles(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News Feed',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.indigo,
          ),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}