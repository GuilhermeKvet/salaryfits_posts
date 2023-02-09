import 'dart:convert';
import 'package:salaryfits_posts/http/client.dart';

import '../../cache/cache_posts.dart';

class PostsWebClient {
  final Uri url = Uri.https('jsonplaceholder.typicode.com', 'posts');

  Future<List> requestPosts() async {
    List<dynamic> cachedData = await getCachedData();

    if (cachedData.isEmpty) {
      final response = await client.get(url);
      final List<dynamic> allPosts = jsonDecode(response.body);
      if (response.statusCode == 200) {
        setCachedData(allPosts);
        return allPosts;
      } else {
        throw HttpException(
          _getMessage(response.statusCode),
          response.statusCode,
        );
      }
    } else {
      return cachedData;
    }
  }

  String? _getMessage(int statusCode) {
    if (_statusCodeResponses.containsKey(statusCode)) {
      return _statusCodeResponses[statusCode];
    }
    return 'Erro inesperado, tente novamente';
  }

  static final Map<int, String> _statusCodeResponses = {
    404: 'Not found',
    400: 'bad request',
  };
}

class HttpException implements Exception {
  final String? message;
  final int? statusCode;

  HttpException(this.message, this.statusCode);
}
