import 'package:appnewui/constrants.dart';
import 'package:flutter/material.dart';

class PermissionCard extends StatelessWidget {
  final VoidCallback AcceptPress;
  final VoidCallback DeclinePress;
  final String? Title;
  final String? SubTitle;
  final String? Description;
  final String? Venue;
  final String? Date;
  final String? Time;

  const PermissionCard(
      {Key? key,
      required this.AcceptPress,
      required this.DeclinePress,
      this.Title,
      this.SubTitle,
      this.Description,
      this.Venue,
      this.Date,
      this.Time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(44),
        color: secondaryPurple,
      ),
      width: size.width,
      //height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Event Title: ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Event Subtitle: ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Description: ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Venue: ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Date: ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Time Slot: ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Material(
                borderRadius: BorderRadius.circular(44),
                color: primaryColor,
                child: InkWell(
                  borderRadius: BorderRadius.circular(44),
                  onTap: AcceptPress,
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(44)),
                    height: 50,
                    width: size.width / 2.7,
                    child: Center(
                      child: Text("ACCEPT",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ),
                ),
              ),
              Material(
                borderRadius: BorderRadius.circular(44),
                color: primaryColor,
                child: InkWell(
                  onTap: DeclinePress,
                  borderRadius: BorderRadius.circular(44),
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(44)),
                    height: 50,
                    width: size.width / 2.7,
                    child: Center(
                      child: Text(
                        "DECLINE",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
