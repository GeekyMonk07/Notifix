import 'package:appnewui/Pages/settingsPageItems/buttons.dart';
import 'package:appnewui/constrants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
  void initState(){
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    assert(user!=null);
    extractEmail();
    extractName();
    while(uniqueId==""){

    }
    _ref = FirebaseDatabase.instance
        .reference()
        .child('/user_details_for_registration/$uniqueId')
        .orderByChild('name');
  }

  void extractEmail () {
    String email = user?.email;
    var idx = 0;
    while(email[idx]!='@'){
      uniqueId += email[idx];
      idx++;
    }
  }

  void extractName(){
    String name = user?.displayName;
    var idx = 0;
    while(idx<name.length){
      if(name[idx]==' ')break;
      first_name += name[idx];
      idx++;
    }
  }

  //final _database=FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    print(user?.photoURL);

    Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: Material(
            color: Colors.white,
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
                          Lottie.asset("assets/images/profilepage.json",
                              height: 30),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Profile",
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
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      ClipOval(
                        child: Material(
                          color: Colors.transparent,
                          child: Image.network("${user?.photoURL}"),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${first_name}",
                        // user.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "${user?.email}",
                        //user.email,
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 40,
                        width: size.width * 0.75,
                        color: secondaryPurple,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Branch : ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'CSE',
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'SEM : ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'III',
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 80,
                        width: size.width * 0.90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: secondaryPurple,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Registered Events',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 25,
                                ),
                              ),
                              Divider(
                                thickness: 2.5,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(22.0),
                      child: Container(
                        height: size.height * 0.39,
                        child: FirebaseAnimatedList(
                          query: _ref,
                          itemBuilder: (BuildContext context,
                              DataSnapshot snapshot,
                              Animation<double> animation,
                              int index) {
                            return Column(
                              children: [
                                Container(
                                  height: size.height * 0.12,
                                  width: size.width * 0.7,
                                  decoration: BoxDecoration(
                                    color: secondaryPurple,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                          child: Text(
                                            "Event Name : ${snapshot.value['name']}",
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      //  Flexible(child: Text("Topic : ${snapshot.value['topic']}",style: TextStyle(fontSize: 18.0),)),
                                      Text(
                                        "Date : ${snapshot.value['date']}",
                                        style: TextStyle(fontSize: 18.0),
                                      ),
                                      //  Text("Venue : ${snapshot.value['venue']}",style: TextStyle(fontSize: 18.0),),
                                      // Text("Description : ${snapshot.value['description']}",style: TextStyle(fontSize: 18.0),)
                                      TextButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) =>
                                                    Dialog(
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              12.0)), //this right here
                                                      child: Container(
                                                        // height: 300.0,
                                                        // width: 600.0,

                                                        child: Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                          children: <
                                                              Widget>[
                                                            Padding(
                                                              padding:
                                                              const EdgeInsets
                                                                  .all(
                                                                  10.0),
                                                              child: Column(
                                                                children: <
                                                                    Widget>[
                                                                  Image.asset(
                                                                      'assets/images/5.jpg'),
                                                                ],
                                                              ),
                                                            ),
                                                            Center(
                                                                child: Text(
                                                                  "Event Details",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                      20.0,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                                )),
                                                            Padding(
                                                              padding:
                                                              const EdgeInsets
                                                                  .all(
                                                                  8.0),
                                                              child:
                                                              Container(
                                                                child:
                                                                Column(
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                                  children: [
                                                                    Text(
                                                                      "Event Name : ${snapshot.value['name']}",
                                                                      style:
                                                                      TextStyle(fontSize: 18.0),
                                                                    ),
                                                                    Text(
                                                                      "Topic : ${snapshot.value['topic']}",
                                                                      style:
                                                                      TextStyle(fontSize: 18.0),
                                                                    ),
                                                                    Text(
                                                                      "Date : ${snapshot.value['date']}",
                                                                      style:
                                                                      TextStyle(fontSize: 18.0),
                                                                    ),
                                                                    Text(
                                                                      "Venue : ${snapshot.value['venue']}",
                                                                      style:
                                                                      TextStyle(fontSize: 18.0),
                                                                    ),
                                                                    Text(
                                                                      "Description : ${snapshot.value['description']}",
                                                                      style:
                                                                      TextStyle(fontSize: 18.0),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ));
                                          },
                                          child: Text("Details"))
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ])));
  }
}
