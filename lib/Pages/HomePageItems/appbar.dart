// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'string_extension.dart';

class TopBar extends StatelessWidget {
  //const TopBar({Key? key}) : super(key: key);
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    String alter_image_url =
        "https://img.icons8.com/fluency/100/000000/test-account.png";
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(22), bottomRight: Radius.circular(22)),
      child: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 20),
        height: 60,
        decoration: BoxDecoration(
            color: Color(0xffF1E6FF),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(22),
                bottomRight: Radius.circular(22))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //<--------------------------------------DP------------------------------------------->
            ClipOval(
              child: Material(
                color: Colors.transparent,
                child: Image.network(
                  user?.photoURL == null
                      ? alter_image_url
                      : "${user!.photoURL}",
                  fit: BoxFit.cover,
                  width: 37,
                  height: 37,
                ),
              ),
            ),
            //<--------------------------------------DP ends------------------------------------------->
            // Container(
            //   width: 35,
            //   height: 35,
            //   // ignore: prefer_const_constructors
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     image: DecorationImage(
            //         image:
            //             AssetImage("assets/images/user.png"), //  NetworkImage(
            //         //     'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
            //         fit: BoxFit.cover),
            //   ),
            // ),
            Text(
              "Hey, ${extractName()}",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 25,
              width: 25,
              child: InkWell(
                  onTap: () => Navigator.pushNamed(context, "/labs"),
                  child: Image.asset("assets/images/bellicon.png")),
            ),
          ],
        ),
      ),
    );
  }

  String extractName() {
    String first_name = "";
    String? name = user?.displayName;
    var idx = 0;
    // print(name);
    while (idx < name!.length) {
      if (name[idx] == ' ') break;
      first_name += name[idx];
      idx++;
    }

    return first_name.toTitleCase();
  }
}
