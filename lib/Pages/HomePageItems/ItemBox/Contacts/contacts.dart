import 'package:appnewui/Authentication/widget/button.dart';
import 'package:appnewui/Pages/HomePageItems/ItemBox/Contacts/utils.dart';
import 'package:appnewui/constrants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class Contacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: secondaryPurple,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: (48.0)),
                child: Text(
                  "Contact Us",
                  //details.name,
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontSize: 56,
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: (125.0)),
                child: Text(
                  'GLBITM',
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                  "(Approved by A.I.C.T.E., & Affiliated to Dr. A.P.J. Abdul Kalam Technical University (Formerly UPTU Lucknow).Plot No.2 , APJ Abdul Kalam Road, Knowledge Park 3, Greater Noida. Uttar Pradesh, India, Pin-201306"),
              SizedBox(height: 20),
              CircularButton(
                text: "Send Email",
                color: primaryColor,
                textColor: Colors.white,
                press: () => Utils.openEmail(
                  toEmail: ' office@glbitm.ac.in',
                  // subject: 'Hello World',
                  // body: 'This works great!',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CircularButton(
                text: "Make a Call",
                color: primaryColor,
                textColor: Colors.white,
                press: () => Utils.openPhoneCall(phoneNumber: '+91 7290008310'),
              ),
            ]),
          )),
    );
  }
}
