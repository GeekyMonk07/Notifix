import 'dart:io';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:form_field_validator/form_field_validator.dart';

import 'package:firebase_database/firebase_database.dart';

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
      'timestamp':ServerValue.timestamp,
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryPurple,
        toolbarHeight: 70,
        title: Text(
          "Organize your event!",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50.0,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          child: Center(
                            child: Text('Event Form',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                )),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
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
                          validator:
                              RequiredValidator(errorText: "Required Field"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          onChanged: (value) => setState(() {
                            uniqueId = value;
                          }),
                          validator:
                              RequiredValidator(errorText: "Required Field"),
                          decoration: InputDecoration(
                            filled: true,
                            hintText: "Unique ID / Adm ID",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: MultiValidator([
                            RequiredValidator(errorText: "Required"),
                          ]),
                          onChanged: (value) => setState(() {
                            topic = value;
                          }),
                          decoration: InputDecoration(
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
                          type: SelectFormFieldType.dropdown,
                          // or can be dialog
                          initialValue: 'Not Selected',
                          icon: Icon(Icons.format_shapes),
                          labelText: 'Venue',
                          items: _items,
                          onChanged: (val) => venue = val,
                          onSaved: (val) => venue = val!,
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Expanded(
                            child: Row(
                              children: [
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
                                          fontSize: 17, color: Colors.grey),
                                    ),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () async {
                                      _selectDate(context);
                                    },
                                    icon: Icon(Icons.calendar_today))
                              ],
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SelectFormField(
                            type: SelectFormFieldType.dropdown,
                            initialValue: 'C',
                            icon: Icon(Icons.format_shapes),
                            labelText: 'Select Slot',
                            items: _time,
                            onChanged: (val) {
                              setState(() {
                                selected_slot = val;
                              });
                            }
                            ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator:
                              RequiredValidator(errorText: "Required Field"),
                          onChanged: (value) => setState(() {
                            tenure = value;
                          }),
                          decoration: InputDecoration(
                            filled: true,
                            hintText: "Tenure in hrs",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator:
                              RequiredValidator(errorText: "Required Field"),
                          onChanged: (value) => setState(() {
                            description = value;
                          }),
                          maxLines: 6,
                          decoration: InputDecoration(
                            filled: true,
                            hintText: "Description",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Event Poster",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: TextButton.styleFrom(
                              backgroundColor: primaryColor),
                        ),
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: primaryColor),
                          onPressed: _isDisable ?null: () async {
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
                              await snackBarMssgs("Something went wrong!");
                            }
                            setState(() {
                              _isDisable = false;
                            });
                          },
                          child: Text(_isDisable ? "Hold on...":"Confirm",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ))),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 100.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
