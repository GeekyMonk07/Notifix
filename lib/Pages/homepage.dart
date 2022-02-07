import 'package:appnewui/Pages/HomePageItems/appbar.dart';
import 'package:appnewui/Pages/HomePageItems/floatingNotice.dart';
import 'package:appnewui/Pages/HomePageItems/itemBox.dart';
import 'package:appnewui/Pages/HomePageItems/timetableBox.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:showcaseview/showcaseview.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final key1 = GlobalKey();
  final key2 = GlobalKey();
  final key3 = GlobalKey();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback(
        (_) => ShowCaseWidget.of(context)!.startShowCase([key1, key2, key3]));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            TopBar(),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                child: Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Showcase(
                        key: key2,
                        description: "College Pictures",
                        child: FloatingNotice()),
                    // const SizedBox(
                    //   height: 2,
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Showcase(
                          key: key3,
                          description: "Time Table",
                          child: TimeTableBox()),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Lottie.asset(
                            "assets/images/48581-asteroid-exploration.json",
                            height: 150),
                        const Text(
                          "Explore          Nearby",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Showcase(
                        key: key1,
                        description: "College facilities",
                        child: const ItemBox())
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
