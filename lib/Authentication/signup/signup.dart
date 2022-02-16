import 'package:flutter/material.dart';
import 'package:appnewui/Authentication/signup/body.dart';

class SignupPage extends StatelessWidget {
  final String DropDownCollegeValue;
  SignupPage({required this.DropDownCollegeValue});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(DropDownCollegeValue: DropDownCollegeValue),
    );
  }
}
