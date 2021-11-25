import 'package:appnewui/constrants.dart';
import 'package:flutter/material.dart';

class EventForm extends StatelessWidget {
  const EventForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            //elevation: 5.0,
            toolbarHeight: 60,
            title: Text(
              "Organise Event",
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            flexibleSpace: Container(
                decoration: BoxDecoration(
                    color: secondaryPurple,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(22.0),
                        bottomRight: Radius.circular(22.0))))),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Text('To organize your event enter your details here. ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  // fillColor: primaryBrown,
                  filled: true,
                  hintText: "Name",
                  border: InputBorder.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  // fillColor: primaryBrown,
                  filled: true,
                  hintText: "Unique ID",
                  border: InputBorder.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  // fillColor: primaryBrown,
                  filled: true,
                  hintText: "Name of the event/purpose",
                  border: InputBorder.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  // fillColor: primaryBrown,
                  filled: true,
                  hintText: "Venue",
                  border: InputBorder.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  // fillColor: primaryBrown,
                  filled: true,
                  hintText: "Time",
                  border: InputBorder.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  // fillColor: primaryBrown,
                  filled: true,
                  hintText: "Tenure",
                  border: InputBorder.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                maxLines: 6,
                decoration: InputDecoration(
                  // fillColor: primaryBrown,
                  filled: true,
                  hintText: "Description",
                  border: InputBorder.none,
                ),
              ),
            ),
            TextButton(
                style: TextButton.styleFrom(backgroundColor: primaryColor),
                onPressed: () {},
                child: Text("Submit",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ))),
          ],
        ))));
  }
}
