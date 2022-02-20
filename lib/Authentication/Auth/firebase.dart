//@dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount _user;
  GoogleSignInAccount get user => _user;

  Future<String> signInWithGoogle() async {

    final GoogleSignInAccount googleuser = await googleSignIn.signIn();
    if (googleuser == null) return "Not selected";
    _user = googleuser;

    final GoogleSignInAuthentication googleAuth = await googleuser
        .authentication;

    final
    GoogleAuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken
    );


    await FirebaseAuth.instance.signInWithCredential(credential);

  }

  Future signOutGoogle() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();

  }
}


