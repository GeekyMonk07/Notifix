import 'package:appnewui/constrants.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../profilenew.dart';

class Notifs extends StatefulWidget {
  @override
  _NotifsState createState() => _NotifsState();
}

class _NotifsState extends State<Notifs> {
  late Query _ref;
  late final user;
  late String s;
  String uniqueId = "";
  late String name, date, topic, description, venue;
  final String body =
      'Thank you for registering your event. Director/HOD office has viewed your request and granted Permission for so. ';

  DatabaseReference _database = FirebaseDatabase.instance.reference();
  DatabaseReference reference =
  FirebaseDatabase.instance.reference().child('/verified');

  @override
  void initState() {
    super.initState();
    _ref = FirebaseDatabase.instance
        .reference()
        .child('/verified')
        .orderByChild('name');
    user = FirebaseAuth.instance.currentUser;
    //assert(user != null);
    extractEmail();
  }

  void extractEmail() {
    String email = user?.email;
    var idx = 0;
    while (email[idx] != '@') {
      uniqueId += email[idx];
      idx++;
    }
    print(uniqueId);
  }

  Future<bool> check(String time) async {
    bool ok = false;

    await _database
        .child('user_details_for_registration/$uniqueId')
        .once()
        .then((DataSnapshot snapshot) {
      //print("aya2");

      Map<dynamic, dynamic> values = snapshot.value;
      if (!snapshot.exists) return false;
      values.forEach((key, values) {
        if (key == time) ok = true;
      });
    });

    return ok;
  }

  Future<bool> rootFirebaseIsExists(String databaseReference) async {
    DataSnapshot snapshot = await _database.child(databaseReference).once();

    print(snapshot.value);
    print(snapshot.key);

    return snapshot.value != null;
  }

  _showDeleteDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('You are already Registered for the event'),
            content: Text(''),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //Size size = MediaQuery.of(context).size;
    int monthNum(String date, int id) {
      date = date.substring(0, date.length - 1);
      final DateTime day = DateFormat("dd MMMM yyyy").parse(date);
      print(day);

      if (id == 1) {
        return day.month;
      } else if (id == 2) {
        return day.day;
      } else {
        return day.weekday;
      }
    }

    String monthDay(String date) {
      date = date.substring(0, date.length - 1);
      final DateTime day = DateFormat("dd MMMM yyyy").parse(date);
      final DateFormat formatter = DateFormat('E');
      return formatter.format(day);
    }

    String getTime(String a) {
      a = a[a.length - 1];
      if (a == 'A') {
        return "9:30AM";
      } else {
        return "2:00PM";
      }
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Events',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: secondaryPurple,
        ),
        body: Container(
          child: FirebaseAnimatedList(
            defaultChild: Center(child:CircularProgressIndicator()),
            query: _ref,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              //final nextOrder=Map<String,dynamic>.from(value);
              Map contact = snapshot.value;
              contact['key'] = snapshot.key;
              var count = snapshot.value['registrations'];
              int ok = 1;
              return Padding(
                padding: const EdgeInsets.fromLTRB(25, 7, 25, 7),
                child: ListContainer(
                  MonthNum: monthNum(snapshot.value['date'], 1),
                  DateNum:
                  monthNum(snapshot.value['date'], 2)
                      .toString(),
                  // "Date : ${snapshot.value['date']}",
                  Day: monthDay(snapshot.value['date']),
                  EventName: snapshot.value['name'],
                  time: getTime(snapshot.value['date']),
                  color: (index % 2),
                  ontap: (){
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(
                                  12.0)), //this right here
                          child: Container(
                              decoration: BoxDecoration(
                                //  borderRadius: BorderRadius.circular(50)
                              ),
                              height: double.maxFinite,
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: [
                                  // SizedBox(
                                  //   height: size.height * 0.01,
                                  // ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.all(
                                        10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.ac_unit,
                                          color: Colors
                                              .transparent,
                                        ),
                                        Text(
                                          "Event Details",
                                          style: TextStyle(
                                              color: Colors
                                                  .black,
                                              fontSize: 18,
                                              fontWeight:
                                              FontWeight
                                                  .bold),
                                        ),
                                        IconButton(
                                            onPressed: () =>
                                                Navigator.of(
                                                    context)
                                                    .pop(),
                                            icon: Icon(
                                              Icons.close,
                                              size: 30,
                                            ))
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    child:
                                    SingleChildScrollView(
                                      scrollDirection:
                                      Axis.vertical,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment
                                                .start,
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .start,
                                            children: [
                                              Center(
                                                child: Container(
                                                    height: 200,
                                                    width:
                                                    size.width *
                                                        .65,
                                                    child: Image.asset(
                                                        'assets/images/5.jpg')),
                                              ),
                                              SizedBox(
                                                height: 12,
                                              ),
                                              Text(
                                                "Event Name : ${snapshot.value['name']}",
                                                style: TextStyle(
                                                    fontSize:
                                                    18.0),
                                              ),
                                              SizedBox(
                                                height: 12,
                                              ),
                                              Text(
                                                "Topic : ${snapshot.value['topic']}",
                                                style: TextStyle(
                                                    fontSize:
                                                    18.0),
                                              ),
                                              SizedBox(
                                                height: 12,
                                              ),
                                              Text(
                                                "Date : ${snapshot.value['date']}",
                                                style: TextStyle(
                                                    fontSize:
                                                    18.0),
                                              ),
                                              SizedBox(
                                                height: 12,
                                              ),
                                              Text(
                                                "Venue : ${snapshot.value['venue']}",
                                                style: TextStyle(
                                                    fontSize:
                                                    18.0),
                                              ),
                                              SizedBox(
                                                height: 12,
                                              ),
                                              Text(
                                                "Description : ${snapshot.value['description']}",
                                                style: TextStyle(
                                                    fontSize:
                                                    18.0),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(
                                    height: 10,
                                  ),
                                  FloatingActionButton
                                      .extended(
                                    onPressed: () async => {
                                      // s=snapshot.value['date'],
                                      //
                                      // s=s.substring(0,11)+" "+snapshot.value['topic'],
                                      s = snapshot
                                          .value['date'] +
                                          " " +
                                          snapshot
                                              .value['topic'],
                                      // print(snapshot.value),
                                      if (await check(s) ==
                                          false)
                                        {
                                          reference
                                              .child(snapshot
                                              .value[
                                          'key'])
                                              .update({
                                            'registrations':
                                            count + 1
                                          }).whenComplete(
                                                  () =>

                                              ok = 0),
                                          _database
                                              .child(
                                              '/user_details_for_registration/$uniqueId/$s')
                                              .set(snapshot
                                              .value)
                                              .then((value) =>
                                              print(
                                                  'updated 1st '))
                                              .catchError(
                                                  (onError) =>
                                                  print(
                                                      'error log 1')),
                                          _database
                                              .child(
                                              '/event_registration_user_detials/${uniqueId}/$s')
                                              .push()
                                              .set({
                                            'emailId':
                                            user!
                                                .email
                                          })
                                              .then((value) =>
                                              print(
                                                  'pushed 2nd'))
                                              .catchError((onError) =>
                                              print(onError
                                                  .toString())),
                                        }
                                      else if (await check(
                                          s) ==
                                          true)
                                        {
                                          _showDeleteDialog(),
                                        }
                                    },
                                    label: Text("Register"),
                                    backgroundColor:
                                    primaryColor,
                                    icon: Icon(Icons.add),
                                  ),
                                ],
                              )),
                        ));
                  },
                ),
              );

              // return Padding(
              //     padding: const EdgeInsets.all(10.0),
              //     child: Container(
              //         height: MediaQuery.of(context).size.height * 0.15,
              //         width: MediaQuery.of(context).size.width * 0.9,
              //         color: secondaryPurple,
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: <Widget>[
              //             Text(
              //               snapshot.value['name'].toString(),
              //               style: TextStyle(
              //                 fontFamily: 'Avenir',
              //                 fontSize: 20,
              //                 color: Colors.black,
              //                 fontWeight: FontWeight.w400,
              //               ),
              //             ),
              //             Text(
              //               snapshot.value['date'].toString(),
              //               style: TextStyle(
              //                 fontFamily: 'Avenir',
              //                 fontSize: 20,
              //                 color: Colors.black,
              //                 fontWeight: FontWeight.w300,
              //               ),
              //             ),
              //             TextButton(
              //                 onPressed: () {
              //
              //                 },
              //                 child: Text(
              //                   "Details",
              //                   style: TextStyle(
              //                     color: primaryColor,
              //                     fontSize: 15,
              //                   ),
              //                 ))
              //           ],
              //         )));
            },
          ),
        ),
      ),
    );
  }
}