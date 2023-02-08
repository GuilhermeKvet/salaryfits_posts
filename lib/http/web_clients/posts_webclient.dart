import 'dart:convert';
import 'package:salaryfits_posts/http/client.dart';
import 'package:salaryfits_posts/model/post_model.dart';

class PostsWebClient {
  final Uri url = Uri.https('jsonplaceholder.typicode.com', 'posts');

  Future<List> requestPosts() async {
    final response = await client.get(url);
    final List<Post> allPosts = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return allPosts;
    } else {
      throw HttpException(
        _getMessage(response.statusCode),
        response.statusCode,
      );
    }
  }

  String? _getMessage(int statusCode) {
    if (_statusCodeResponses.containsKey(statusCode)) {
      return _statusCodeResponses[statusCode];
    }
    return 'Unknown error';
  }

  static final Map<int, String> _statusCodeResponses = {
    404: 'not found',
    400: 'bad request',
  };
}

class HttpException implements Exception {
  final String? message;
  final int? statusCode;

  HttpException(this.message, this.statusCode);
}
