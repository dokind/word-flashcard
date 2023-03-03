import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';
import '../../../firebase_options.dart';
import '../repository/repository.dart';

///
class AuthController extends ChangeNotifier {
  /// [AuthRepository] repo
  final AuthRepository repository;

  User? user;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  ///
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  ///
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      isLoading = true;
      notifyListeners();
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = userCredential.user;
      notifyListeners();
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  /// `log out`
  Future<void> signOut() async {
    await _auth.signOut();
  }

  /// [isLoading]
  bool isLoading = false;

  /// [AuthController] const
  AuthController(this.repository);

  /// [initUser] init user
  void initUser() {
    user = FirebaseAuth.instance.currentUser;
    notifyListeners();
  }

  ///
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onConnectionChange(bool isConnected) {
    print('isConnected');
    print(isConnected);
  }

  /// [signInWithGoogle] RETURN USER UserCredential
  Future<UserCredential?> signInWithGoogle() async {
    try {
      isLoading = true;
      notifyListeners();
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn(
              clientId: DefaultFirebaseOptions.currentPlatform.iosClientId)
          .signIn();
      print('googleUser');
      print(googleUser?.displayName);
      print(googleUser?.photoUrl);

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      print('googleAuth');
      print(googleAuth?.accessToken);
      // Create a new credential
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      print('credential');
      print(credential.token);
      // Once signed in, return the UserCredential
      final UserCredential usr =
          await FirebaseAuth.instance.signInWithCredential(credential);
      user = usr.user;
      notifyListeners();
      return usr;
    } on Exception catch (e) {
      print(e);
    } finally {
      isLoading = false;
      notifyListeners();
    }
    return null;
  }

  void updateUser(User? user) {
    print('user Updated');
    this.user = user;
    notifyListeners();
  }
}
