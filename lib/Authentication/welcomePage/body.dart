import 'package:appnewui/Authentication/welcomePage/background.dart';
import 'package:appnewui/Authentication/widget/button.dart';
import 'package:appnewui/constrants.dart';
import 'package:flutter/material.dart';
import 'package:appnewui/Authentication/welcomePage/Controller.dart';
import 'package:appnewui/Authentication/Auth/firebase.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:appnewui/Authentication/welcomePage/welcome.dart';
import 'package:appnewui/Authentication/welcomePage/body.dart';
import 'package:appnewui/Authentication/adminlogin/adminlogin.dart';

class Body extends StatefulWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void click() {
    print("Signing with google clicked------>");
    final provider=Provider.of<GoogleSignInProvider>(context,listen:false);
    provider.signInWithGoogle();

  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return WelcomeBackground(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * .05,
              ),
              Text(
                "WELCOME TO GLBITM",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
              ),
              Text(
                "FIND YOUR SPARK",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
              ),
              SizedBox(height: size.height * 0.05),
              
              Lottie.asset("assets/images/welcome.json", height: 250),
              
              SizedBox(height: size.height * 0.05),
              CircularButton(
                text: "LOGIN",
                color: primaryColor,
                textColor: Colors.white,
                press: () => this.click(),
              ),
//               OutlinedButton(
//                 onPressed: this.click,
//                 style: OutlinedButton.styleFrom(
//                   backgroundColor:  Color(0xff902525),
// //splashColor: Colors.grey,
//                   shadowColor: Colors.grey,
//
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
//
// // BorderSide: BorderSide(color: Colors.grey),
//
//                 ),
//                 child: Padding(
//                     padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         // Image(image: AssetImage('assets/images/google_logo.png'), height: 35),
//                         Padding(
//                             padding: EdgeInsets.only(left: 10),
//                             child: Text('Sign in with Google',
//                                 style: TextStyle(color: Colors.white, fontSize: 25)))
//                       ],
//                     ))),
              SizedBox(height: size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}

