import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../main.dart';
import '../../styles/styles.dart';
import '../shared.dart';

class MyScaffold extends StatelessWidget with GetItMixin {
  MyScaffold({Key? key, required this.child}) : super(key: key);
  final Widget child;
  static AppStyle get style => _style;
  static AppStyle _style = AppStyle();

  @override
  Widget build(BuildContext context) {
    // Listen to the device size, and update AppStyle when it changes
    _style = AppStyle(screenSize: MediaQuery.of(context).size);
    Animate.defaultDuration = $styles.times.fast;
    return Stack(
      key: ValueKey($styles.scale),
      children: [
        Theme(
          data: $styles.colors.toThemeData(),
          // Provide a default texts style to allow Hero's to render text properly
          child: DefaultTextStyle(
            style: $styles.text.body,
            // Use a custom scroll behavior across entire app
            child: ScrollConfiguration(
              behavior: AppScrollBehavior(),
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
