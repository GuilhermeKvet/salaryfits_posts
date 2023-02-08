import 'package:flutter/material.dart';
import 'package:salaryfits_posts/http/web_clients/posts_webclient.dart';

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
        appBar: AppBar(
          title: const Text('Posts'),
          automaticallyImplyLeading: false,
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
                break;
            }
            return Center();
          },
        ),
      ),
    );
  }
}
