
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:glbapp/pages/HomeScreen/HomePage/homepage.dart';
// import 'package:glbapp/pages/HomeScreen/homeScreen.dart';
import 'package:appnewui/Authentication/welcomePage/welcome.dart';
import 'package:appnewui/Authentication/welcomePage/body.dart';
import 'package:appnewui/Authentication/adminlogin/adminlogin.dart';
class Controller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting)
              return Center(child: CircularProgressIndicator(),);
            else if(snapshot.hasData) {
              print("admin");
              return AdminLogin();
            }
            else if(snapshot.hasError)
              return Center(child: Text('Something went wrong! '),);
            else{
              print("Welcome page");
              return WelcomePage();
            }
          },

        )

    );

  }
}
