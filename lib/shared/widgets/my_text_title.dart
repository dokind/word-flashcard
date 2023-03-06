import 'package:flutter/material.dart';

import '../../main.dart';

/// To match designs:
/// - need a line-break after the first line
/// - of/the should be down-sized
/// Accomplished using a set of TextSpans, and a white list of 'small words'
class MyTitleText extends StatelessWidget {
  const MyTitleText(
    this.data, {
    Key? key,
    this.enableShadows = false,
    this.enableHero = true,
  }) : super(key: key);
  final String data;
  final bool enableShadows;
  final bool enableHero;
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = $styles.text.h2.copyWith(
      color: $styles.colors.offWhite,
      // fontSize: 56 * $styles.scale,
    );

    List<Shadow> shadows = enableShadows ? $styles.shadows.textSoft : [];
    RichText content = RichText(
      // textAlign: TextAlign.center,
      text: TextSpan(
        text: data,
        style: textStyle.copyWith(shadows: shadows),
      ),
    );
    return enableHero
        ? Hero(
            tag: 'title-$data',
            child: content,
          )
        : content;
  }
}
