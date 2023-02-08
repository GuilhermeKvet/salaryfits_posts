import 'package:flutter/material.dart';
import 'package:salaryfits_posts/model/post_model.dart';

class AllPostsPage extends StatelessWidget {
  final List<Post> allPosts;

  const AllPostsPage({
    super.key,
    required this.allPosts,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
      child: SingleChildScrollView(
        child: Column(
          children: const [Text("OI")],
        ),
      ),
    );
  }
}
