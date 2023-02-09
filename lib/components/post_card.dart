import 'package:flutter/material.dart';
import 'package:salaryfits_posts/model/post_model.dart';

import '../utils/format_text.dart';

class PostCard extends StatelessWidget {
  final Post post;
  final dynamic action;

  PostCard({
    required this.post,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => action(),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 340,
                child: Text(
                  formatText(post.title!),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: SizedBox(
                      width: 330,
                      child: Text(
                        formatText(post.body!),
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color(0xfff7cc35),
                    size: 20,
                  ),
                ],
              ),
              const Divider(
                height: 30,
                thickness: 2,
                color: Color(0xfff7cc35),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
