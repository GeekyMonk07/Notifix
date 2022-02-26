import 'package:appnewui/Authentication/FacultyStudentSignup/background.dart';
import 'package:appnewui/Authentication/FacultyStudentSignup/signup/signup.dart';
import 'package:appnewui/Authentication/FacultyStudentSignup/signupFaclty/facultySignup.dart';

import 'package:appnewui/constrants.dart';
import 'package:flutter/material.dart';

class FacultyStudentBody extends StatefulWidget {
  final String DropDownCollegeValue;

  const FacultyStudentBody({Key? key, required this.DropDownCollegeValue})
      : super(key: key);
  // const FacultyStudentBody({Key? key}) : super(key: key);

  @override
  _FacultyStudentBodyState createState() => _FacultyStudentBodyState();
}

class _FacultyStudentBodyState extends State<FacultyStudentBody> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          toolbarHeight: 2,
          backgroundColor: Colors.white,
          bottom: TabBar(
            labelColor: Colors.black,
            indicatorColor: primaryColor,
            tabs: [
              Tab(
                text: "STUDENTS",
              ),
              Tab(
                text: "FACULTY",
              ),
            ],
          ),
        ),
        body: TabBarView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            SignupPage(DropDownCollegeValue: widget.DropDownCollegeValue),
            FacultySignupPage(
              DropDownCollegeValue: widget.DropDownCollegeValue,
            ),
          ],
        ),
      ),
    );
  }
}
