import 'package:appnewui/Pages/settingsPageItems/shareIcon.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../constrants.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      child: SafeArea(
          child: Column(
        children: [
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
                    "About Us",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              height: 60,
              width: size.width,
              decoration: BoxDecoration(
                  color: Color(0xffF1E6FF),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(22),
                      bottomRight: Radius.circular(22))),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: <Widget>[
                Container(
                    child: Column(
                  children: [
                    ClipOval(
                      child: Image.asset('assets/images/pfp.png',
                          fit: BoxFit.cover, width: 135, height: 135),
                    ),
                    Text('Saumya Srivastava',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        )),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 35, right: 35, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ShareIcon(
                            imageUrl:
                                "https://img.icons8.com/android/144/000000/linkedin.png",
                            url: "",
                          ),
                          ShareIcon(
                            imageUrl:
                                "https://img.icons8.com/metro/104/000000/instagram-new.png",
                            url: "",
                          ),
                          ShareIcon(
                            imageUrl:
                                "https://img.icons8.com/ios-filled/104/000000/github.png",
                            url: "",
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
                Container(
                    child: Column(
                  children: [
                    ClipOval(
                      child: Image.asset('assets/images/pfp.png',
                          fit: BoxFit.cover, width: 135, height: 135),
                    ),
                    Text('Anmol Gangwar',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        )),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 35, right: 35, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ShareIcon(
                            imageUrl:
                                "https://img.icons8.com/android/144/000000/linkedin.png",
                            url: "",
                          ),
                          ShareIcon(
                            imageUrl:
                                "https://img.icons8.com/metro/104/000000/instagram-new.png",
                            url: "",
                          ),
                          ShareIcon(
                            imageUrl:
                                "https://img.icons8.com/ios-filled/104/000000/github.png",
                            url: "",
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
                Container(
                    child: Column(
                  children: [
                    ClipOval(
                      child: Image.asset('assets/images/pfp.png',
                          fit: BoxFit.cover, width: 135, height: 135),
                    ),
                    Text('Tanay Gupta',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        )),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 35, right: 35, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ShareIcon(
                            imageUrl:
                                "https://img.icons8.com/android/144/000000/linkedin.png",
                            url: "https://www.linkedin.com/in/tanay--gupta/",
                          ),
                          ShareIcon(
                            imageUrl:
                                "https://img.icons8.com/metro/104/000000/instagram-new.png",
                            url: "https://www.instagram.com/tanaywhocodes/",
                          ),
                          ShareIcon(
                            imageUrl:
                                "https://img.icons8.com/ios-filled/104/000000/github.png",
                            url: "https://github.com/Tanay-Gupta",
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
                Container(
                    child: Column(
                  children: [
                    ClipOval(
                      child: Image.asset('assets/images/pfp.png',
                          fit: BoxFit.cover, width: 135, height: 135),
                    ),
                    Text('Abhinav Sahai',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        )),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 35, right: 35, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ShareIcon(
                            imageUrl:
                                "https://img.icons8.com/android/144/000000/linkedin.png",
                            url: "",
                          ),
                          ShareIcon(
                            imageUrl:
                                "https://img.icons8.com/metro/104/000000/instagram-new.png",
                            url: "",
                          ),
                          ShareIcon(
                            imageUrl:
                                "https://img.icons8.com/ios-filled/104/000000/github.png",
                            url: "",
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
                Container(
                    child: Column(
                  children: [
                    ClipOval(
                      child: Image.asset('assets/images/pfp.png',
                          fit: BoxFit.cover, width: 135, height: 135),
                    ),
                    Text('Madhav',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        )),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 35, right: 35, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ShareIcon(
                            imageUrl:
                                "https://img.icons8.com/android/144/000000/linkedin.png",
                            url: "",
                          ),
                          ShareIcon(
                            imageUrl:
                                "https://img.icons8.com/metro/104/000000/instagram-new.png",
                            url: "",
                          ),
                          ShareIcon(
                            imageUrl:
                                "https://img.icons8.com/ios-filled/104/000000/github.png",
                            url: "",
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),

//app bar code ended
        ],
      )),
    );
  }
}
