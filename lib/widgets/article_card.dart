import 'package:flutter/material.dart';

import '../models/article.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: theme.colorScheme.primaryContainer,
                  foregroundColor:
                      theme.colorScheme.onPrimaryContainer,
                  child: Text('${article.id}'),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Article ${article.id}',
                    style: theme.textTheme.labelLarge,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              article.title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              article.body,
              style: theme.textTheme.bodyMedium?.copyWith(
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}