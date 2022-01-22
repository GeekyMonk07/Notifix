import 'package:appnewui/constrants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'fetching_timetable.dart';

class TimeTables extends StatelessWidget {
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
            body: Material(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(crossAxisCount: 2, children: <Widget>[
                  Container(
                      child: Column(children: [
                    Image.asset('assets/images/sem1.png',
                        fit: BoxFit.cover, width: 120, height: 120),
                        TextButton(
                          onPressed: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=> TimeTable(branch:"SEM 1")));
                          },
                          child: Text('SEM 1',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                  ])),
                  Container(
                      child: Column(children: [
                    Image.asset('assets/images/sem2.png',
                        fit: BoxFit.cover, width: 120, height: 120),
                        TextButton(
                          onPressed: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=> TimeTable(branch:"SEM 2")));
                          },
                          child: Text('SEM 2',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                  ])),
                  Container(
                      child: Column(children: [
                    Image.asset('assets/images/cse.png',
                        fit: BoxFit.cover, width: 120, height: 120),
                    TextButton(
                      onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=> TimeTable(branch:"CSE")));
                      },
                      child: Text('CSE',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ])),
                  Container(
                      child: Column(children: [
                    Image.asset('assets/images/ece.png',
                        fit: BoxFit.cover, width: 120, height: 120),
                        TextButton(
                          onPressed: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=> TimeTable(branch:"ECE")));
                          },
                          child: Text('ECE',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                  ])),
                  Container(
                      child: Column(children: [
                    Image.asset('assets/images/it.png',
                        fit: BoxFit.cover, width: 120, height: 120),
                        TextButton(
                          onPressed: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=> TimeTable(branch:"IT")));
                          },
                          child: Text('IT',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                  ])),
                  Container(
                      child: Column(children: [
                    Image.asset('assets/images/mech.png',
                        fit: BoxFit.cover, width: 120, height: 120),
                        TextButton(
                          onPressed: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=> TimeTable(branch:"ME")));
                          },
                          child: Text('MECH',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                  ])),
                  Container(
                      child: Column(children: [
                    Image.asset('assets/images/civil.png',
                        fit: BoxFit.cover, width: 120, height: 120),
                        TextButton(
                          onPressed: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=> TimeTable(branch:"CE")));
                          },
                          child: Text('CIVIL',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                  ])),
                  Container(
                      child: Column(children: [
                    Image.asset('assets/images/ee.png',
                        fit: BoxFit.cover, width: 120, height: 120),
                        TextButton(
                          onPressed: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=> TimeTable(branch:"EE")));
                          },
                          child: Text('EE',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                  ])),
                ]),
              ),
            )));
  }
}
