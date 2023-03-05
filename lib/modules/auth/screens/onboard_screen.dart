import 'package:flutter/material.dart';
import 'package:labo001/main.dart';

///
class OnboardScreen extends StatefulWidget {
  ///
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final TextEditingController username = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Placeholder(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('What is your name?'),
                TextField(
                  autocorrect: false,
                  controller: username,
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Continue',
                    style: $styles.text.btn,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
