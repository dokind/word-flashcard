import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:labo001/modules/home/home.dart';

import 'package:provider/provider.dart';

import '../auth.dart';
import '../controller/controller.dart';
import '../widgets/widgets.dart';

///
class LoginScreen extends StatefulWidget {
  ///
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AuthController authController;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    authController = Provider.of<AuthController>(context, listen: false);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    username.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: SafeArea(
          child: Consumer<AuthController>(
            builder: (BuildContext context, AuthController controller,
                    Widget? child) =>
                controller.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LoginForm(
                            username: username,
                            password: password,
                            formKey: _formKey,
                          ),
                          child ?? const SizedBox()
                        ],
                      ),
            child: ElevatedButton(
              onPressed: () async {
                await authController.signInWithGoogle();
              },
              child: const Text('Login with google'),
            ),
          ),
        ),
      );
}
