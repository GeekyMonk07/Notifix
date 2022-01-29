// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:appnewui/constrants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'string_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  width: 37,
                  height: 37,
                  imageUrl: user?.photoURL == null
                      ? alter_image_url
                      : "${user!.photoURL}",
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: CircularProgressIndicator(
                        color: primaryColor, value: downloadProgress.progress),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            //<--------------------------------------DP ends------------------------------------------->

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
