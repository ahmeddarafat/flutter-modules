import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GQService {
  final gqUrl =
      "https://api-eu-central-1-shared-euc1-02.hygraph.com/v2/clnvubwdk3oke01ueb5o16f64/master";
  late final ValueNotifier<GraphQLClient> client;

  void init() {
    final httpLink = HttpLink(gqUrl);

    client = ValueNotifier(
      GraphQLClient(
        link: httpLink,
        cache: GraphQLCache(),
      ),
    );
  }
}

class Queries {
  static const query1 = """
query Content{
  posts{
    id
    title
    excerpt
    coverImage {
      url
    }
  }
}""";


}
