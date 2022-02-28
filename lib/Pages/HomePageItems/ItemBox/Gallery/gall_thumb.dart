import 'dart:ui';

import 'package:flutter/material.dart';

class GallThumb extends StatelessWidget {
  const GallThumb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final List pix = [
      "assets/images/1.jpg",
      "assets/images/3.jpg",
      "assets/images/4.jpg",
      "assets/images/5.jpg",
      "assets/images/5.png",
      "assets/images/2.png",
    ];
    final List names = [
      "CELEBRATION",
      "TECH JAM",
      "AWARDS",
      "ASSEMBLY",
      "FEST",
      "ALUMINI MEET",
    ];

    return SafeArea(
        child: Scaffold(
            body: Column(children: [
      Material(
        elevation: 5,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(22), bottomRight: Radius.circular(22)),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Gallery",
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
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, "/gallerydata"),
            child: GridView.builder(
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 6, mainAxisSpacing: 6),
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Image.asset(pix[index], fit: BoxFit.cover)),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        // Clip it cleanly.
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                          child: Container(
                            color: Colors.grey.withOpacity(0.1),
                            alignment: Alignment.center,
                            child: Text(
                              names[index],
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                 
                }),
          ),
        ),
      ),
    ])));
  }
}
