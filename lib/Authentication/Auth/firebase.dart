//@dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
// final FirebaseAuth _auth=FirebaseAuth.instance;

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn(clientId: '743906650805-8j405cr5oms954nf078ppj6dpe56bbkk.apps.googleusercontent.com',
    scopes: [drive.DriveApi.driveScope],);
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

    // final userId = _user.id;
    // DatabaseReference _database = FirebaseDatabase.instance.reference().child('/allusers/$userId');
    //
    // await _database.once().then((DataSnapshot snapshot) {
    //   if(snapshot.value!=null){
    //     return "Already registered";
    //   }else{
    //     return "Not registered";
    //   }
    // });
    // return "Successfully signed in";

    // print("----------");
    await FirebaseAuth.instance.signInWithCredential(credential);
    // print(_user);
    // notifyListeners();


    // }catch(e){
    //   print(e.toString());
    //
    // }
  }

  Future signOutGoogle() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
    // Fluttertoast.showToast(msg: "Logged out");

  }
}


