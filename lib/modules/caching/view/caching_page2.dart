import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_modules/modules/caching/data/caching_api_service.dart';
import 'package:flutter_modules/modules/caching/data/caching_manager.dart';

class CachingPage2 extends StatefulWidget {
  const CachingPage2({super.key});

  @override
  State<CachingPage2> createState() => _CachingPage2State();
}

class _CachingPage2State extends State<CachingPage2> {
  late final CacheManager cacheManager;
  late final ApiService apiService;
  @override
  void initState() {
    super.initState();
    apiService = ApiService();
    cacheManager = CacheManager();
  }

  Future<String> _getData() async {
    try {
      return cacheManager.getData(CacheKeys.userinfo);
    } catch (_) {
      final response = await apiService.getData(endPoint: EndPoints.userinfo);
      cacheManager.setData(CacheKeys.userinfo, response.toString());
      return response.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<String>(
        future: _getData(),
        builder: (_, snapshot) {
          print(snapshot.connectionState);
          print(snapshot.data);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            return Text(snapshot.data ?? "null");
          }
        },
      ),
    );
  }
}
