import 'package:appnewui/constrants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Notes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: secondaryPurple,
          body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            padding: const EdgeInsets.only(left: (102.0)),
            child: Text(
              "Notes",
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
            padding: const EdgeInsets.only(left: (118.0)),
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
          Center(
              child: Stack(
            alignment: Alignment.center,
            children: [
              Lottie.asset("assets/images/notes.json", height: 200),
              // const Text(
              //   "Uploading Timetable...",
              //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              // ),
            ],
          )),
          Center(
            child: Text(
              "Uploading Notes...",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        ]),
      )),
    );
  }
}
