import 'dart:io';

import 'package:flutter/material.dart';
import 'package:salaryfits_posts/cache/cache_posts.dart';
import 'package:salaryfits_posts/components/snackbar_dialog.dart';
import 'package:salaryfits_posts/screens/not_found.dart';
import 'package:salaryfits_posts/http/web_clients/posts_webclient.dart';
import 'package:salaryfits_posts/model/post_model.dart';

import '../components/posts_list.dart';
import '../components/progress/circular_progress.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final PostsWebClient _webclient = PostsWebClient();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Posts',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          leading: IconButton(
            onPressed: () => _clearCache(context),
            icon: const Icon(Icons.delete_outline_sharp),
            color: Colors.black,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
        body: FutureBuilder(
          future: _generatePostsList(),
          builder: (BuildContext context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return CircularProgress();
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                if (snapshot.hasData) {
                  return snapshot.data!;
                } else {
                  return const NotFoundPage();
                }
            }
            return const NotFoundPage();
          },
        ),
      ),
    );
  }

  Future<dynamic> _generatePostsList() async {
    List<Post> posts = [];

    try {
      final List<dynamic> data = await _webclient.requestPosts();
      for (final post in data) {
        posts.add(Post(
          title: post['title'],
          body: post['body'],
        ));
      }
      return PostsList(posts: posts);
    } on HttpException catch (_) {
      return const NotFoundPage();
    } on SocketException catch (_) {
      return const NotFoundPage(message: 'Sem conexão :(');
    }
  }

  _clearCache(BuildContext context) {
    clearCache();
    snackbarDialog(context, 'Cache limpo com sucesso');
  }
}
