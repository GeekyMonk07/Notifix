import 'package:appnewui/constrants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'fetching_timetable.dart';

class TimeTables extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      color: Colors.white,
      child: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [secondaryPurple, primaryColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3, 0.7])),
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
                      "Time Table",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                height: size.height * .075,
                width: size.width,
                decoration: BoxDecoration(
                    color: Color(0xffF1E6FF),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(22),
                        bottomRight: Radius.circular(22))),
              ),
            ),
            // <-----------------------------------------------Top Bar-------------------------------------------->
            SizedBox(
              height: size.height * .02,
            ),
            Expanded(
                child: GridView.count(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              // mainAxisSpacing: 20,
              crossAxisSpacing: 5,
              padding: EdgeInsets.only(bottom: 30),
              scrollDirection: Axis.vertical,
              childAspectRatio: 1,
              shrinkWrap: true,

              mainAxisSpacing: 5,
              crossAxisCount: 2,
              children: [
                //<----------------------------------------------------------------------------------------->
                ContainerBlock(
                  imageurl: 'assets/images/sem1.png',
                  branch: "SEM 1",
                  tap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TimeTable(branch: "SEM 1")));
                  },
                ),
                //<----------------------------------------------------------------------------------------->
                ContainerBlock(
                  imageurl: 'assets/images/sem2.png',
                  branch: "SEM 2",
                  tap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TimeTable(branch: "SEM 2")));
                  },
                ),
                //<----------------------------------------------------------------------------------------->
                ContainerBlock(
                  imageurl: 'assets/images/cse.png',
                  branch: "CSE",
                  tap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TimeTable(branch: "CSE")));
                  },
                ),
                //<----------------------------------------------------------------------------------------->
                ContainerBlock(
                  imageurl: 'assets/images/ece.png',
                  branch: "ECE",
                  tap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TimeTable(branch: "ECE")));
                  },
                ),
                //<----------------------------------------------------------------------------------------->
                ContainerBlock(
                  imageurl: 'assets/images/it.png',
                  branch: "IT",
                  tap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TimeTable(branch: "IT")));
                  },
                ),
                //<----------------------------------------------------------------------------------------->
                ContainerBlock(
                  imageurl: 'assets/images/mech.png',
                  branch: "MECH",
                  tap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TimeTable(branch: "ME")));
                  },
                ),
                //<----------------------------------------------------------------------------------------->
                ContainerBlock(
                  imageurl: 'assets/images/civil.png',
                  branch: "CIVIL",
                  tap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TimeTable(branch: "CE")));
                  },
                ),
                //<----------------------------------------------------------------------------------------->
                ContainerBlock(
                  imageurl: 'assets/images/ee.png',
                  branch: "EE",
                  tap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TimeTable(branch: "EE")));
                  },
                ),

                //<----------------------------------------------------------------------------------------->
              ],
            )),
          ],
        ),
      )),
    );
  }
}

//<--------------------------------class for making block of timetable---------------------------->
class ContainerBlock extends StatelessWidget {
  final VoidCallback? tap;
  final String? branch;
  final String? imageurl;
  const ContainerBlock({Key? key, this.tap, this.branch, this.imageurl})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      color: Colors.white,
      child: InkWell(
        splashColor: primaryColor,
        onTap: tap,
        child: Container(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            '$imageurl',
            fit: BoxFit.fitHeight,
            width: size.width * .3,
          ),
          Text('$branch',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              )),
        ])),
      ),
    );
  }
}
