import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:labo001/shared/utils/utils.dart';
import '../../../firebase_options.dart';
import '../repository/repository.dart';

///
class AuthController extends ChangeNotifier {
  /// [AuthRepository] repo
  final AuthRepository repository;

  /// [user]
  User? user;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Returns a stream of authentication state changes.
  ///
  /// This getter returns a stream of `User` objects that emits events
  /// whenever the authentication state changes. If the user is logged
  /// in, the stream will emit a non-null `User` object. If the user is
  /// logged out, the stream will emit a null `User` object.
  ///
  /// Returns:
  ///   - A `Stream` of `User` objects that emits events when the authentication state changes.
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  /// Attempts to sign in the user using email and password credentials.
  ///
  /// This method attempts to sign in the user using the provided email and
  /// password credentials. If successful, it returns a `UserCredential`
  /// object containing information about the signed-in user. If not
  /// successful, it throws a `FirebaseAuthException`.
  ///
  /// Parameters:
  ///   - email: The user's email address.
  ///   - password: The user's password.
  ///
  /// Returns:
  ///   - A `UserCredential` object if the sign-in is successful.
  ///
  /// Throws:
  ///   - A `FirebaseAuthException` if the sign-in is not successful.
  Future<UserCredential> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      isLoading = true;
      notifyListeners();

      // Attempt to sign in using email and password credentials
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Update the current user and notify any listeners
      user = userCredential.user;
      notifyListeners();

      return userCredential;
    } on FirebaseAuthException catch (e) {
      // Handle any exceptions that occur during sign-in
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      // Rethrow the exception to propagate it to the calling code
      rethrow;
    } finally {
      // Update the loading state and notify any listeners
      isLoading = false;
      notifyListeners();
    }
  }

  /// `log out`
  /// If successful, it also updates any [authStateChanges], [idTokenChanges] or [userChanges] stream listeners.
  Future<void> signOut() async {
    await _auth.signOut();
  }

  /// [isLoading]
  bool isLoading = false;

  /// [AuthController] const
  AuthController(this.repository);

  /// Initializes the current user object.
  ///
  /// This method sets the current user object to the current user returned
  /// by Firebase Authentication. It then notifies any listeners that the
  /// current user has been updated.
  void initUser() {
    user = FirebaseAuth.instance.currentUser;
    notifyListeners();
  }

  ///
  @override
  void dispose() {
    super.dispose();
  }

  /// checking connection
  void onConnectionChange(bool isConnected) {
    print('isConnected');
    print(isConnected);
  }

  /// Attempts to sign in the user using Google Sign-In.
  ///
  /// This method triggers the Google Sign-In flow and attempts to obtain
  /// the user's credentials. If successful, it returns a `UserCredential`
  /// object containing information about the signed-in user. If not
  /// successful, it returns `null`.
  ///
  /// Returns:
  ///   - A `UserCredential` object if the sign-in is successful, `null` otherwise.
  Future<UserCredential?> signInWithGoogle() async {
    try {
      isLoading = true;
      notifyListeners();

      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn(
        clientId: DefaultFirebaseOptions.currentPlatform.iosClientId,
      ).signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      final UserCredential usr =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Update the current user and notify any listeners
      user = usr.user;
      notifyListeners();

      return usr;
    } on Exception catch (e) {
      print(e);
    } finally {
      isLoading = false;
      notifyListeners();
    }

    // Return null if sign-in was not successful
    return null;
  }

  /// Updates the current user and triggers a notification to any listeners.
  ///
  /// If a non-null [user] is provided, navigates to the home page.
  /// Otherwise, navigates to the login page.
  ///
  /// Parameters:
  ///   - user: The updated user object. May be null if the user is not logged in.
  ///   - context: The build context used to navigate to the appropriate page.
  void updateUser(User? user, BuildContext context) {
    this.user = user;
    notifyListeners();
    if (user != null) {
      (context).go(homePath);
    } else {
      (context).go(loginPath);
    }
  }
}
