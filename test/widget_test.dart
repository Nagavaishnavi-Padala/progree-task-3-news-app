import 'package:flutter_test/flutter_test.dart';

import 'package:progree_task_3_news_app/main.dart';

void main() {
  testWidgets('News Feed app loads', (WidgetTester tester) async {
    await tester.pumpWidget(const NewsApp());

    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('News Feed'), findsOneWidget);
  });
}