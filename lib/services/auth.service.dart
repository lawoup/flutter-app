import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class BaseAuth {
  FirebaseAuth getAuth();
  Future<User> getCurrentUser();
  Future<String> getToken();
  Future<User?> signInWithGoogle({required BuildContext context});
}

class AuthService implements BaseAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User> getCurrentUser() async {
    User user = _auth.currentUser!;
    return user;
  }

  FirebaseAuth getAuth() {
    return _auth;
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = await this
        .getCurrentUser()
        .then((User value) => value.getIdToken().then((value) => value));
    prefs.setString("token", token);
    return token;
  }

  Future<String> getAccessToken() async {
    String token = await this
        .getCurrentUser()
        .then((User value) => value.getIdToken().then((value) => value));
    return token;
  }

  void signout() {
    FirebaseAuth.instance.signOut();
  }

  Future<void> login(PhoneAuthCredential phoneAuthCredential) async {
    await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
  }

  Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
        } else if (e.code == 'invalid-credential') {}
      } catch (e) {
        // ScaffoldMessenger.of(context).showSnackBar(
        //   Authentication.customSnackBar(
        //     content: 'Error occurred using Google Sign In. Try again.',
        //   ),
        // );
      }
    }
    return user;
  }
}
