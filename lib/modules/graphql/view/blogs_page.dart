import 'package:flutter/material.dart';
import 'package:flutter_modules/modules/graphql/data/graphql_service.dart';
import 'package:flutter_modules/modules/graphql/data/model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'blog_row.dart';

class BlogsPage extends StatefulWidget {
  const BlogsPage({
    super.key,
  });

  @override
  State<BlogsPage> createState() => _BlogsPageState();
}

class _BlogsPageState extends State<BlogsPage> {
  late final GQService gqService;

  @override
  void initState() {
    super.initState();
    gqService = GQService();
    gqService.init();
    
  }

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: gqService.client,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Hygraph Blog",
          ),
        ),
        body: Query(
          options: QueryOptions(
            document: gql(Queries.query1),
            // variables: const <String, dynamic>{"variableName": "value"},
          ),
          builder: (result, {fetchMore, refetch}) {
            if (result.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (result.data == null) {
              return const Center(
                child: Text("No article found!"),
              );
            }
            final posts = result.data!['posts'];
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = Post.fromMap(posts[index]);
                final title = post.title;
                final excerpt = post.description;
                final coverImageURL = post.image;
                return BlogRow(
                  title: title,
                  excerpt: excerpt,
                  coverURL: coverImageURL,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
