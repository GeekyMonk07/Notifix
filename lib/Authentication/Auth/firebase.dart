//@dart=2.9


import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount _user;

  GoogleSignInAccount get user => _user;

  Future signInWithGoogle() async {

      final GoogleSignInAccount googleuser = await googleSignIn.signIn();
      if (googleuser == null) return;
      _user = googleuser;

      final GoogleSignInAuthentication googleAuth =
          await googleuser.authentication;

      final GoogleAuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
      // Fluttertoast.showToast(msg: "Account created");

      await FirebaseAuth.instance.signInWithCredential(credential);
      print(_user);
      notifyListeners();

  }

  Future signOutGoogle() async {

      await googleSignIn.disconnect();
      FirebaseAuth.instance.signOut();

  }


}
