import 'dart:io';
import 'package:appnewui/Pages/HomePageItems/GoogleAuth/googleAuth.dart';
import 'package:excel/excel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart' as Path;
import 'package:google_sign_in/google_sign_in.dart' as signIn;
import 'package:path_provider/path_provider.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:lottie/lottie.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:appnewui/constrants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Bucketform extends StatefulWidget {
  const Bucketform({Key? key}) : super(key: key);

  @override
  State<Bucketform> createState() => _BucketformState();
}

class _BucketformState extends State<Bucketform> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _database = FirebaseDatabase.instance.reference();
  late final user;
  String section = "";
  String year = "";
  String branch = "";
  String subject = "";
  String month = "";
  late String userName, email, ui;
  String uid = "";
  String weblink = "";
  String downloadlink = "";

  bool _isDisable = false;
  late drive.DriveApi driveApi;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    userName = user.displayName;
    initialize();
  }

  void initialize() async {
    try {
      final Map<String, String> authHeaders = {};

      SharedPreferences prefs = await SharedPreferences.getInstance();
      authHeaders['Authorization'] = prefs.getString('Authorization')!;
      authHeaders['X-Goog-AuthUser'] = prefs.getString('X-Goog-AuthUser')!;
      final authenticateClient = GoogleAuthClient(authHeaders);
      driveApi = drive.DriveApi(authenticateClient);
    } catch (e) {
      print(e);
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  final List<Map<String, dynamic>> _branch = [
    {
      'value': 'ME',
      'label': 'ME',
    },
    {
      'value': 'CSE',
      'label': 'CSE',
    },
    {
      'value': 'Civil',
      'label': 'Civil',
    },
    {
      'value': 'ECE',
      'label': 'ECE',
    },
    {
      'value': 'EEE',
      'label': 'EEE',
    },
    {
      'value': 'IT',
      'label': 'IT',
    },
    {
      'value': 'BCA',
      'label': 'BCA',
    },
    {
      'value': 'MBA',
      'label': 'MBA',
    },
    {
      'value': 'MCA',
      'label': 'MCA',
    },
    {
      'value': 'PGDM',
      'label': 'PGDM',
    }
  ];
  final List<Map<String, dynamic>> _month = [
    {
      'value': 'JAN',
      'label': 'JAN',
    },
    {
      'value': 'FEB',
      'label': 'FEB',
    },
    {
      'value': 'MAR',
      'label': 'MAR',
    },
    {
      'value': 'APR',
      'label': 'APR',
    },
    {
      'value': 'JUN',
      'label': 'JUN',
    },
    {
      'value': 'JUL',
      'label': 'JUL',
    },
    {
      'value': 'AUG',
      'label': 'AUG',
    },
    {
      'value': 'SEPT',
      'label': 'SEPT',
    },
    {
      'value': 'OCT',
      'label': 'OCT',
    },
    {
      'value': 'NOV',
      'label': 'NOV',
    },
    {
      'value': 'DEC',
      'label': 'DEC',
    }
  ];
  final List<Map<String, dynamic>> _year = [
    {
      'value': '1',
      'label': '1',
    },
    {
      'value': '2',
      'label': '2',
    },
    {
      'value': '3',
      'label': '3',
    },
    {
      'value': '4',
      'label': '4',
    },
  ];
  Future<void> updatedata(String Filename) async {
    try {
      setState(() {
        _isDisable = true;
      });
      await createExcel(Filename);
      final nextEvent = <String, dynamic>{
        'subject': subject,
        'year': year,
        'branch': branch,
        'section': section,
        'month': month,
        'Sheet_uid': uid,
        'weblink': weblink,
        'downloadlink': downloadlink,
        'fileName' : Filename
      };
      print(user.uid);
      await _database
          .child("/faculty/${user.uid}/attendence_bucket")
          .push()
          .update(nextEvent);
      Fluttertoast.showToast(msg: "Bucket created");
      Navigator.of(context).pop();
    } catch (error) {
      setState(() {
        _isDisable = false;
      });
      Fluttertoast.showToast(msg: error.toString());
    }
  }

  Future<void> createExcel(String FileName) async {
    List<String> list = [];
    var driveFile = new drive.File();
    driveFile.name = "$FileName.xlsx";

    final String path = (await getApplicationSupportDirectory()).path;
    final String fileName = path + '/$FileName.xlsx';
    File file = new File(fileName);
    var excel = Excel.createExcel();
    File(Path.join(file.path))
      ..createSync(recursive: true)
      ..writeAsBytesSync(excel.encode()!);

    final response = await driveApi.files.create(driveFile,
        uploadMedia: drive.Media(file.openRead(), file.lengthSync()));

    if (response.id != null) {
      list.add(response.id!);
      await driveApi.permissions.create(
          drive.Permission(role: 'reader', type: 'anyone'), response.id!);
      drive.File res = (await driveApi.files.get(response.id!,
          $fields: 'webViewLink,webContentLink')) as drive.File;
      list.add(res.webViewLink!);
      list.add(res.webContentLink!);
    }
    file.deleteSync(recursive: true);
    uid = list[0];
    weblink = list[1];
    downloadlink = list[2];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Material(
        color: Colors.white,
        child: SafeArea(
            child: Column(
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
                      "New sheet",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //<-------------------------- Animation STARTS-------------------------->

                    Lottie.asset("assets/images/evenformpage.json",
                        height: 200),

                    //<-------------------------- Animation ENDS-------------------------->

                    Container(
                      padding: EdgeInsets.all(8),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                child: Center(
                                  child: Text('Bucket Form',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                      )),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                cursorColor: primaryColor,
                                decoration: InputDecoration(
                                  fillColor: secondaryPurple,
                                  filled: true,
                                  hintText: "Subject Name",
                                  border: InputBorder.none,
                                ),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(30)
                                ],
                                onChanged: (value) => setState(() {
                                  subject = value;
                                }),
                                validator: RequiredValidator(
                                    errorText: "Required Field"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: SelectFormField(
                                cursorColor: primaryColor,

                                type: SelectFormFieldType.dropdown,
                                // or can be dialog
                                initialValue: 'Not Selected',
                                icon: Icon(
                                  Icons.format_shapes,
                                  color: primaryColor,
                                ),
                                labelText: 'Year',
                                style: TextStyle(color: primaryColor),
                                items: _year,
                                onChanged: (val) => year = val,
                                onSaved: (val) => year = val!,
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: SelectFormField(
                                cursorColor: primaryColor,

                                type: SelectFormFieldType.dropdown,
                                // or can be dialog
                                initialValue: 'Not Selected',
                                icon: Icon(
                                  Icons.format_shapes,
                                  color: primaryColor,
                                ),
                                labelText: 'Branch',
                                style: TextStyle(color: primaryColor),
                                items: _branch,
                                onChanged: (val) => branch = val,
                                onSaved: (val) => branch = val!,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: SelectFormField(
                                cursorColor: primaryColor,

                                type: SelectFormFieldType.dropdown,
                                // or can be dialog
                                initialValue: 'Not Selected',
                                icon: Icon(
                                  Icons.format_shapes,
                                  color: primaryColor,
                                ),
                                labelText: 'Month',
                                style: TextStyle(color: primaryColor),
                                items: _month,
                                onChanged: (val) => month = val,
                                onSaved: (val) => month = val!,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                cursorColor: primaryColor,
                                decoration: InputDecoration(
                                  fillColor: secondaryPurple,
                                  filled: true,
                                  hintText: "A/B/C/D....(Section)",
                                  border: InputBorder.none,
                                ),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(30)
                                ],
                                onChanged: (value) => setState(() {
                                  section = value;
                                }),
                                validator: RequiredValidator(
                                    errorText: "Required Field"),
                              ),
                            ),

                            SizedBox(
                              height: 10,
                            ),

                            //<-----------------------------------------button for uploading poster ended ---------------------->
                            SizedBox(
                              height: 15,
                            ),
                            UploadButton(
                                imgtext: _isDisable ? "Hold on.." : "Create",
                                colorButton: primaryColor,
                                colorText: Colors.white,
                                ontap: _isDisable ? null : () {


                                    String fileName = subject + " "+year+" "+branch+" "+section+" "+month;
                                    updatedata(fileName);

                                }),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 150.0,
                    ),
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
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
