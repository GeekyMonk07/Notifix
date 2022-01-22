// ignore: file_names
import 'dart:convert';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:appnewui/constrants.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


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
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            //elevation: 5.0,
            toolbarHeight: 60,
            title: Text(
              "Notice",
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
                child: Text('Enter details of the notice',
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
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                maxLines: 6,
                decoration: InputDecoration(
                  // fillColor: primaryBrown,
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
            TextButton(
                style: TextButton.styleFrom(backgroundColor: primaryColor),
                onPressed: _isButtonDisabled ? null : updateNotice,
                child: Text(_isButtonDisabled ? "Hold on..." : "Submit",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ))),
          ],
        ))));
  }
  String cryptoRandom([int length = 32]){
    final Random _random = Random.secure();
    var values = List<int>.generate(length,(i)=>_random.nextInt(256));
    return base64Url.encode(values);
  }
  Future updateNotice() async {
    setState(() {
      _isButtonDisabled = true;
    });
    try{
      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat('dd MMMM hh:mma');
      final String date = formatter.format(now);
      await database.child("notices").child(cryptoRandom()).update({
        'title': title,
        'description': description,
        'time':date,
        'timestamp': ServerValue.timestamp
      });
      Fluttertoast.showToast(msg:"Notice added succesfully");
    }catch(e){
      Fluttertoast.showToast(msg:"$e");
    }
    setState(() {
      _isButtonDisabled = false;
    });
  }
}
