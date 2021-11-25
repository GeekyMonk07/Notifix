import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'settingsPageItems/buttons.dart';

class EventPage extends StatelessWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
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
                      Lottie.asset("assets/images/eventpageAnimataino2.json",
                          height: 30),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Events",
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
              Lottie.asset("assets/images/eventAnimation.json", height: 300),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
                child: SettingsButton(
                  ontap: () => Navigator.pushNamed(context, "/permission"),
                  imgtext: "Verify Events",
                  imgUrl: "assets/images/itemboxIcons/verify.png",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
                child: SettingsButton(
                  ontap: () => Navigator.pushNamed(context, "/organise"),
                  imgtext: "Organise",
                  imgUrl: "assets/images/itemboxIcons/organise.png",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
                child: SettingsButton(
                  ontap: () {},
                  imgtext: "Add Notice",
                  imgUrl: "assets/images/itemboxIcons/bellIcon.png",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
                child: SettingsButton(
                  ontap: () {},
                  imgtext: "Update TimeTable",
                  imgUrl: "assets/images/itemboxIcons/updatetimetabe.png",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
