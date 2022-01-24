import 'package:appnewui/Authentication/welcomePage/welcome.dart';
import 'package:appnewui/Pages/settingsPageItems/buttons.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:appnewui/Authentication/Auth/firebase.dart';
import 'package:appnewui/Authentication/welcomePage/Controller.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool _isLoading;
  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    int hiddenCounter = 0;
    Size size = MediaQuery.of(context).size;
    return _isLoading ? Center(child:CircularProgressIndicator()) : SafeArea(
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
                  ontap: () async {
                    setState(() {
                      _isLoading = true;
                    });
                    print("Logged out clicked");
                    try{
                      final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                      await provider.signOutGoogle();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => WelcomePage()),
                              (Route<dynamic> route) => false);
                    }catch(e){
                      Fluttertoast.showToast(msg: "Error while logging out");
                      setState(() {
                        _isLoading = false;
                      });
                    }


                  },
                  imgtext: "LogOut",
                  imgUrl: "assets/images/itemboxIcons/feedback.png",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
                child: SettingsButton(
                  ontap: () => Navigator.pushNamed(context, "/about"),
                  imgtext: "Contact Us",
                  imgUrl: "assets/images/contactus.png",
                ),
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
