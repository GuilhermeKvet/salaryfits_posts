import 'package:flutter/material.dart';
import 'package:salaryfits_posts/components/post_card.dart';
import 'package:salaryfits_posts/model/post_model.dart';
import 'package:nuvigator/next.dart';

class PostsList extends StatelessWidget {
  final List<Post> posts;

  const PostsList({
    super.key,
    required this.posts,
  });

  @override
  Widget build(BuildContext context) {
    final nuvigator = Nuvigator.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 10, 0),
      child: SingleChildScrollView(
        child: Column(
          children: posts
              .map(
                (post) => PostCard(
                  post: post,
                  action: () => nuvigator!.open(
                    "detailsPage",
                    parameters: {
                      'title': post.title!,
                      'body': post.body!,
                    },
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
