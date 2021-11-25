import 'package:appnewui/Pages/Permission/permissionCard.dart';
import 'package:appnewui/constrants.dart';
import 'package:flutter/material.dart';

class PermissionPage extends StatelessWidget {
  // const PermissionPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            //elevation: 5.0,
            toolbarHeight: 60,
            title: Text(
              "Permission",
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            flexibleSpace: Container(
                decoration: BoxDecoration(
                    color: secondaryPurple,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(22.0),
                        bottomRight: Radius.circular(22.0))))),
        body: SingleChildScrollView(
          child: Column(
            children: [
              PermissionCard(
                AcceptPress: () {},
                DeclinePress: () {},
              ),
              PermissionCard(
                AcceptPress: () {},
                DeclinePress: () {},
              ),
              PermissionCard(
                AcceptPress: () {},
                DeclinePress: () {},
              ),
            ],
          ),
        ));
  }
}
