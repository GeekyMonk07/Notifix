
import 'package:appnewui/indexPage.dart';
import 'package:appnewui/onbording.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Controller extends StatefulWidget {
  const Controller({Key? key}) : super(key: key);

  @override
  _ControllerState createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  late final user;
  @override
  Widget build(BuildContext context) {
    return user == null ? Onbording() : IndexPage();
  }

  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser;
  }
}
