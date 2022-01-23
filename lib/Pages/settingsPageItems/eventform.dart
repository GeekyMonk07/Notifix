import 'dart:io';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:form_field_validator/form_field_validator.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:lottie/lottie.dart';

import 'package:select_form_field/select_form_field.dart';

import 'package:appnewui/constrants.dart';

class EventForm extends StatefulWidget {
  const EventForm({Key? key}) : super(key: key);

  @override
  State<EventForm> createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _database = FirebaseDatabase.instance.reference();
  late final user;
  String description = "";
  String name = "";
  String userName = "";
  String uniqueId = "";
  String topic = "";
  DateTime time_slot = DateTime.now();
  String time = "";
  String tenure = "";
  String venue = "";
  String email = "";
  String selected_slot = "C";
  String final_selected_time = "";
  String showTime = "";
  DateTime currentDate = DateTime.now();
  bool val = true;
  bool already_slot_exist = false;
  bool push_event = false;
  bool _isDisable = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    setState(() {
      userName = user.displayName;
      email = user.email;
      // userName = 'tanay';
      // email = 'tanaywhocodes@gmail.com';
    });
  }

  final List<Map<String, dynamic>> _time = [
    {
      'value': 'A',
      'label': '09:00 AM - 02:00 PM',
    },
    {
      'value': 'B',
      'label': '03:00 PM - 07:00 PM',
    },
    {
      'value': 'C',
      'label': 'Not Selected',
    }
  ];

  final List<Map<String, dynamic>> _items = [
    {
      'value': 'SBG',
      'label': 'SBG Hall',
    },
    {
      'value': 'Audi 1',
      'label': 'Audi 1',
    },
    {
      'value': 'Audi 2',
      'label': 'Audi 2',
    },
    {
      'value': 'Audi 3',
      'label': 'Audi 3',
    },
    {
      'value': 'Audi 4',
      'label': 'Audi 4',
    },
    {
      'value': 'Not Selected',
      'label': 'Not Selected',
    }
  ];

  Future<void> check_slot(String time) async {
    print(time);
    try {
      await _database
          .child('time_slot_details')
          .once()
          .then((DataSnapshot snapshot) {
        Map<dynamic, dynamic> values = snapshot.value;
        values.forEach((key, values) {
          if (values["date"].toString() == time.toString()) {
            setState(() {
              already_slot_exist = true;
            });
          }
        });
      });
    } catch (e) {
      Fluttertoast.showToast(msg: "Failed to check $e");
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    print("Time selected#############");
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null)
      setState(() {
        time_slot = pickedDate;
        showTime = DateFormat('dd MMMM yyyy').format(time_slot);
      });
  }

  Future<void> _inputUserEventData() async {
    final nextEvent = <String, dynamic>{
      'description': description,
      'userName': userName,
      'verified': 0,
      'declined': 0,
      'name': name,
      'uniqueId': uniqueId,
      'date': final_selected_time,
      'tenure': tenure,
      'topic': topic,
      'venue': venue,
      'emailId': user?.email,
      'registrations': 0,
      'timestamp': ServerValue.timestamp,
    };

    //pushing pending events
    try {
      await _database.child("/pending_events").push().update(nextEvent);
      setState(() {
        push_event = true;
      });
      print("Success");
    } catch (e) {
      print("Failed $e");
    }
  }

  Future<void> snackBarMssgs(String msg) async {
    print(already_slot_exist);
    String message = "";
    if (msg != null) {
      message = msg;
    }
    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: '',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  bool validate_form() {
    if (selected_slot == 'C' ||
        time_slot == null ||
        venue == null ||
        !_formKey.currentState!.validate()) {
      return false;
    } else {
      final DateFormat formatter = DateFormat('dd MMMM yyyy');
      final String date = formatter.format(time_slot);
      setState(() {
        final_selected_time = date + " " + selected_slot;
      });
      print(final_selected_time);
      print(userName);
      print(email);
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
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
                    "Organize Your Event",
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //<-------------------------- Animation STARTS-------------------------->

                  Lottie.asset("assets/images/evenformpage.json", height: 200),

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
                                child: Text('Event Form',
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
                                hintText: "Name of the Event",
                                border: InputBorder.none,
                              ),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(30)
                              ],
                              onChanged: (value) => setState(() {
                                name = value;
                              }),
                              validator: RequiredValidator(
                                  errorText: "Required Field"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              cursorColor: primaryColor,
                              onChanged: (value) => setState(() {
                                uniqueId = value;
                              }),
                              validator: RequiredValidator(
                                  errorText: "Required Field"),
                              decoration: InputDecoration(
                                fillColor: secondaryPurple,
                                filled: true,
                                hintText: "Unique ID / Adm ID",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              cursorColor: primaryColor,
                              validator: MultiValidator([
                                RequiredValidator(errorText: "Required"),
                              ]),
                              onChanged: (value) => setState(() {
                                topic = value;
                              }),
                              decoration: InputDecoration(
                                fillColor: secondaryPurple,
                                filled: true,
                                hintText:
                                    "Name of the event/purpose ( should not use -,.,# etc)",
                                border: InputBorder.none,
                              ),
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
                              labelText: 'Venue',
                              style: TextStyle(color: primaryColor),
                              items: _items,
                              onChanged: (val) => venue = val,
                              onSaved: (val) => venue = val!,
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                      onPressed: () async {
                                        _selectDate(context);
                                      },
                                      icon: Icon(
                                        Icons.calendar_today,
                                        color: primaryColor,
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white10,
                                      ),
                                      child: Text(
                                        (showTime != "")
                                            ? showTime
                                            : "Select Date",
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SelectFormField(
                                type: SelectFormFieldType.dropdown,
                                initialValue: 'C',
                                icon: Icon(
                                  Icons.format_shapes,
                                  color: primaryColor,
                                ),
                                labelText: 'Select Slot',
                                style: TextStyle(color: primaryColor),
                                items: _time,
                                onChanged: (val) {
                                  setState(() {
                                    selected_slot = val;
                                  });
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              cursorColor: primaryColor,
                              validator: RequiredValidator(
                                  errorText: "Required Field"),
                              onChanged: (value) => setState(() {
                                tenure = value;
                              }),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: secondaryPurple,
                                hintText: "Tenure in hrs",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              cursorColor: primaryColor,
                              validator: RequiredValidator(
                                  errorText: "Required Field"),
                              onChanged: (value) => setState(() {
                                description = value;
                              }),
                              maxLines: 6,
                              decoration: InputDecoration(
                                fillColor: secondaryPurple,
                                filled: true,
                                hintText: "Description",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          //<-----------------------------------------button for uploading poster---------------------->
                          UploadButton(
                            imgtext: "UPLOAD EVENT POSTER",
                            colorButton: primaryColor,
                            colorText: Colors.black,
                            ontap: () {},
                          ),

                          //<-----------------------------------------button for uploading poster ended ---------------------->
                          SizedBox(
                            height: 15,
                          ),
                          UploadButton(
                            imgtext: "CONFIRM",
                            colorButton: primaryColor,
                            colorText: Colors.white,
                            ontap: _isDisable
                                ? null
                                : () async {
                                    setState(() {
                                      _isDisable = true;
                                    });
                                    if (validate_form()) {
                                      await check_slot(final_selected_time);
                                      if (already_slot_exist == true) {
                                        await snackBarMssgs(
                                            'Slot Not Available , already Booked! Try out with other slots');
                                      } else {
                                        try {
                                          await _inputUserEventData();
                                          if (push_event) {
                                            await snackBarMssgs(
                                                'Slot booked, Verification pending');
                                          }
                                        } catch (e) {
                                          await snackBarMssgs("$e");
                                        }
                                      }
                                    } else {
                                      await snackBarMssgs(
                                          "Something went wrong!");
                                    }
                                    setState(() {
                                      _isDisable = false;
                                    });
                                  },
                          ),
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
