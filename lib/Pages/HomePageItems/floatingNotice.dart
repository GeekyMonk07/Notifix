// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace, prefer_const_constructors, duplicate_ignore, file_names, avoid_print

import 'package:appnewui/constrants.dart';
import 'package:flutter/material.dart';

class FloatingNotice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final List<int> colors = <int>[900, 800, 700, 600, 500, 400, 300, 200, 100];

    final List<String> picurl = <String>[
      "assets/images/img1.jpg",
      "assets/images/img2.jpg"
    ];
    return Container(
      height: size.height * .21,
      child: ListView.separated(
          // ignore: prefer_const_constructors
          padding: EdgeInsets.only(left: 30, top: 15),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                print(index); //here we will be adding on tap option
              },
              child: (Container(
                width: size.width * .7,
                child: Padding(
                  padding: const EdgeInsets.all(60),
                  child: Text(
                    "Notice " + (index + 1).toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(picurl[(index % 2 == 0) ? 0 : 1]),
                        fit: BoxFit.fill),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: secondaryYellow,
                    //   ),
                    // ],
                    //color: Colors.blue[colors[index]],
                    borderRadius: BorderRadius.circular(34)),
              )),
            );
          },
          separatorBuilder: (context, _) => SizedBox(
                width: 15,
              ),
          itemCount: colors.length),
    );
  }
}
