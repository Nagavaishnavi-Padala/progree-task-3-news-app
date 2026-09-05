import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/article_provider.dart';
import '../widgets/article_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _refresh(BuildContext context) async {
    await context.read<ArticleProvider>().fetchArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'News Feed',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            tooltip: 'Refresh',
            onPressed: () => _refresh(context),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Consumer<ArticleProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading && provider.articles.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (provider.errorMessage != null &&
              provider.articles.isEmpty) {
            return _buildErrorState(context, provider);
          }

          if (provider.articles.isEmpty) {
            return const Center(
              child: Text('No articles available.'),
            );
          }

          return RefreshIndicator(
            onRefresh: () => _refresh(context),
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(
                16,
                16,
                16,
                24,
              ),
              itemCount: provider.articles.length,
              itemBuilder: (context, index) {
                return ArticleCard(
                  article: provider.articles[index],
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildErrorState(
    BuildContext context,
    ArticleProvider provider,
  ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.cloud_off_rounded,
              size: 72,
              color: Theme.of(context)
                  .colorScheme
                  .onSurfaceVariant,
            ),
            const SizedBox(height: 20),
            Text(
              'Unable to load articles',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 10),
            Text(
              provider.errorMessage ??
                  'Please check your internet connection.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () => _refresh(context),
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}