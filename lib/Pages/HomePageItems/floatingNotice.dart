// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace, prefer_const_constructors, duplicate_ignore, file_names, avoid_print

import 'package:appnewui/constrants.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FloatingNotice extends StatefulWidget {
  @override
  State<FloatingNotice> createState() => _FloatingNoticeState();
}

class _FloatingNoticeState extends State<FloatingNotice> {
  ScrollController _scrollController = ScrollController();

  _scrollToBottom() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: Duration(minutes: 2), curve: Curves.linear);
  }
  //elasticOut

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) => _scrollToBottom());
    Size size = MediaQuery.of(context).size;

    final List networkPic = [
      "https://www.glbitm.org/Uploads/banner/61hbanner_fresher-2k21-glb.jpg",
      "https://www.glbitm.org/Uploads/banner/49hbanner_atv-champianship-2021.jpg",

      // labs
      "https://www.glbitm.org/images/computer-center-img3.jpg",
      "https://www.glbitm.org/images/computer-center-img4.jpg",
      "https://www.glbitm.org/Uploads/image/222imguf_glbajaj_computercenter2.jpg",
      //halls

      'https://www.glbitm.org/Uploads/image/1169imguf_glbajaj-shdhall1.jpg',
      'https://www.glbitm.org/Uploads/image/1170imguf_glbajaj-shdhall2.jpg',
      'https://www.glbitm.org/Uploads/image/studentconferenceroom-jan20.jpg',
      'https://www.glbitm.org/Uploads/image/987imguf_glbajaj-ampitheter.jpg',
      'https://www.glbitm.org/Uploads/image/215imguf_infra-audi-conf5.jpg',
      'https://www.glbitm.org/Uploads/image/236imguf_infra-audi-conf-img6sm.jpg',
      'https://www.glbitm.org/images/auditorium2.jpg',
//random
      "https://www.glbitm.org/images/campus-shop.jpg",
      "https://www.glbitm.org/Uploads/image/203imguf_infra-cafeteria6.jpg",
      'https://www.glbitm.org/Uploads/image/887imguf_elearning.jpg',
      'https://www.glbitm.org/images/gym-and-sports-img1.jpg',
      'https://www.glbitm.org/Uploads/image/210imguf_gym-and-sports-img6.jpg',
      "https://www.glbitm.org/Uploads/image/236imguf_infra-audi-conf-img6sm.jpg",
      'https://www.glbitm.org/images/auditorium2.jpg',
      'https://www.glbitm.org/Uploads/Image/211imguf_infra-audi-conf1.jpg',
      'https://www.glbitm.org/Uploads/Image/205imguf_infra-classroom2.jpg',
      'https://www.glbitm.org/Uploads/Image/853imguf_lab-me-advance2.jpg',
      'https://www.glbitm.org/Uploads/Image/853imguf_lab-me-advance2.jpg',
      'https://www.glbitm.org/Uploads/Image/265imguf__MG_7270.jpg',
      'https://www.glbitm.org/Uploads/image/323imguf_glbajaj-centrallibrary.jpg',

      'https://www.glbitm.org/Uploads/image/887imguf_elearning.jpg',
      'https://www.glbitm.org/images/gym-and-sports-img1.jpg',
      'https://www.glbitm.org/Uploads/image/210imguf_gym-and-sports-img6.jpg',
      "https://www.glbitm.org/Uploads/image/203imguf_infra-cafeteria6.jpg",
      "https://www.glbitm.org/images/campus-shop.jpg",
    ];
    return Material(
      color: Colors.white,
      child: Container(
        // color: Colors.black,
        height: size.height * .22,
        child: Center(
          child: ListView.separated(
            // ignore: prefer_const_constructors
              padding: EdgeInsets.only(left: 30, top: 10, bottom: 10),
              scrollDirection: Axis.horizontal,
              controller: _scrollController,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  borderRadius: BorderRadius.circular(34),
                  onTap: () {
                    // print(index); //here we will be adding on tap option
                  },
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        width: size.width * .7,
                        imageUrl: networkPic[index],
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, _) => SizedBox(
                width: 15,
              ),
              itemCount: networkPic.length),
        ),
      ),
    );
  }
}
