import 'package:flutter/material.dart';

import 'package:appnewui/Authentication/FacultyStudentSignup/body.dart';

class FacultyStudentBackground extends StatelessWidget {
  final String DropDownCollegeValue;
  const FacultyStudentBackground({
    Key? key,
    required this.DropDownCollegeValue,
    required this.body,
  }) : super(key: key);

  final Widget body;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        color: Colors.white,
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset("assets/images/main_top.png",
                  width: size.width * 0.3),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset("assets/images/main_bottom.png",
                  width: size.width * 0.2),
            ),
            FacultyStudentBody(
              DropDownCollegeValue: DropDownCollegeValue,
            )
          ],
        ),
      ),
    );
  }
}
