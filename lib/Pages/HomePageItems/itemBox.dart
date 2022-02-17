import 'package:appnewui/Pages/HomePageItems/itemBoxButton.dart';
import 'package:appnewui/Pages/Search%20widget/page/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemBox extends StatelessWidget {
  const ItemBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Material(
        borderRadius: BorderRadius.circular(25),
        elevation: 5,
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              // color: Color(0xff6F35A5),
              color: Color(0xffF1E6FF),
              borderRadius: BorderRadius.circular(25)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ItemBoxButton(
                    ontap: () => Navigator.pushNamed(context, "/notifs"),
                    imgUrl: "assets/images/itemboxIcons/map.png",
                    imgCaption: "Notice",
                  ),
                  ItemBoxButton(
                    ontap: () => Navigator.pushNamed(context, "/gallery"),
                    imgUrl: "assets/images/itemboxIcons/photo.png",
                    imgCaption: "Photo Gallery",
                  ),
                  ItemBoxButton(
                    ontap: () => Navigator.pushNamed(context, "/labs"),
                    imgUrl: "assets/images/itemboxIcons/note.png",
                    imgCaption: "Labs",
                  ),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                ItemBoxButton(
                  ontap: () => Navigator.pushNamed(context, "/cafeteria"),
                  imgUrl: "assets/images/itemboxIcons/cafe.png",
                  imgCaption: "Cafeteria",
                ),
                ItemBoxButton(
                  ontap: () => Navigator.pushNamed(context, "/library"),
                  imgUrl: "assets/images/itemboxIcons/lib.png",
                  imgCaption: "Library",
                ),
                ItemBoxButton(
                  ontap: () => Navigator.pushNamed(context, "/notifs"),
                  imgUrl: "assets/images/itemboxIcons/calender.png",
                  imgCaption: "Events",
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                ItemBoxButton(
                  ontap: () => Navigator.pushNamed(context, "/feedback_sheetgit"),

                  imgUrl: "assets/images/itemboxIcons/feedback.png",
                  imgCaption: "Feedback",
                ),
                ItemBoxButton(
                  ontap: () => Navigator.pushNamed(context, "/clubs"),
                  imgUrl: "assets/images/itemboxIcons/club.png",
                  imgCaption: "Clubs",
                ),
                ItemBoxButton(
                  ontap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=>SearchBar())),
                  imgUrl: "assets/images/itemboxIcons/contact.png",
                  imgCaption: "SearchBar",
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
