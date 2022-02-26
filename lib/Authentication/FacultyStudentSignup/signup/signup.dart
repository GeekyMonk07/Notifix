import 'package:appnewui/Authentication/FacultyStudentSignup/signup/body.dart';
import 'package:flutter/material.dart';

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
