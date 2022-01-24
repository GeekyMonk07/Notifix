import 'package:appnewui/Pages/settingsPageItems/shareIcon.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../constrants.dart';

class AboutUs extends StatefulWidget {
  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  // <-----------------------------------------------Team List-------------------------------------------->
  var list = [
    Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ClipOval(
          child: Image.network(
            'https://media-exp1.licdn.com/dms/image/C5603AQEuJ6ArNquxXQ/profile-displayphoto-shrink_200_200/0/1642517894474?e=1648684800&v=beta&t=-sMPPNG1FxrxUgB9w_5lYOQQOcJAhYTSpl7_kiH_pEQ',
            fit: BoxFit.cover,
            width: 100,
            height: 100,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text('Tanay Gupta',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17.5,
              fontWeight: FontWeight.bold,
            )),
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
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
                url: "https://www.instagram.com/tanaywhocodes",
              ),
              ShareIcon(
                imageUrl:
                    "https://img.icons8.com/ios-filled/104/000000/github.png",
                url: "https://github.com/Tanay-Gupta",
              ),
            ],
          ),
        ),
      ]),
    ),
    Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ClipOval(
          child: Image.asset(
            'assets/images/pfp.png',
            fit: BoxFit.cover,
            width: 100,
            height: 100,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text('Saumya Srivastava',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17.5,
              fontWeight: FontWeight.bold,
            )),
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ShareIcon(
                imageUrl:
                    "https://img.icons8.com/android/144/000000/linkedin.png",
                url: "https://www.linkedin.com/in/saumyasrv10/",
              ),
              ShareIcon(
                imageUrl:
                    "https://img.icons8.com/metro/104/000000/instagram-new.png",
                url: "https://www.instagram.com/saumyaa.10/",
              ),
              ShareIcon(
                imageUrl:
                    "https://img.icons8.com/ios-filled/104/000000/github.png",
                url: "https://github.com/saumyasrv",
              ),
            ],
          ),
        ),
      ]),
    ),
    Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ClipOval(
          child: Image.asset(
            'assets/images/pfp.png',
            fit: BoxFit.cover,
            width: 100,
            height: 100,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text('Anmol Gangwar',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17.5,
              fontWeight: FontWeight.bold,
            )),
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ShareIcon(
                imageUrl:
                    "https://img.icons8.com/android/144/000000/linkedin.png",
                url: "https://www.linkedin.com/in/thelearninggeek",
              ),
              ShareIcon(
                imageUrl:
                    "https://img.icons8.com/metro/104/000000/instagram-new.png",
                url: "https://www.instagram.com/_a.n.m.pvtt_",
              ),
              ShareIcon(
                imageUrl:
                    "https://img.icons8.com/ios-filled/104/000000/github.png",
                url: "https://github.com/GeekyMonk07",
              ),
            ],
          ),
        ),
      ]),
    ),
    Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ClipOval(
          child: Image.network(
            'https://media-exp1.licdn.com/dms/image/C4E03AQHh--sPfcuB5g/profile-displayphoto-shrink_800_800/0/1599821473332?e=1648684800&v=beta&t=D03ZQpfcCyJNMfucz-9sEdeNLZnhDSC5Ux7l7_WF7oo',
            fit: BoxFit.cover,
            width: 100,
            height: 100,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text('Abhinav Sahai',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17.5,
              fontWeight: FontWeight.bold,
            )),
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ShareIcon(
                imageUrl:
                    "https://img.icons8.com/android/144/000000/linkedin.png",
                url: "https://www.linkedin.com/in/abhinav-sahai-b836b81b5/",
              ),
              ShareIcon(
                imageUrl:
                    "https://img.icons8.com/metro/104/000000/instagram-new.png",
                url: "https://www.instagram.com/abhi_149209/",
              ),
              ShareIcon(
                imageUrl:
                    "https://img.icons8.com/ios-filled/104/000000/github.png",
                url: "https://github.com/Abhi149209",
              ),
            ],
          ),
        ),
      ]),
    ),
    Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ClipOval(
          child: Image.asset(
            'assets/images/madhav_image.png',
            fit: BoxFit.cover,
            width: 100,
            height: 100,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text('Madhav Mishra',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17.5,
              fontWeight: FontWeight.bold,
            )),
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ShareIcon(
                imageUrl:
                    "https://img.icons8.com/android/144/000000/linkedin.png",
                url: "https://www.linkedin.com/in/madhav-mishra-478606160",
              ),
              ShareIcon(
                imageUrl:
                    "https://img.icons8.com/metro/104/000000/instagram-new.png",
                url: "https://instagram.com/highoncarb",
              ),
              ShareIcon(
                imageUrl:
                    "https://img.icons8.com/ios-filled/104/000000/github.png",
                url: "https://github.com/carbseater",
              ),
            ],
          ),
        ),
      ]),
    ),
  ];

  @override
  void initState() {
    setState(() {
      list.shuffle();
    });
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
                    "Our Team",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              height: size.height * .075,
              width: size.width,
              decoration: BoxDecoration(
                  color: Color(0xffF1E6FF),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(22),
                      bottomRight: Radius.circular(22))),
            ),
          ),
          // <-----------------------------------------------Top Bar-------------------------------------------->
          SizedBox(
            height: size.height * .02,
          ),
          Text("Meet the creative crew behind this App.",
              style: TextStyle(
                color: Color(0xff6F35A5),
                fontSize: size.width * .047,
                fontWeight: FontWeight.w500,
              )),

          Expanded(
            child: GridView.count(
              // mainAxisSpacing: 20,
              crossAxisSpacing: 5,
              padding: EdgeInsets.only(bottom: 30),
              scrollDirection: Axis.vertical,
              childAspectRatio: 1,
              shrinkWrap: true,

              mainAxisSpacing: 5,
              crossAxisCount: 2,
              children: list,
            ),
          ),
        ],
      )),
    );
  }
}
