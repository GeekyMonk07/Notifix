import 'package:appnewui/Authentication/welcomePage/background.dart';
import 'package:appnewui/Authentication/widget/button.dart';
import 'package:appnewui/constrants.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return WelcomeBackground(
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
              SizedBox(height: size.height * 0.05),
              // Image.asset(
              //   "assets/images/book.png",
              //   height: size.height * .30,
              // ),
              Lottie.asset("assets/images/welcome.json", height: 250),
              // SvgPicture.asset(
              //   "assets/images/books.svg",
              //   //fit: BoxFit.cover,
              //   height: size.height * .30,
              // ),
              SizedBox(height: size.height * 0.05),
              CircularButton(
                text: "LOGIN",
                color: primaryColor,
                textColor: Colors.white,
                press: () => Navigator.pushNamed(context, "/login"),
              ),
              // SizedBox(
              //   height: 20,
              // ),
              // CircularButton(
              //   text: "SIGN UP",
              //   color: secondaryPurple,
              //   textColor: Colors.black,
              //   press: () => Navigator.pushNamed(context, "/adminlogin"),
              // ),
              SizedBox(height: size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
