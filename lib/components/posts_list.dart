import 'package:flutter/material.dart';
import 'package:salaryfits_posts/components/post_card.dart';
import 'package:salaryfits_posts/model/post_model.dart';

class PostsList extends StatelessWidget {
  final List<Post> posts;
  final void Function() action;

  const PostsList({
    super.key,
    required this.posts,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 10, 0),
      child: SingleChildScrollView(
        child: Column(
          children: posts
              .map(
                (post) => PostCard(
                  post: post,
                  action: action,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
