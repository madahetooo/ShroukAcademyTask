import '../../../domain/entities/post.dart';
import 'delete_post_button_widget.dart';
import 'update_post_button_widget.dart';
import 'package:flutter/material.dart';

class PostDetailWidget extends StatelessWidget {
  final Post post;
  const PostDetailWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          post.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
            decorationStyle: TextDecorationStyle.dashed,
          ),
        ),
        const Divider(),
        Text(
          post.body,
          style: ThemeData().textTheme.bodyMedium!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UpdatePostButtonWidget(post: post),
            const SizedBox(width: 10),
            DeletePostButtonWidget(postId: post.id!),
          ],
        )
      ],
    );
  }
}
