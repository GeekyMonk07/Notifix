import 'package:appnewui/Authentication/adminlogin/adminlogin.dart';
import 'package:appnewui/Authentication/welcomePage/welcome.dart';
import 'package:appnewui/Pages/HomePageItems/ItemBox/Contacts/contacts.dart';
import 'package:appnewui/Pages/HomePageItems/ItemBox/Gallery/gallery.dart';
import 'package:appnewui/Pages/HomePageItems/ItemBox/cafeteria.dart';
import 'package:appnewui/Pages/HomePageItems/ItemBox/events.dart';
import 'package:appnewui/Pages/HomePageItems/ItemBox/feedback.dart';
import 'package:appnewui/Pages/HomePageItems/ItemBox/labs.dart';
import 'package:appnewui/Pages/HomePageItems/ItemBox/library.dart';
import 'package:appnewui/Pages/HomePageItems/ItemBox/notes.dart';
import 'package:appnewui/Pages/HomePageItems/ItemBox/timetable.dart';
import 'package:appnewui/Pages/Permission/permission.dart';
import 'package:appnewui/Pages/settingsPageItems/about.dart';
import 'package:appnewui/Pages/settingsPageItems/eventform.dart';
import 'package:appnewui/indexPage.dart';
import 'package:flutter/material.dart';
import 'Pages/HomePageItems/ItemBox/Clubs/clubs_page.dart';
import 'Pages/HomePageItems/Notifications/notifs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: WelcomePage(),
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          "/index": (context) => IndexPage(),
          "/login": (context) => AdminLogin(),
          "/notifs": (context) => Notifs(),
          "/clubs": (context) => ClubsPage(),
          "/library": (context) => CentralLibrary(),
          "/timetable": (context) => TimeTable(),
          "/notes": (context) => Notes(),
          "/labs": (context) => Labs(),
          "/cafeteria": (context) => Cafeteria(),
          "/gallery": (context) => PhotoGallery(),
          "/appfeedback": (context) => AppFeedback(),
          "/about": (context) => AboutUs(),
          "/permission": (context) => PermissionPage(),
          "/organise": (context) => EventForm(),
          "/events": (context) => Events(),
          //"/contacts": (context) => Contacts(),
        });
  }
}
