import 'package:appnewui/Authentication/FacultyStudentSignup/signupFaclty/body.dart';
import 'package:flutter/material.dart';

class FacultySignupPage extends StatelessWidget {
  final String DropDownCollegeValue;

  const FacultySignupPage({Key? key, required this.DropDownCollegeValue})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        DropDownCollegeValue: DropDownCollegeValue,
      ),
    );
  }
}
