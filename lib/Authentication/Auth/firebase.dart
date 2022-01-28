//@dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
// final FirebaseAuth _auth=FirebaseAuth.instance;

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount _user;

  GoogleSignInAccount get user => _user;

  Future signInWithGoogle() async {

    final GoogleSignInAccount googleuser = await googleSignIn.signIn();
    if (googleuser == null) return;
    _user = googleuser;

    final GoogleSignInAuthentication googleAuth = await googleuser
        .authentication;

    final
    GoogleAuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken
    );
    // Fluttertoast.showToast(msg: "Account created");

    await FirebaseAuth.instance.signInWithCredential(credential);
    print(_user);
    // notifyListeners();


    // }catch(e){
    //   print(e.toString());
    //
    // }
  }

  Future signOutGoogle() async {
    print("#####################");
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
    // notifyListeners();
    print("signout");

  }
}


