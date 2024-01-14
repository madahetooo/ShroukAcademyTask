import '../../../domain/entities/post.dart';
import '../../pages/post_detail_page.dart';
import 'package:flutter/material.dart';

class PostsListWidget extends StatelessWidget {
  final List<Post> posts;

  const PostsListWidget({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return ListTile(
          leading: Text(post.id.toString()),
          title: Text(post.title),
          subtitle: Text(post.body),
          contentPadding: const EdgeInsets.all(8),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PostDetailPage(post: post),
              ),
            );
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(thickness: 1);
      },
      physics: const BouncingScrollPhysics(),
    );
  }
}
