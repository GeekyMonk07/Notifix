import 'package:appnewui/constrants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TimeTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              //elevation: 5.0,
              toolbarHeight: 60,
              title: Text(
                "Timetable",
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
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return
                    //InkWell(
                    // onTap: () => Navigator.pushNamed(context, "/branch"),
                    //child:
                    Card(
                  color: secondaryPurple,
                  margin: EdgeInsets.all(5),
                  child: Center(
                      child: Text("SEM " + (index + 1).toString(),
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold))),
                  //),
                );
              },
            ),
          )),
    );
  }
}
