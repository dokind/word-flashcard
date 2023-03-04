// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:labo001/shared/shared.dart';

import 'post.dart';

/// [MyFeed] is TikTok basedfeed words display vertically
class MyFeed extends StatelessWidget {
  const MyFeed({
    super.key,
    required this.words,
  });

  final dynamic words;

  @override
  Widget build(BuildContext context) => Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView.builder(
            scrollDirection: Axis.vertical,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              final dynamic word = words[index];
              return Post(word: Word.dummy());
            },
            itemCount: words?.length ?? 0,
          ),
          const Icon(
            Icons.keyboard_double_arrow_down_sharp,
            size: 48.0,
          ),
        ],
      );
}
