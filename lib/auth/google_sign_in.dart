import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../global.dart';

class Auth {
  late FirebaseAuth _auth;
  late GoogleSignIn googleSignIn;

  Auth() {
    _auth = FirebaseAuth.instance;
    googleSignIn = GoogleSignIn(scopes: [
      'https://www.googleapis.com/auth/userinfo.email',
      'https://www.googleapis.com/auth/user.phonenumbers.read'
    ]);
  }

  User? get user => _auth.currentUser;

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      Globals.storage?.setBool('LoggedIn', true);
      return userCredential.user;
    } catch (error, stackTrace) {
      if (kDebugMode) {
        print(error);
      }
      return Future.error(error);
    }
  }

  Future<void> signOut() async {
    Globals.storage?.setBool('LoggedIn', false);
    await googleSignIn.signOut();
  }
}
