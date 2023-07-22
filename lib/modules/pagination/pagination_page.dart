import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modules/modules/pagination/api_service.dart';

class PaginationPage extends StatefulWidget {
  const PaginationPage({super.key});

  @override
  State<PaginationPage> createState() => _PaginationPageState();
}

class _PaginationPageState extends State<PaginationPage> {
  final ScrollController _controller = ScrollController();
  var api = ApiService();
  List items = [];
  int page = 1;
  bool hasMore = true;

  Future<void> fetch() async {
    if (!hasMore) return;
    int limit = 25;
    var response = await api.getData(endPoint: EndPoints.posts, query: {
      "_limit": limit,
      "_page": page++,
    });
    log("fetch");
    if (response.statusCode == 200) {
      setState(() {
        items.addAll(response.data);
        log(items.length.toString());
        log((limit * page).toString());
        if (items.length < limit * (page - 1)) {
          hasMore = false;
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetch();
    _controller.addListener(() {
      if (_controller.position.maxScrollExtent == _controller.position.pixels) {
        fetch();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagination"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: items.length + 1,
          controller: _controller,
          itemBuilder: (BuildContext context, int index) {
            if (index < items.length) {
              return ListTile(
                title: Text(" Item ${items[index]["id"]}"),
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Center(
                  child: hasMore
                      ? const CircularProgressIndicator()
                      : const Text("No more data")),
            );
          },
        ),
      ),
    );
  }
}
