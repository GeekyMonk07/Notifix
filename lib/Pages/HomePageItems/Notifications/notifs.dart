import 'package:appnewui/constrants.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Notifs extends StatefulWidget {
  @override
  _NotifsState createState() => _NotifsState();
}

class _NotifsState extends State<Notifs> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
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
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Notifications",
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
                      height: 3,
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
                     SizedBox(
                      height: 12,
                    ),
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width * 0.9,
                      color: secondaryPurple,
                      child: ExpansionCard(
                        backgroundColor: secondaryPurple,
                        title: Container(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                              Text(
                                "Heading",
                                style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontSize: 30,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "Sub-Heading",
                                style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            ])),
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 7),
                            child: Text(
                              "Details of the Notifications will be here!!",
                              style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ]))),
    ));
  }
}
