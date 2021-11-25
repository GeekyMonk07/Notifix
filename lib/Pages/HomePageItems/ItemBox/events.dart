import 'package:appnewui/constrants.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
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
                      padding: const EdgeInsets.only(left: (90.0)),
                      child: Text(
                        "Events",
                        //details.name,
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 56,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                        //textAlign: TextAlign.right,
                      ),
                    ),
                    SizedBox(
                      height: 6,
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
                      decoration: BoxDecoration(
                          color: secondaryPurple,
                          borderRadius: BorderRadius.circular(20)),
                      height: 200,
                      width: MediaQuery.of(context).size.width * 0.9,
                      //color: secondaryPurple,
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
                            child: Column(children: [
                              Text(
                                "Date : ",
                                style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                "Venue : ",
                                style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                "Timings : ",
                                style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ]),
                          ),
                        ],
                      ),
                    )
                  ]))),
    ));
  }
}
