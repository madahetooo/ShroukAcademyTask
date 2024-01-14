import '../../../domain/entities/post.dart';
import '../../pages/post_add_update_page.dart';
import 'package:flutter/material.dart';

class UpdatePostButtonWidget extends StatelessWidget {
  final Post post;

  const UpdatePostButtonWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PostAddUpdatePage(
              post: post,
            ),
          ),
        );
      },
      icon: const Icon(Icons.edit),
      label: const Text('Edit'),
    );
  }
}
