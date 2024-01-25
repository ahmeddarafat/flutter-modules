import 'package:flutter_modules/modules/testing/features/news/article.dart';
import 'package:flutter_modules/modules/testing/features/news/news_change_notifier.dart';
import 'package:flutter_modules/modules/testing/features/news/news_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class BadMockNewsService implements NewsService {
  @override
  Future<List<Article>> getArticles() async {
    return [
      Article(title: "Test 1 ", content: "Test 1 content"),
      Article(title: "Test 2 ", content: "Test 2 content"),
      Article(title: "Test 3 ", content: "Test 3 content"),
    ];
  }
}

class MockNewsService extends Mock implements NewsService {}

void main() {
  late NewsChangeNotifier sut;
  late MockNewsService mockNewsService;

  final articles = [
    Article(title: "Test 1 ", content: "Test 1 content"),
    Article(title: "Test 2 ", content: "Test 2 content"),
    Article(title: "Test 3 ", content: "Test 3 content"),
  ];

  void setupMockNewsService() {
    when(() => mockNewsService.getArticles()).thenAnswer((_) async => articles);
  }

  setUp(() {
    mockNewsService = MockNewsService();
    sut = NewsChangeNotifier(mockNewsService);
  });

  group('inital values', () {
    test('articles should be empty', () {
      expect(sut.articles, isEmpty);
    });

    test('isLoading should be false', () {
      expect(sut.isLoading, isFalse);
    });
  });

  group('getArticles', () {
    test(
        "should NewsService.getArticled called when call NewsChangeNotifier.getArticles",
        () async {
      setupMockNewsService();
      await sut.getArticles();
      verify(() => mockNewsService.getArticles()).called(1);
    });

    test('should set isLoading to true', () {
      setupMockNewsService();
      sut.getArticles();
      expect(sut.isLoading, isTrue);
    });

    test('should set isLoading to false', () async {
      setupMockNewsService();
      await sut.getArticles();
      expect(sut.isLoading, isFalse);
    });

    test('should set articles to the result of NewsService.getArticles',
        () async {
      setupMockNewsService();
      await sut.getArticles();
      expect(sut.articles, isNotEmpty);
    });

    test('should NewsService.getArticles is called', () async {
      setupMockNewsService();
      await sut.getArticles();
      expect(sut.articles, articles);
    });
  });
}
