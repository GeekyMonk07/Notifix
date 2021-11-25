import 'package:flutter/material.dart';

class CentralLibrary extends StatelessWidget {
  // final Clubs details;

  // const CentralLibrary({Key? key, required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                // Padding(
                //   padding: const EdgeInsets.all(28.0),
                // child: Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: <Widget>[
                //SizedBox(height: 300),
                Text(
                  "Central Library",
                  //details.name,
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontSize: 56,
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: (118.0)),
                  child: Text(
                    'GLBITM',
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Divider(color: Colors.black38),
                SizedBox(height: 10),
                Text(
                  "The Central Library of G L Bajaj is user-focused, innovative, and excellence driven. The library has always benefited from the institute’s culture, is pioneer in adopting new technology and is far ahead than many libraries in the region. Central Library provides fully air-conditioned & Wi-Fi enabled world-class learning environment. The Library has well-developed book stack, reference section and digital library which makes studying a unique and a lifetime experience.",
                  //details.description,
                  // maxLines: 5,
                  // overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Divider(color: Colors.black38),
                SizedBox(height: 10),
                //     ],
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 32.0),
                //   child:
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
                // ),
                SizedBox(height: 8),
                Container(
                  height: 250,
                  padding: const EdgeInsets.only(left: 10.0),
                  child: ListView.builder(
                      itemCount: 3,
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
                              child: Image.asset(
                                "assets/images/book.png",
                                // Image.network(
                                //   planetInfo.images[index],
                                fit: BoxFit.cover,
                              )),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
