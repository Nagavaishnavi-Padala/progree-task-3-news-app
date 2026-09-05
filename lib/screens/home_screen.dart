import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/article_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ArticleProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('News Feed'),
      ),
      body: Center(
        child: provider.isLoading
            ? const CircularProgressIndicator()
            : Text(
                '${provider.articles.length} articles loaded',
              ),
      ),
    );
  }
}