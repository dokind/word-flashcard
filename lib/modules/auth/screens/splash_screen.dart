// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:labo001/modules/modules.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthController? authController;
  @override
  void initState() {
    super.initState();
    authController = Provider.of<AuthController>(context, listen: false);

    Future<void>(() async {
      authController?.initUser();
    });
    authController?.authStateChanges.listen((User? user) {
      print('authController stream');
      print(user);
      authController?.updateUser(user);
    });
    Timer(const Duration(seconds: 1), () => FlutterNativeSplash.remove());
  }

  @override
  Widget build(BuildContext context) => Consumer<AuthController>(
        builder: (BuildContext context, AuthController controller, _) =>
            controller.user == null ? const LoginScreen() : const HomeScreen(),
      );
}
