import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TimeTableBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      elevation: 5,
      color: Color(0xffF1E6FF),
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () => Navigator.pushNamed(context, "/timetable"),
        child: Container(
          width: size.width,
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, top: 12, bottom: 10),
                    child: Text(
                      "TimeTable Info",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                    ),
                    child: Text("No more hassle to check your"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text("college timetable!"),
                  )
                ],
              ),
              Container(
                height: 300,
                width: 150,
                child: SvgPicture.asset(
                  "assets/images/timetable.svg",
                  fit: BoxFit.fill,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
