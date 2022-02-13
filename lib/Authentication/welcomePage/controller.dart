
import 'package:appnewui/Authentication/adminlogin/adminlogin.dart';
import 'package:appnewui/Authentication/signup/signup.dart';
import 'package:appnewui/indexPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:appnewui/Authentication/welcomePage/welcome.dart';


class Controller extends StatefulWidget {
  const Controller({Key? key}) : super(key: key);

  @override
  _ControllerState createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  late final user;
  @override
  Widget build(BuildContext context) {
    return user!=null ? IndexPage():SignupPage();
  }

  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser;
  }
}

