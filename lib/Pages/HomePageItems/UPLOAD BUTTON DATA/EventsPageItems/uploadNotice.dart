// ignore: file_names
import 'dart:convert';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:appnewui/constrants.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

class UploadNotice extends StatefulWidget {
  const UploadNotice({Key? key}) : super(key: key);

  @override
  _UploadNoticeState createState() => _UploadNoticeState();
}

class _UploadNoticeState extends State<UploadNotice> {
  late String description;
  late String title;
  late bool _isButtonDisabled;
  @override
  void initState() {
    _isButtonDisabled = false;
  }

  final database = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Material(
      child: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
                    "Notice",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              height: size.height * .075,
              width: size.width,
              decoration: BoxDecoration(
                  color: secondaryPurple,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(22),
                      bottomRight: Radius.circular(22))),
            ),
          ),
          // <-----------------------------------------------Top Bar ends-------------------------------------------->
          Expanded(
              child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),

                Container(
                  child: Text('Enter details of the notice',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: secondaryPurple,
                      filled: true,
                      hintText: "Notice title",
                      border: InputBorder.none,
                    ),
                    onChanged: (String value) => {
                      setState(() {
                        title = value;
                      })
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 4, 15, 8),
                  child: TextFormField(
                    maxLines: 6,
                    decoration: InputDecoration(
                      fillColor: secondaryPurple,
                      filled: true,
                      hintText: "Description",
                      border: InputBorder.none,
                    ),
                    onChanged: (String value) => {
                      setState(() {
                        description = value;
                      })
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                UploadButton(
                  ontap: _isButtonDisabled ? null : updateNotice,
                  imgtext: _isButtonDisabled ? "Hold on..." : "SUBMIT",
                  colorButton: primaryColor,
                  colorText: Colors.white,
                ),
                // TextButton(
                //     style: TextButton.styleFrom(backgroundColor: primaryColor),
                //     onPressed: _isButtonDisabled ? null : updateNotice,
                //     child: Text(_isButtonDisabled ? "Hold on..." : "Submit",
                //         style: TextStyle(
                //           color: Colors.white,
                //           fontWeight: FontWeight.bold,
                //         ))),
              ],
            ),
          )),
        ],
      )),
    ));
  }

  String cryptoRandom([int length = 32]) {
    final Random _random = Random.secure();
    var values = List<int>.generate(length, (i) => _random.nextInt(256));
    return base64Url.encode(values);
  }

  Future updateNotice() async {
    setState(() {
      _isButtonDisabled = true;
    });
    try {
      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat('dd MMMM hh:mma');
      final String date = formatter.format(now);
      await database.child("notices").child(cryptoRandom()).update({
        'title': title,
        'description': description,
        'time': date,
        'timestamp': ServerValue.timestamp
      });
      Fluttertoast.showToast(msg: "Notice added succesfully");
    } catch (e) {
      Fluttertoast.showToast(msg: "$e");
    }
    setState(() {
      _isButtonDisabled = false;
    });
  }
}

//<-------------------------- CLASS FOR BUTTONS USED At the end--------------------->

class UploadButton extends StatelessWidget {
  final String imgtext;
  final VoidCallback? ontap;
  final Color? colorText;
  final Color? colorButton;

  const UploadButton(
      {Key? key,
      required this.imgtext,
      this.ontap,
      this.colorText,
      this.colorButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(5),
      color: colorButton,
      //color: Color(0xffF1E6FF),
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: ontap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          height: 50,
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$imgtext",
                style: TextStyle(
                    color: (colorButton == Color(0xff6F35A5))
                        ? Colors.white
                        : Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}
