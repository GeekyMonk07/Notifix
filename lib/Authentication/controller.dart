import 'package:appnewui/indexPage.dart';
import 'package:appnewui/Authentication/welcomePage/onbording.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Controller extends StatelessWidget {
  SharedPreferences prefs;
  Controller({required this.prefs});

  @override
  Widget build(BuildContext context) {
    return (prefs.containsKey('verified')==false || prefs.getBool('verified')==false) ? Onbording() : IndexPage();
  }
}

