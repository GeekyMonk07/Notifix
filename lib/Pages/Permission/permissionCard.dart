import 'package:appnewui/constrants.dart';
import 'package:flutter/material.dart';

class PermissionCard extends StatelessWidget {
  final VoidCallback AcceptPress;
  final VoidCallback DeclinePress;
  final String? Title;
  final String? uniqueId;
  final String? email;
  final String? name;

  final String? Description;
  final String? Venue;
  final String? Date;
  final String? Time;

  const PermissionCard(
      {Key? key,
      required this.AcceptPress,
      required this.DeclinePress,
      required this.Title,
      required this.name,
      required this.uniqueId,
      required this.email,
      required this.Description,
      required this.Venue,
      required this.Date,
      required this.Time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
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
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "Action Required!",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "TiTle :${Title!}",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    "Date : ${Date!}",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 05.0,
                  ),
                  //SizedBox(width: 10,),
                  Text(
                    "jdhfg",
                    // "Slot : ${(Date![(Date?.length)!-1]=='A')?"09:00 AM- 02:00 PM":"03:00 PM - 07:00 PM"}",
                    style: TextStyle(fontSize: 15),
                  ),
                  //SizedBox(height: 20,),
                  SizedBox(
                    height: 15.0,
                  ),

                  Text(
                    "Venue: ${Venue!}",
                    style: TextStyle(fontSize: 15),
                  ),
                  //SizedBox(height: 20,),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    "Name of Organiser : ${name!}",
                    style: TextStyle(fontSize: 15),
                  ),
                  //SizedBox(height: 20,),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    "Description of Event : ${Description!}",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            //SizedBox(

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
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(44)),
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
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(44)),
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
      ),
    );
  }
}
