import 'package:flutter/material.dart';

/// [Post] is item inside the feed
class Post extends StatelessWidget {
  const Post({
    super.key,
    required this.word,
  });

  final dynamic word;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            word ?? '',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            word ?? '',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
