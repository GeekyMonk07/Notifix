import 'package:appnewui/Pages/settingsPageItems/buttons.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int hiddenCounter = 0;
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Material(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Material(
                elevation: 5,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(22),
                    bottomRight: Radius.circular(22)),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset("assets/images/settingsAnimation2.json",
                          height: 30),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Settings",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  height: 60,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Color(0xffF1E6FF),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(22),
                          bottomRight: Radius.circular(22))),
                ),
              ),
              Lottie.asset("assets/images/settingsAnimation.json", height: 300),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
                child: SettingsButton(
                  ontap: () => Navigator.pushNamed(context, "/about"),
                  imgtext: "Our Team",
                  imgUrl: "assets/images/ourteam.png",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
                child: SettingsButton(
                  ontap: () => Navigator.pushNamed(context, "/appfeedback"),
                  imgtext: "App Feedback",
                  imgUrl: "assets/images/itemboxIcons/feedback.png",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
                child: SettingsButton(
                  // ontap: () => Navigator.pushNamed(context, "/about"),
                  imgtext: "Contact Us",
                  imgUrl: "assets/images/contactus.png",
                ),
              ),
              InkWell(
                  onTap: () {
                    hiddenCounter++;
                    if (hiddenCounter == 12) Navigator.pushNamed(context, "");
                  },
                  child: Text("App version: 1.0"))
            ],
          ),
        ),
      ),
    );
  }
}
