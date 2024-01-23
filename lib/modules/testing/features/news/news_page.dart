import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'article_page.dart';
import 'news_change_notifier.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<NewsChangeNotifier>().getArticles(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
      ),
      body: Consumer<NewsChangeNotifier>(
        builder: (context, notifier, _) {
          if (notifier.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: notifier.articles.length,
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 16,
            ),
            itemBuilder: (_, index) {
              final article = notifier.articles[index];
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => ArticlePage(article: article),
                    ),
                  );
                },
                child: Card(
                  elevation: 2,
                  child: ListTile(
                    title: Text(article.title),
                    subtitle: Text(
                      article.content,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
