import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Cafeteria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final List pics = [
      "https://www.glbitm.org/Uploads/image/288imguf_mess1.jpg",
      "https://www.glbitm.org/Uploads/image/203imguf_infra-cafeteria6.jpg",
      "https://www.glbitm.org/Uploads/image/201imguf_infra-cafeteria4.jpg",
      "https://www.glbitm.org/Uploads/image/291imguf_mess6.jpg",
    ];

    return SafeArea(
      child: Scaffold(
        body: Column(
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
                      "Cafeteria",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
            SizedBox(height: size.height * 0.01),
            Container(
              height: 250,
              padding: const EdgeInsets.only(left: 10.0),
              child: ListView.builder(
                  itemCount: pics.length,
                  //planetInfo.images.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.network(
                            pics[index],
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) =>
                                loadingProgress == null
                                    ? child
                                    : Center(
                                        child: CircularProgressIndicator(
                                        color: Color(0xff6F35A5),
                                      )),
                          )),
                    );
                  }),
            ),
            SizedBox(height: size.height * 0.02),
            Expanded(
                child: Material(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                    elevation: 12,
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      //color: Colors.white,
                      decoration: BoxDecoration(
                        color: Color(0xffF1E6FF),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SingleChildScrollView(
                            child: Container(
                          child: Column(
                            children: [
                              SizedBox(height: size.height * 0.02),
                              Text(
                                "The institute has its own food courts, which have emerged as the students favorite haunts. The food courts serve quick tangy bites to healthy and nutritious food.",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        )),
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}
