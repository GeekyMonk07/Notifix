import 'package:appnewui/Authentication/adminlogin/adminlogin.dart';
import 'package:appnewui/indexPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:appnewui/Authentication/welcomePage/welcome.dart';

class Controller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          print("admin");
          return AdminLogin();
        }
        return WelcomePage();
      },
    ));
  }
}
