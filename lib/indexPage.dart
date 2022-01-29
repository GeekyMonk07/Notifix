// ignore_for_file: prefer_const_constructors, file_names

import 'package:appnewui/Pages/eventpage.dart';
import 'package:appnewui/Pages/homepage.dart';
import 'package:appnewui/Pages/profilenew.dart';
import 'package:appnewui/Pages/settingspage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

import 'Authentication/Auth/firebase.dart';
import 'main.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  int selectedIndex = 0;
  List Pages = [HomePage(), ProfilePage(), EventPage(), SettingsPage()];
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: Scaffold(
        body: Pages[selectedIndex],
        bottomNavigationBar: BottomNavyBar(
          backgroundColor: Color(0xffF1E6FF),
          items: [
            BottomNavyBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
                activeColor: Color(0xff6F35A5),
                inactiveColor: Colors.black),
            BottomNavyBarItem(
                icon: Icon(Icons.person),
                title: Text('Profile'),
                activeColor: Color(0xff6F35A5),
                inactiveColor: Colors.black),
            BottomNavyBarItem(
                icon: const Icon(Icons.event),
                title: Text('Events'),
                activeColor: Color(0xff6F35A5),
                inactiveColor: Colors.black),
            BottomNavyBarItem(
                icon: Icon(Icons.settings),
                title: Text('Settings'),
                activeColor: Color(0xff6F35A5),
                inactiveColor: Colors.black),
          ],
          selectedIndex: selectedIndex,
          onItemSelected: (index) => setState(() {
            selectedIndex = index;
          }),
          showElevation: false,
        ),
      ));

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,

                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title.toString()),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body.toString())],
                  ),
                ),
              );
            });
      }
    });
  }
}
