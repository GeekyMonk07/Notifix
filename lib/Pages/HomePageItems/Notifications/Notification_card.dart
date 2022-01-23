import 'package:flutter/material.dart';



class NotificationCard extends StatelessWidget {
  final String? name;
  final String? description;
  final String? date;
  final String? slot;
  final String? topic;
  final String? tenure;
  final String? venue;
  //final Future<void>? req;
  final FloatingActionButton? tb;


  const NotificationCard(
      {Key? key,


        required this.name,

        // required this.email,


        required this.description,
        required this.venue,
        required this.date,
        required this.topic,
        required this.tenure,

        // required this.color,
        required this.slot,
        // required this.req,
        required this.tb
      })

      : super(key: key);





  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return Container(
      height: 250,
      child: Stack(
        children: [
          Positioned(
              top: 35,
              left: 20,
              child: Material(
                child: Container(
                  height: 200,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.yellowAccent,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(-10, 10),
                          blurRadius: 8),
                    ],
                  ),
                ),
              )),
          Positioned(
            left: 30,
            child: Card(
                elevation: 12,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  height: 200,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage("assets/images/notifs.png"))),
                )),
          ),
          Positioned(
            top: 60,
            left: 195,
            child: Container(
              height: 200,
              width: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    topic!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    date!,
                    style: TextStyle(

                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 5.0,),
                  Text(
                    "jdhbg",
                    // (date![(date?.length)!-1]=='A')?"09:00 AM- 02:00 PM":"03:00 PM - 07:00 PM",
                    style: TextStyle(

                      fontSize: 15,
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),

                  Padding(
                      padding: const EdgeInsets.all(10),
                      child:tb
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}