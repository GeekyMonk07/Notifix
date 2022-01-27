import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'HomePageItems/UPLOAD BUTTON DATA/EventsPageItems/UploadTimeTable.dart';
import 'settingsPageItems/buttons.dart';

class EventPage extends StatelessWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
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
                    // Lottie.asset("assets/images/eventAnimation.json",
                    //     height: 30),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    Text(
                      "Events",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
            Expanded(
                child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Lottie.asset("assets/images/81153-admin.json", height: 255),
                  SizedBox(
                    height: 10,
                  ),
                  SettingsButton(
                    ontap: () => Navigator.pushNamed(context, "/permission"),
                    imgtext: "VERIFY EVENTS",
                    imgUrl: "assets/images/itemboxIcons/verify.png",
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SettingsButton(
                    ontap: () => Navigator.pushNamed(context, "/organise"),
                    imgtext: "ORGANISE     ",
                    imgUrl: "assets/images/itemboxIcons/organise.png",
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SettingsButton(
                    ontap: () => Navigator.pushNamed(context, "/updateNotice"),
                    imgtext: "ADD NOTICE",
                    imgUrl: "assets/images/itemboxIcons/bellIcon.png",
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SettingsButton(
                    ontap: () {
                      Navigator.pushNamed(context, "/updateTimeTable");
                    },
                    imgtext: "UPDATE TIMETABLE",
                    imgUrl: "assets/images/itemboxIcons/updatetimetabe.png",
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SettingsButton(
                    ontap: () {
                      Navigator.pushNamed(context, "/notes");
                    },
                    imgtext: "UPLOAD PDFs",
                    imgUrl: "assets/images/itemboxIcons/note.png",
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
