import 'package:appnewui/Authentication/adminlogin/background.dart';
import 'package:appnewui/Authentication/widget/button.dart';
import 'package:appnewui/constrants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AdminBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return LoginBackground(
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
              SizedBox(height: size.height * 0.06),
              SvgPicture.asset(
                "assets/images/login.svg",
                //fit: BoxFit.cover,
                height: size.height * .20,
              ),
              // Text(
              //   "You Are...?",
              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              // ),
              SizedBox(height: size.height * 0.025),
              CircularButton(
                text: "Faculty",
                color: primaryColor,
                textColor: Colors.white,
                press: () => Navigator.pushNamed(context, "/index"),
              ),
              SizedBox(
                height: 20,
              ),
              CircularButton(
                text: "Student",
                color: secondaryPurple,
                textColor: Colors.black,
                press: () => Navigator.pushNamed(context, "/index"),
              ),
              SizedBox(height: size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
