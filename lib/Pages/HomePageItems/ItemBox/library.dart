import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CentralLibrary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final List pics = [
      "https://www.glbitm.org/images/our-library-img1.jpg",
      "https://www.glbitm.org/images/our-library-img4.jpg",
      "https://www.glbitm.org/library/img/library-home1.jpg",
      "https://www.glbitm.org/library/img/bookstock/2020/DataStructure%20AlgorithmsMadeEasy-2020.jpg",
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
                      "Central Library",
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
                                "The Central Library of G L Bajaj is user-focused, innovative, and excellence driven. The library has always benefited from the institute’s culture, is pioneer in adopting new technology and is far ahead than many libraries in the region. Central Library provides fully air-conditioned & WiFi enabled world-class learning environment. The Library has well-developed book stack, reference section and digital library which makes studying a unique and a lifetime experience.",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                              SizedBox(height: size.height * 0.02),
                              Text(
                                "OUR COLLECTION",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                              SizedBox(height: size.height * 0.02),
                              Text(
                                "G L Bajaj Central Library has developed an excellent collection of books, journals and non-book material in science, engineering, technology, humanities, social sciences and management. Collection building – a core activity of the library, has been undergoing a transformation. From print-only environment where all our acquisitions were in hard copy format, it has shifted to print-and-online and to online-only formats. However, most of books, both text and reference, are still preferred in print-only.",
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
