import 'package:flutter/material.dart';
import 'package:flutter_modules/modules/testing/features/news/article.dart';
import 'package:flutter_modules/modules/testing/features/news/news_change_notifier.dart';
import 'package:flutter_modules/modules/testing/features/news/news_page.dart';
import 'package:flutter_modules/modules/testing/features/news/news_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

class MockNewsService extends Mock implements NewsService {}

void main() {
  late MockNewsService mockNewsService;

  final articles = [
    Article(title: "Test 1 ", content: "Test 1 content"),
    Article(title: "Test 2 ", content: "Test 2 content"),
    Article(title: "Test 3 ", content: "Test 3 content"),
  ];

  void setupMockNewsService() {
    when(() => mockNewsService.getArticles()).thenAnswer((_) async => articles);
  }

  void setupMockNewsServiceWithWaiting() async {
    await Future.delayed(const Duration(seconds: 2));
    when(() => mockNewsService.getArticles()).thenAnswer((_) async => articles);
  }

  Widget createWidgetUnderTest() {
    return MaterialApp(
      title: 'News App',
      home: ChangeNotifierProvider(
        create: (_) => NewsChangeNotifier(NewsService()),
        child: const NewsPage(),
      ),
    );
  }

  setUp(() {
    mockNewsService = MockNewsService();
  });

  testWidgets(
    "should title of appbar is 'News'",
    (WidgetTester tester) async {
      setupMockNewsService();
      await tester.pumpWidget(createWidgetUnderTest());
      expect(find.text('News'), findsOneWidget);
    },
  );

  testWidgets(
    """should indicator is showing when isLoading is true,
     and not showing when isLoading is false""",
    (WidgetTester tester) async {
      setupMockNewsServiceWithWaiting();
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump(const Duration(milliseconds: 500));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.byType(CircularProgressIndicator), findsNothing);
    },
  );
}
