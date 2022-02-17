// ignore: file_names
import 'dart:convert';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:appnewui/constrants.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'form_controller.dart';
import 'form.dart';

class Feedback_gen extends StatefulWidget {
  const Feedback_gen({Key? key}) : super(key: key);

  @override
  _Feedback_genState createState() => _Feedback_genState();
}

class _Feedback_genState extends State<Feedback_gen> {
  late String description;
  final user = FirebaseAuth.instance.currentUser;
  late String title;
  late bool _isButtonDisabled;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController topicController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isButtonDisabled = false;

  }
  void _submitForm() {

    print("aagya ");
    // Validate returns true if the form is valid, or false
    print(topicController.text);
    // otherwise.
    FeedbackForm feedbackForm = FeedbackForm(
        user!.displayName.toString(),
        user!.email.toString(),


        topicController.text,
        descriptionController.text);

    FormController formController = FormController();

    Fluttertoast.showToast(msg: "Submitting feedback");

    // Submit 'feedbackForm' and save it in Google Sheets.
    formController.submitForm(feedbackForm, (String response) {
      print("Response: $response");
      if (response == FormController.STATUS_SUCCESS) {
        print("successful");
        // Feedback is saved succesfully in Google Sheets.
        Fluttertoast.showToast(msg: "Submitted succesfully");
      } else {
        // Error Occurred while saving data in Google Sheets.
        Fluttertoast.showToast(msg: "Error Occured");
        print("not success");

      }
    });
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
                              padding: const EdgeInsets.fromLTRB(15,10,10,8),
                              child: TextFormField(
                                controller: topicController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter Valid Name';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  fillColor: secondaryPurple,
                                  filled: true,
                                  hintText: "topic",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(15,10,10,8),
                              child: TextFormField(
                                maxLines: 6,
                                controller: descriptionController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter Valid Description';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  fillColor: secondaryPurple,
                                  filled: true,
                                  hintText: "description",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),



                            SizedBox(
                              height: 10,
                            ),
                            UploadButton(
                              ontap: _submitForm,
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
