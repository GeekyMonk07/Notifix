import 'package:appnewui/Authentication/welcomePage/welcome.dart';
import 'package:appnewui/Pages/settingsPageItems/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:appnewui/Authentication/Auth/firebase.dart';
import 'package:appnewui/Authentication/welcomePage/controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
              Lottie.asset("assets/images/82488-team-members-meetup.json",
                  height: 250),
              SizedBox(
                height: 20,
              ),
              SettingsButton(
                ontap: () => Navigator.pushNamed(context, "/about"),
                imgtext: "OUR TEAM",
                imgUrl: "assets/images/ourteam.png",
              ),
              SizedBox(
                height: 12,
              ),
              SettingsButton(
                ontap: () async {
                  print("Logged out clicked");
                  try {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.clear();
                    final provider = Provider.of<GoogleSignInProvider>(context,
                        listen: false);
                    await provider.signOutGoogle();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => Controller()),
                            (Route<dynamic> route) => false);

                  } catch (e) {
                    Fluttertoast.showToast(msg: "Error while logging out");
                  }

                },
                imgtext: "LOGOUT",
                imgUrl: "assets/images/itemboxIcons/feedback.png",
              ),
              SizedBox(
                height: 12,
              ),
              SettingsButton(
                ontap: () => Navigator.pushNamed(context, "/appfeedback"),
                imgtext: "APP FEEDBACK",
                imgUrl: "assets/images/contactus.png",
              ),
              SizedBox(
                height: 12,
              ),
              InkWell(
                  onTap: () {
                    hiddenCounter++;
                    if (hiddenCounter == 12) Navigator.pushNamed(context, "");
                  },
                  child: Text("App version: 1.0")),
            ],
          ),
        ),
      ),
    );
  }
}
