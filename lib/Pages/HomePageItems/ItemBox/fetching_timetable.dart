import 'package:appnewui/constrants.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class TimeTable extends StatelessWidget {
  final String branch;
  TimeTable({required this.branch});
  final database = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      color: Colors.white,
      child: SafeArea(
          child: Column(
        children: [
          // <-----------------------------------------------Top Bar-------------------------------------------->
          Material(
            elevation: 5,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(22),
                bottomRight: Radius.circular(22)),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    branch,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              height: size.height * .075,
              width: size.width,
              decoration: BoxDecoration(
                  color: secondaryPurple,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(22),
                      bottomRight: Radius.circular(22))),
            ),
          ),
          // <-----------------------------------------------Top Bar ends-------------------------------------------->

          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  //<-------------------------- Animation STARTS-------------------------->

                  Lottie.asset("assets/images/fetchingTimetablePage.json",
                      height: 200),

                  //<-------------------------- Animation ENDS-------------------------->
                  SizedBox(
                    height: size.height * .02,
                  ),
                  Text(
                    "Find the attachments below",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: size.height * .025,
                  ),
                  //<-------------------------------------------------List of files-------------------------------------->
                  Material(
                    color: Colors.white,
                    // color: Colors.red,
                    child: StreamBuilder(
                        stream: database
                            .child('timetable/$branch')
                            .orderByChild('timestamp')
                            .limitToLast(5)
                            .onValue,
                        builder: (context, AsyncSnapshot<Event> snapshot) {
                          final tilesList = <ListTile>[];
                          if (snapshot.hasData) {
                            final abc = Map<String, dynamic>.from(
                                (snapshot.data! as Event).snapshot.value);
                            abc.forEach((key, value) {
                              final next_pdf = Map<String, dynamic>.from(value);
                              final orderTile = ListTile(
                                leading: Icon(Icons.picture_as_pdf),
                                title: Text(next_pdf['file_name']),
                                subtitle: Text("Updated on " +
                                    (next_pdf['time'] == null
                                        ? ""
                                        : next_pdf['time'])),
                                onTap: () {
                                  launch(next_pdf["url"]);
                                },
                              );
                              tilesList.add(orderTile);
                            });
                            // tilesList.reversed.toList();
                            // return ListView(
                            //   children: tilesList,
                            //   reverse: true,
                            //   shrinkWrap: true,

                            // );

                            return (ListView.separated(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              reverse: true,
                              padding: const EdgeInsets.all(8),
                              itemCount: tilesList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: secondaryPurple,
                                  ),
                                  height: 60,
                                  child: tilesList[index],
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const Divider(),
                            ));
                          }
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }),
                  )
                  //<-------------------------------------------------list of files-------------------------------------->
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
