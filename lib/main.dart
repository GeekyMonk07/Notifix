// @dart=2.9
import 'package:appnewui/Authentication/controller.dart';
import 'package:appnewui/Pages/Attendance/Bucketform.dart';
import 'package:appnewui/Pages/HomePageItems/ItemBox/Gallery/gallery.dart';
import 'package:appnewui/Pages/HomePageItems/ItemBox/feedback_sheet.dart';
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
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Pages/HomePageItems/ItemBox/Clubs/clubs_page.dart';
import 'Pages/HomePageItems/Notifications/notifs.dart';
import 'package:appnewui/Authentication/Auth/firebase.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
SharedPreferences prefs;
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

  if(kIsWeb){
    await Firebase.initializeApp(
        options: FirebaseOptions(
          apiKey: "AIzaSyAkfM67nUtCHRspsyxfTYBEdK0InFeSNp4",
          authDomain: "event-app-37fbd.firebaseapp.com",
          databaseURL: "https://event-app-37fbd-default-rtdb.firebaseio.com",
          projectId: "event-app-37fbd",
          storageBucket: "event-app-37fbd.appspot.com",
          messagingSenderId: "743906650805",
          appId: "1:743906650805:web:0f4ec123cbc97b4ceb6cfc",)// Your projectId
    );
  }else{
    await Firebase.initializeApp();
    prefs = await SharedPreferences.getInstance();
  }
  FirebaseDatabase.instance.setPersistenceEnabled(true);


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
// Shift+Ctrl+Alt+J
// flutter run -d chrome --web-hostname localhost --web-port 5000


class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "GLBITM App",
        initialRoute: "/",
        routes: {
          "/": (context) => Controller(prefs: prefs,),
          "/index": (context) => IndexPage(),
          "/notifs": (context) => Notifs(),
          "/clubs": (context) => ClubsPage(),
          "/library": (context) => CentralLibrary(),
          "/timetable": (context) => TimeTables(),
          "/notes": (context) => MainPage(),
          "/labspage": (context) => pdf_view(),
          "/labs": (context) => Labs(),
          "/cafeteria": (context) => Cafeteria(),
          "/gallery": (context) => PhotoGallery(),
          "/appfeedback": (context) => AppFeedback(),
          "/about": (context) => AboutUs(),
          "/permission": (context) => Verify(),
          "/organise": (context) => EventForm(),
          "/events": (context) => Events(),
          "/updateTimeTable": (context) => UploadTimetable(),
          "/updateNotice": (context) => UploadNotice(),
          "/feedback_sheet": (context) => Feedback_gen(),
          "/bucketform" :(context) => Bucketform(),
          "/feedback_sheetgit":(context)=> Feedback_gen(),

        },
      ));
}
