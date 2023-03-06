import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:labo001/main.dart';

import '../../../my_router.dart';
import '../../../shared/shared.dart';

///
class OnboardScreen extends StatefulWidget {
  ///
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  late final TextEditingController username;
  late FocusNode myFocusNode;

  /// example of the route ing
  void _handleSearchTap() => context.push(ScreenPaths.home);
  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    username = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startTimer();
    });
    print($styles.sizes.maxContentWidth1);
    print($styles.sizes.maxContentWidth2);
    print($styles.sizes.maxContentWidth3);
    print($styles.insets.xxs);
    print($styles.insets.lg);
  }

  _startTimer() async {
    print('called');
    await Future<void>.delayed(const Duration(seconds: 1, milliseconds: 300),
        () {
      print('called2');
      myFocusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: $styles.colors.body,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: $styles.insets.xs),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 3),
                Padding(
                  padding: EdgeInsets.only(bottom: $styles.insets.md),
                  child: const MyTitleText(
                    'Таны нэр хэн бэ?',
                    enableShadows: true,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: '',
                    hintStyle: $styles.text.bodyBold,
                  ),
                  textCapitalization: TextCapitalization.words,
                  controller: username,
                  focusNode: myFocusNode,
                  autocorrect: false,
                  textInputAction: TextInputAction.done,
                  maxLength: 20,
                ),
                const Spacer(flex: 2),
                AppBtn.basic(
                  onPressed: () {},
                  semanticLabel: 'skip for now',
                  padding: EdgeInsets.all($styles.insets.lg),
                  child: Text('Skip for now', style: $styles.text.btn),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: $styles.insets.xs),
                  child: AppBtn(
                    onPressed: null,
                    semanticLabel: 'Continue',
                    expand: true,
                    child: const Text('Continue'),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
