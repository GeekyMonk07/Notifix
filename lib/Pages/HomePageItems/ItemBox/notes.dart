import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:appnewui/Pages/HomePageItems/UPLOAD%20BUTTON%20DATA/EventsPageItems/UploadTimeTable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:appnewui/Pages/HomePageItems/ItemBox/firebase_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import 'package:intl/intl.dart';


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  UploadTask? task;
  File? file;
  final database = FirebaseDatabase.instance.reference();


  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file!.path) : 'No File Selected';

    return Scaffold(
      appBar: AppBar(
        title: Text("Upload pdfs"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UploadButton(
                imgtext: "SELECT FILE",
                colorButton: Color(0xffF1E6FF),
                ontap: selectFile,
              ),
              SizedBox(height: 8),
              Text(
                fileName,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 48),
              UploadButton(
                imgtext: "UPLOAD",
                colorButton: Color(0xff6F35A5),
                ontap: uploadFile,
              ),
              SizedBox(height: 20),
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
    if (file == null) return;
    final fileName = basename(file!.path);
    final destination = 'File/$fileName';
    task = FirebaseApi.uploadFile(destination, file!);
    if (task == null) return;
    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    set_database(urlDownload, fileName);
  }
  String cryptoRandom([int length = 32]){
    final Random _random = Random.secure();
    var values = List<int>.generate(length,(i)=>_random.nextInt(256));
    return base64Url.encode(values);
  }
  Future set_database(String url, String file) async{
    final uploadNotes = database.child('uploadnotes/');
    try{
      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat('dd MMMM hh:mma');
      final String date = formatter.format(now);
      print(date);
      await uploadNotes.child(cryptoRandom()).update({'file_name':file,'url':url,'time':date,'timestamp':ServerValue.timestamp});
      Fluttertoast.showToast(msg:"uploaded succesfully");
      print("uploaded succesfully");
    } catch(e){
      print('You got error $e');
    }
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
    stream: task.snapshotEvents,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        print("Triggered task upload");
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
