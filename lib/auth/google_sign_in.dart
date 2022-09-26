import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  Future<GoogleSignInAccount?> signInWithGoogle() async {
    try {
      return await googleSignIn.signIn();
    } catch (error, stackTrace) {
      if (kDebugMode) {
        print(error);
      }
      return Future.error(error);
    }
  }

  Future<void> signOut() async {
    await googleSignIn.signOut();
  }
}
