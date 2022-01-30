import 'package:flutter/material.dart';
import 'data.dart';

class DetailPage extends StatelessWidget {
  final Clubs details;

  const DetailPage({Key? key, required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: size.height * 0.32),
                          Text(
                            details.name,
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 50,
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            'GLBITM',
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Divider(color: Colors.black38),
                          SizedBox(height: size.height * 0.01),
                          Text(
                            details.description,
                            //maxLines: 5,
                            //overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          Divider(color: Colors.black38),
                          Text(
                            'Gallery',
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 25,
                              color: const Color(0xff47455f),
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: size.height * 0.01),
                          Container(
                            height: size.height * 0.285,
                            //padding: const EdgeInsets.only(left: 32.0),
                            child: ListView.builder(
                                itemCount: details.images.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Card(
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: AspectRatio(
                                        aspectRatio: 1,
                                        child:
                                            //Image.asset(
                                            // "assets/images/book.png",
                                            Image.network(
                                          details.images[index],
                                          fit: BoxFit.cover,
                                          loadingBuilder: (context, child,
                                                  loadingProgress) =>
                                              loadingProgress == null
                                                  ? child
                                                  : Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                      color: Color(0xff6F35A5),
                                                    )),
                                        )),
                                  );
                                }),
                          )
                        ]),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              height: size.height * 0.34,
              width: size.width,
              child: Image.asset(
                details.iconImage,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
