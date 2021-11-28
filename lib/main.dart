// @dart=2.9
import 'package:appnewui/Authentication/adminlogin/adminlogin.dart';
import 'package:appnewui/Authentication/welcomePage/Controller.dart';
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
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'Pages/HomePageItems/ItemBox/Clubs/clubs_page.dart';
import 'Pages/HomePageItems/Notifications/notifs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:appnewui/Authentication/Auth/firebase.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
@override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "GLBITM App",
        initialRoute: "/",
        // home: Controller(),
        routes: {
          "/": (context) => Controller(),
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
        },
      ));
}
