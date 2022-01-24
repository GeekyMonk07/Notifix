// @dart=2.9
import 'package:appnewui/Authentication/adminlogin/adminlogin.dart';
import 'package:appnewui/Authentication/welcomePage/Controller.dart';
import 'package:appnewui/Authentication/welcomePage/welcome.dart';
import 'package:appnewui/Pages/HomePageItems/ItemBox/Gallery/gallery.dart';
import 'package:appnewui/Pages/HomePageItems/ItemBox/fetching_timetable.dart';
import 'package:appnewui/Pages/HomePageItems/UPLOAD%20BUTTON%20DATA/EventsPageItems/showNotice.dart';
import 'package:appnewui/Pages/HomePageItems/ItemBox/showTimeTable.dart';
import 'package:appnewui/Pages/HomePageItems/ItemBox/cafeteria.dart';
import 'package:appnewui/Pages/HomePageItems/ItemBox/events.dart';
import 'package:appnewui/Pages/HomePageItems/ItemBox/feedback.dart';
import 'package:appnewui/Pages/HomePageItems/ItemBox/labs.dart';
import 'package:appnewui/Pages/HomePageItems/ItemBox/library.dart';
import 'package:appnewui/Pages/HomePageItems/ItemBox/notes.dart';
import 'package:appnewui/Pages/HomePageItems/UPLOAD%20BUTTON%20DATA/EventsPageItems/UploadTimeTable.dart';
import 'package:appnewui/Pages/HomePageItems/UPLOAD%20BUTTON%20DATA/EventsPageItems/uploadNotice.dart';
import 'package:appnewui/Pages/Permission/permission.dart';
import 'package:appnewui/Pages/settingsPageItems/about.dart';
import 'package:appnewui/Pages/settingsPageItems/eventform.dart';
import 'package:appnewui/indexPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'Pages/HomePageItems/ItemBox/Clubs/clubs_page.dart';
import 'Pages/HomePageItems/Notifications/notifs.dart';
import 'package:appnewui/Authentication/Auth/firebase.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title// description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  runApp(MyApp());
}
// flutter build apk --build-name=1.0.1 --build-number=1

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "GLBITM App",
        initialRoute: "/",
        routes: {
          "/": (context) => WelcomePage(),
          "/index": (context) => IndexPage(),
          "/login": (context) => AdminLogin(),
          "/notifs": (context) => Notifs(),
          "/clubs": (context) => ClubsPage(),
          "/library": (context) => CentralLibrary(),
          "/timetable": (context) => TimeTables(),
          "/notes": (context) => MainPage(),
          "/labs": (context) => pdf_view(),
          "/cafeteria": (context) => Cafeteria(),
          "/gallery": (context) => PhotoGallery(),
          "/appfeedback": (context) => AppFeedback(),
          "/about": (context) => AboutUs(),
          "/permission": (context) => Verify(),
          "/organise": (context) => EventForm(),
          "/events": (context) => Events(),
          "/updateTimeTable": (context) => UploadTimetable(),
          "/updateNotice": (context) => UploadNotice(),
        },
      ));
}
