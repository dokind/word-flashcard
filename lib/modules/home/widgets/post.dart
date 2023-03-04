import 'package:flutter/material.dart';

import '../../../shared/shared.dart';

/// [Post] is item inside the feed
class Post extends StatelessWidget {
  const Post({
    super.key,
    required this.word,
  });

  final Word word;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(word.word ?? '',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: Colors.white,
                  )),
        ],
      ),
    );
  }
}
