import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter/material.dart';


import 'dart:async';
import 'package:mailer/mailer.dart';



class Send {


  final String topic;
  final String date;
  final String slot;
  final String description;
  final String body;
  final String email;



  Send({ required this.topic,required this.date, required this.slot,required this.description,required this.body, required this.email});


  final _recipientController = TextEditingController(
    text: 'sahai.abhinav99@gmail.com',
  );

  final _subjectController = TextEditingController(text: 'Ticket Booked! Regarding Your Request for Organising ');


  // final _bodyController = TextEditingController(
  //   text:body ,
  // );
  List<String> attachments = [];
  bool isHTML = false;

  Future<void> send() async {
    final Email email = Email(
      body: body + " " + "description : " + "   " + description+ " "+ "timing :" + date + "    " + " slot :"+ " "+ ((slot[slot.length-1]=='A')?"09:00 AM - 02:00 PM":"03:00 PM - 07:00 PM") + "   " + "topic : "+ " "+ topic,
      subject: _subjectController.text + topic,
      recipients:[this.email],

      attachmentPaths: attachments,
      isHTML: isHTML,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
      print(platformResponse);
    } catch (error) {
      platformResponse = error.toString();
      print(platformResponse);
    }

  }

  Future<void> send_2() async {
    final Email email = Email(
      body: body + " " + "description : " + "   " + description+ " "+ "timing :" + date + "    " + " slot :"+ " "+ ((slot[slot.length-1]=='A')?"09:00 AM - 02:00 PM":"03:00 PM - 07:00 PM") + "   " + "topic : "+ " "+ topic,
      subject: _subjectController.text + topic,
      recipients:[this.email],

      attachmentPaths: attachments,
      isHTML: isHTML,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
      print(platformResponse);
    } catch (error) {
      platformResponse = error.toString();
      print(platformResponse);
    }

  }




}