import 'package:flutter/material.dart';

import 'package:appnewui/Authentication/FacultyStudentSignup/body.dart';

class FacultyStudentSignupPage extends StatelessWidget {
  final String DropDownCollegeValue;
  const FacultyStudentSignupPage({
    Key? key,
    required this.DropDownCollegeValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FacultyStudentBody(
        DropDownCollegeValue: DropDownCollegeValue,
      ),
    );
  }
}
