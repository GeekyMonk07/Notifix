import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:file_picker/file_picker.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:appnewui/Pages/HomePageItems/ItemBox/firebase_api.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class UploadTimetable extends StatefulWidget {
  @override
  _UploadTimetableState createState() => _UploadTimetableState();
}

class _UploadTimetableState extends State<UploadTimetable> {
  UploadTask? task;
  File? file;
  final database = FirebaseDatabase.instance.reference();
  late bool _isButtonDisabled;
  @override
  void initState() {
    _isButtonDisabled = false;
  }

  String DropDownBranchValue = "CSE";
  String dropdownYearValue = '1';
  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file!.path) : 'No File Selected';
    Size size = MediaQuery.of(context).size;

    return Material(
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //<--------------------------Top Bar STARTS-------------------------->
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
                        "Update TimeTable",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  height: 60,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Color(0xffF1E6FF),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(22),
                          bottomRight: Radius.circular(22))),
                ),
              ),
              //<--------------------------Top Bar ENDS-------------------------->

              //<-------------------------- Animation STARTS-------------------------->

              Lottie.asset("assets/images/updateTimeTablePage.json",
                  height: 300),

              //<-------------------------- Animation ENDS-------------------------->
              //<-------------------------- Year Selection STARTS-------------------------->

              //<-------------------------- Year Selection ENDS-------------------------->
              SizedBox(
                height: 8,
              ),
              //<--------------------------Branch Selection STARTS-------------------------->
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xffF1E6FF),
                ),
                height: 50,
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(35, 0, 40, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        " BRANCH",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      DropdownButton<String>(
                        value: DropDownBranchValue,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(
                          color: Color(0xff6F35A5),
                        ),
                        underline: Container(
                          height: 2,
                          color: Color(0xff6F35A5),
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            DropDownBranchValue = newValue!;
                          });
                        },
                        items: <String>[
                          'SEM 1',
                          'SEM 2',
                          'EE',
                          'ECE',
                          'CE',
                          'CSE',
                          'IT',
                          'ME'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ),
              ),
              //<-------------------------- Branch Selection ENDS-------------------------->
              SizedBox(height: 12),
              //<-------------------------- FILE SELECTION BUTTON STARTS--------------------->
              UploadButton(
                imgtext: "SELECT FILE",
                colorButton: Color(0xffF1E6FF),
                ontap: _isButtonDisabled? null : selectFile,
              ),
              //<-------------------------- FILE SELECTION BUTTON ENDS--------------------->
              SizedBox(height: 8),
              Text(
                fileName,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20),
//<-------------------------- UPLOAD BUTTON STARTS--------------------->
              UploadButton(
                imgtext: _isButtonDisabled ? "Hold on..." : "Upload",
                colorButton: Color(0xff6F35A5),
                ontap: _isButtonDisabled ? null: uploadFile,
              ),
//<-------------------------- UPLOAD BUTTON ENDS--------------------->
              task != null ? buildUploadStatus(task!) : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));
  }

  Future uploadFile() async {
    setState(() {
      _isButtonDisabled = true;
    });
    if (file == null) return;

    final fileName = basename(file!.path);
    final destination = 'timetable/$DropDownBranchValue/$fileName';

    task = FirebaseApi.uploadFile(destination, file!);

    if (task == null) return;

    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    set_database(urlDownload, fileName);

  }

  String cryptoRandom([int length = 32]) {
    final Random _random = Random.secure();
    var values = List<int>.generate(length, (i) => _random.nextInt(256));
    return base64Url.encode(values);
  }

  Future set_database(String url, String temp_file) async {
    final uploadNotes = database.child('timetable/$DropDownBranchValue/');
    try {
      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat('dd MMMM hh:mma');
      final String date = formatter.format(now);
      print(date);
      await uploadNotes.child(cryptoRandom()).update({
        'file_name': temp_file,
        'url': url,
        'time': date,
        'timestamp': ServerValue.timestamp
      });

      Fluttertoast.showToast(msg: "Uploaded succesfully");

    } catch (e) {
      Fluttertoast.showToast(msg: 'You got error $e');
    }
    setState(() {
      task = null;
      _isButtonDisabled = false;
      file = null;
    });
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);

            return Text(
              '$percentage %',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            );
          } else {
            return Container();
          }
        },
      );
}

//<-------------------------- CLASS FOR BUTTONS USED--------------------->

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
      borderRadius: BorderRadius.circular(30),
      color: colorButton,
      //color: Color(0xffF1E6FF),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: ontap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
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
