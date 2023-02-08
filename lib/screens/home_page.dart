import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:salaryfits_posts/screens/not_found.dart';
import 'package:salaryfits_posts/http/web_clients/posts_webclient.dart';
import 'package:salaryfits_posts/model/post_model.dart';

import '../components/all_posts.dart';
import '../components/progress/circular_progress.dart';

class HomePage extends StatelessWidget {
  final dynamic enterHomePage;

  HomePage({this.enterHomePage, super.key});

  final PostsWebClient _webclient = PostsWebClient();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Posts'),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: _webclient.requestPosts(),
          builder: (
            BuildContext context,
            AsyncSnapshot<List<dynamic>> snapshot,
          ) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return CircularProgress();
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                if (snapshot.hasData) {
                  final String data = jsonEncode(snapshot.data);
                  final List<Post> allPosts = jsonDecode(data);

                  return AllPostsPage(
                    allPosts: allPosts,
                  );
                } else {
                  return NotFoundPage(onEnterHomePage: enterHomePage);
                }
            }
            return NotFoundPage(onEnterHomePage: enterHomePage);
          },
        ),
      ),
    );
  }
}
