import 'package:flutter/material.dart';
import '../models/social_post.dart';

class SocialPostWidget extends StatelessWidget {
  final SocialPost post;

  const SocialPostWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(post.user),
        subtitle: Text(post.content),
        trailing: Text(post.timestamp.toString()),
      ),
    );
  }
}
