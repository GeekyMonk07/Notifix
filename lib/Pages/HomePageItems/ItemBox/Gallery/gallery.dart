import 'package:flutter/material.dart';

import 'gallery_data.dart';

// import 'galleryData.dart';

class PhotoGallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          //elevation: 5.0,
          toolbarHeight: 60,
          title: Text(
            "Photo Gallery",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          flexibleSpace: Container(
              decoration: BoxDecoration(
                  color: Color(0xffF1E6FF),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(22.0),
                      bottomRight: Radius.circular(22.0))))),
      body: Padding(
        padding: const EdgeInsets.only(top: (8.0)),
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(25)),
                padding: EdgeInsets.all(5),
                child: Image.asset(a[index]));
          },
        ),
      ),
    ));
  }
}
