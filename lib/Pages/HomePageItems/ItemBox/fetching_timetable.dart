
import 'package:appnewui/constrants.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

class TimeTable extends StatelessWidget {
  final String branch;
  TimeTable({required this.branch});
  final database = FirebaseDatabase.instance.reference();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              //elevation: 5.0,
              toolbarHeight: 60,
              title: Text(
                branch,
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
              flexibleSpace: Container(
                  decoration: BoxDecoration(
                      color: secondaryPurple,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(22.0),
                          bottomRight: Radius.circular(22.0))))),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
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
                        subtitle: Text("Updated on "+(next_pdf['time']==null ?"":next_pdf['time'])),
                        onTap: () {
                          launch(next_pdf["url"]);
                        },
                      );
                      tilesList.add(orderTile);
                    });
                    // tilesList.reversed.toList();
                    return Expanded(
                      child: ListView(
                        children: tilesList,
                        reverse: true,
                        shrinkWrap: true,
                      ),
                    );
                  }
                  return Center(child: CircularProgressIndicator(),);
                })
          )),
    );
  }
}
