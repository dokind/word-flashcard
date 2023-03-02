import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/controller.dart';

/// A form that allows users to input their username and password to login.
class LoginForm extends StatefulWidget {
  /// Constructs a LoginForm with the given [username], [password], and [formKey].
  const LoginForm({
    Key? key,
    required this.username,
    required this.password,
    required this.formKey,
  }) : super(key: key);

  final TextEditingController username;
  final TextEditingController password;
  final GlobalKey<FormState> formKey;

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    final authCtrl = Provider.of<AuthController>(context, listen: true);
    return Form(
      key: widget.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            autocorrect: false,
            controller: widget.username,
            decoration: const InputDecoration(
              hintText: 'Username',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
          ),
          TextFormField(
            controller: widget.password,
            obscureText: true,
            decoration: const InputDecoration(
              hintText: 'Password',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              // Validate returns true if the form is valid, or false otherwise.
              if (widget.formKey.currentState!.validate()) {
                // If the form is valid, submit it.
                authCtrl.signInWithEmailAndPassword(
                    widget.username.text, widget.password.text);
              } else {
                widget.password.clear();
              }
            },
            child: authCtrl.isLoading
                ? const CupertinoActivityIndicator()
                : const Text('Login'),
          ),
        ],
      ),
    );
  }
}
