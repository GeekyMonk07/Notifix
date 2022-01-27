
import 'package:appnewui/constrants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Query _ref;
  late final user;

  String uniqueId = "";
  String first_name = "";
  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    assert(user != null);
    extractEmail();
    extractName();
    while (uniqueId == "") {}
    _ref = FirebaseDatabase.instance
        .reference()
        .child('/user_details_for_registration/$uniqueId')
        .orderByChild('name');
  }

  void extractEmail() {
    String email = user?.email;
    var idx = 0;
    while (email[idx] != '@') {
      uniqueId += email[idx];
      idx++;
    }
  }

  void extractName() {
    String name = user?.displayName;
    var idx = 0;
    while (idx < name.length) {
      if (name[idx] == ' ') break;
      first_name += name[idx];
      idx++;
    }
  }

  //final _database=FirebaseDatabase.instance.reference(); maine nahi kiya

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    // print(user?.photoURL);
    String alter_image_url =
        "https://img.icons8.com/fluency/100/000000/test-account.png";

    Size size = MediaQuery.of(context).size;
    int monthNum(String date,int id){
      date = date.substring(0,date.length-1);
      final DateTime day = DateFormat("dd MMMM yyyy").parse(date);
      print(day);

      if(id==1){
        return day.month;
      }else if(id==2){
        return day.day;
      }else {
        return day.weekday;
      }
    }

    String monthDay(String date){
      date = date.substring(0,date.length-1);
      final DateTime day = DateFormat("dd MMMM yyyy").parse(date);
      final DateFormat formatter = DateFormat('E');
      return formatter.format(day);

    }

    String getTime(String a){
      a = a[a.length-1];
      if(a=='A'){
        return "9:30AM";
      }else{
        return "2:00PM";
      }
    }
    return SafeArea(
        child: Material(
            color: Colors.white,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //  <--------------------------------------top bar------------------------------------------->
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.exit_to_app,
                          color: Colors.transparent,
                        ),
                        Text(
                          "   My Profile",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.logout)) //logout button
                      ],
                    ),
                  ),
                  //<--------------------------------------top bar------------------------------------------->
                  SizedBox(height: size.height * 0.02),
                  //<--------------------------------------DP------------------------------------------->
                  ClipOval(
                    child: Material(
                      color: Colors.transparent,
                      child: Image.network(
                        user?.photoURL == null
                            ? alter_image_url
                            : "${user!.photoURL}",

                        fit: BoxFit.cover,
                        width: 120,
                        height: 120,
                      ),
                    ),
                  ),
                  //<--------------------------------------DP ends------------------------------------------->

                  //<--------------------------------------Full name------------------------------------------->
                  Text(
                    "${first_name}",
                    // user.name,

                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.black),
                  ),
                  //<--------------------------------------full name ends------------------------------------------->
                  const SizedBox(height: 7),

                  //<--------------------------------------email------------------------------------------>
                  Text(
                    "${user?.email}",

                    //user.email,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                  ),
                  //<--------------------------------------email ends------------------------------------------>
                  SizedBox(height: size.height * 0.05),
                  Expanded(
                      child: Container(
                        height: 100,
                        width: double.infinity,
                        //color: Colors.white,
                        decoration: BoxDecoration(
                          color: secondaryPurple,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: size.height * .02,
                            ),
                            Text(
                              "MY REGISTERED EVENTS",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: size.height * 0.025,
                            ),
                            Text(
                              "TAP ON THE EVENTS FOR MORE INFO",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            //<---------------------------------------------------events List started-------------------------------------->
                            Expanded(
                                child: FirebaseAnimatedList(
                                    defaultChild:Center(child: CircularProgressIndicator()),
                                    query: _ref,
                                    itemBuilder: (BuildContext context,
                                        DataSnapshot snapshot,
                                        Animation<double> animation,
                                        int index) {
                                      if(snapshot.value!=null)
                                      return Padding(
                                        padding:
                                        const EdgeInsets.fromLTRB(25, 7, 25, 7),
                                        child: ListContainer(
                                            MonthNum: monthNum(snapshot.value['date'],1),
                                            DateNum: monthNum(snapshot.value['date'],2).toString(),
                                            // "Date : ${snapshot.value['date']}",
                                            Day: monthDay(snapshot.value['date']),
                                            EventName: snapshot.value['name'],
                                            time: getTime(snapshot.value['date']),
                                            ontap: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (BuildContext context) =>
                                                      Dialog(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                12.0)), //this right here
                                                        child: MoreDetails(
                                                            snapshot: snapshot),
                                                      ));
                                            }),
                                      );
                                      else{
                                        return Center(child: CircularProgressIndicator(),);
                                      }
                                    }),

                  ),
                            //<---------------------------------------------------events List ended -------------------------------------->
                            // Expanded(
                            //   child: ListView(
                            //       scrollDirection: Axis.vertical,
                            //       shrinkWrap: true,
                            //       children: [
                            //         Padding(
                            //           padding: EdgeInsets.fromLTRB(25, 7, 25, 7),
                            //           child: ListContainer(
                            //               MonthNum: 9,
                            //               DateNum: "20",
                            //               Day: "MONDAY",
                            //               EventName:
                            //                   "Introduction to Flutter by GDSC",
                            //               time: "11:30 am",
                            //               ontap: () {}),
                            //         ),
                            //       ]),
                            // )
                          ],
                        ),
                      ))
                ])));
  }
}

//<---------------------------------------------------Class for dialog box which opens on pressing "more details"------------------------------->
class MoreDetails extends StatelessWidget {
  final DataSnapshot snapshot;

  const MoreDetails({
    Key? key,
    required this.snapshot,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Image.asset('assets/images/5.jpg'),
                ],
              ),
            ),
            Center(
                child: Text(
                  "Event Details",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Event Name : ${snapshot.value['name']}",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Text(
                      "Topic : ${snapshot.value['topic']}",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Text(
                      "Date : ${snapshot.value['date']}",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Text(
                      "Venue : ${snapshot.value['venue']}",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Text(
                      "Description : ${snapshot.value['description']}",
                      style: TextStyle(fontSize: 18.0),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//<------------------------------------------------Container designed for list items--------------------->
class ListContainer extends StatelessWidget {
  final String? DateNum;
  final int MonthNum;
  final String? Day;
  final String? time;
  final String? EventName;
  final VoidCallback? ontap;

  const ListContainer(
      {Key? key,
        this.DateNum,
        this.ontap,
        this.Day,
        this.EventName,
        required this.MonthNum,
        this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List month = [
      'JAN',
      'FEB',
      'MAR',
      'APR',
      'MAY',
      'JUN',
      'JLY',
      'AUG',
      'SEP',
      'OCT',
      'NOV',
      'DEC'
    ];

    return Material(
      elevation: 2,
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: ontap,
        child: Container(
          width: double.infinity,
          height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            //color: Colors.red,
          ),
          padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
          child: Row(
            children: [
              Stack(
                children: [
                  Transform.rotate(
                    angle: math.pi / 18.0,
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.purpleAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          month[MonthNum - 1],
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "$DateNum",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                width: size.width * .07,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$Day $time",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: size.height * .01,
                  ),
                  Container(
                    width: size.width * .5,
                    child: Text(
                      "$EventName",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
