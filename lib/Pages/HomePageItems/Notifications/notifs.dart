import 'package:appnewui/constrants.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

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
  void initState(){
    super.initState();
    _ref = FirebaseDatabase.instance
        .reference()
        .child('/verified')
        .orderByChild('name');
    user = FirebaseAuth.instance.currentUser;
    assert(user!=null);
    extractEmail();
  }

  void extractEmail(){
    String email = user?.email;
    var idx = 0;
    while(email[idx]!='@'){
      uniqueId += email[idx];
      idx++;
    }
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
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: FirebaseAnimatedList(
              query: _ref,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                //final nextOrder=Map<String,dynamic>.from(value);
                Map contact = snapshot.value;
                contact['key'] = snapshot.key;
                var count = snapshot.value['registrations'];
                int ok = 1;

                return Container(
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
                            snapshot.value['name'].toString(),
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            snapshot.value['date'].toString(),
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                            ),
                          )
                        ])),
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 7),
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          snapshot.value['topic'].toString(),
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              12.0)), //this right here
                                      child: Container(
                                        // height: 300.0,
                                        // width: 600.0,

                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Column(
                                                children: <Widget>[
                                                  Image.asset(
                                                      'assets/images/5.jpg'),
                                                ],
                                              ),
                                            ),
                                            Center(
                                                child: Text(
                                              "Event Details",
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "Event Name : ${snapshot.value['name']}",
                                                      style: TextStyle(
                                                          fontSize: 18.0),
                                                    ),
                                                    Text(
                                                      "Topic : ${snapshot.value['topic']}",
                                                      style: TextStyle(
                                                          fontSize: 18.0),
                                                    ),
                                                    Text(
                                                      "Date : ${snapshot.value['date']}",
                                                      style: TextStyle(
                                                          fontSize: 18.0),
                                                    ),
                                                    Text(
                                                      "Venue : ${snapshot.value['venue']}",
                                                      style: TextStyle(
                                                          fontSize: 18.0),
                                                    ),
                                                    Text(
                                                      "Description : ${snapshot.value['description']}",
                                                      style: TextStyle(
                                                          fontSize: 18.0),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            FloatingActionButton.extended(
                                              onPressed: () async => {
                                                // s=snapshot.value['date'],
                                                //
                                                // s=s.substring(0,11)+" "+snapshot.value['topic'],
                                                s = snapshot.value['date'] + " "+snapshot.value['topic'] ,
                                                // print(snapshot.value),
                                                if (await check(s) == false)
                                                  {
                                                    reference
                                                        .child(snapshot
                                                            .value['key'])
                                                        .update({
                                                      'registrations': count + 1
                                                    }).whenComplete(
                                                            () => ok = 0),
                                                    _database
                                                        .child(
                                                            '/user_details_for_registration/$uniqueId/$s')
                                                        .set(snapshot.value)
                                                        .then((value) => print(
                                                            'updated 1st '))
                                                        .catchError((onError) =>
                                                            print(
                                                                'error log 1')),
                                                    _database
                                                        .child(
                                                            '/event_registration_user_detials/$s')
                                                        .push()
                                                        .set(
                                                            {'emailId': user!.email})
                                                        .then((value) =>
                                                            print('pushed 2nd'))
                                                        .catchError((onError) =>
                                                            print(onError
                                                                .toString())),
                                                  }
                                                else if (await check(s) == true)
                                                  {
                                                    _showDeleteDialog(),
                                                  }
                                              },
                                              label: Text("Register"),
                                              backgroundColor: primaryColor,
                                              icon: Icon(Icons.add),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ));
                          },
                          child: Text("Details")),
                    ],
                  ),
                );
              },

            ),

          ),

        ),

      ),

    );
  }
}
