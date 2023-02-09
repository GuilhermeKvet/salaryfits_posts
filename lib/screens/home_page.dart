import 'package:flutter/material.dart';
import 'package:salaryfits_posts/screens/not_found.dart';
import 'package:salaryfits_posts/http/web_clients/posts_webclient.dart';
import 'package:salaryfits_posts/model/post_model.dart';

import '../components/posts_list.dart';
import '../components/progress/circular_progress.dart';

class HomePage extends StatelessWidget {
  final dynamic enterHomePage;
  final dynamic onEnterDetailsPage;

  HomePage({this.enterHomePage, this.onEnterDetailsPage, super.key});

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
          iconTheme: const IconThemeData(
            color: Color(0xfff7cc35),
          ),
          // backgroundColor: Colors.white,
          shadowColor: const Color(0xfff7cc35),
          title: const Text(
            'Posts',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
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
                  return NotFoundPage(onEnterHomePage: enterHomePage);
                }
            }
            return NotFoundPage(onEnterHomePage: enterHomePage);
          },
        ),
      ),
    );
  }

  Future<PostsList> _generatePostsList() async {
    List<Post> posts = [];
    final List<dynamic> data = await _webclient.requestPosts();

    for (final post in data) {
      posts.add(Post(
        title: post['title'],
        body: post['body'],
      ));
    }
    return PostsList(posts: posts, action: () => onEnterDetailsPage());
  }
}
