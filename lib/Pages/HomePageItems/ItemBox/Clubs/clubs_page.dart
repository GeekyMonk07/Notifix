import 'package:appnewui/Pages/HomePageItems/ItemBox/Clubs/data.dart';
import 'package:appnewui/constrants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'details.dart';

class ClubsPage extends StatefulWidget {
  @override
  _ClubsPageState createState() => _ClubsPageState();
}

class _ClubsPageState extends State<ClubsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [secondaryPurple, primaryColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3, 0.7])),
        child: SafeArea(
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
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'College Clubs',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 44,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    // DropdownButton(
                    //   items: [
                    //     DropdownMenuItem(
                    //       child:
                    Text(
                      'GLBITM',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    //     ),
                    //   ],
                    //   onChanged: (value) {},
                    //   icon: Padding(
                    //     padding: const EdgeInsets.only(left: 16.0),
                    //     child: Image.asset('assets/drop_down_icon.png'),
                    //   ),
                    //   underline: SizedBox(),
                    // ),
                  ],
                ),
              ),
              Container(
                height: 520,
                padding: const EdgeInsets.only(left: 32),
                child: Swiper(
                  itemCount: clubs.length,
                  itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                  layout: SwiperLayout.STACK,
                  pagination: SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                        activeColor: Colors.black, activeSize: 20, space: 8),
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, a, b) => DetailPage(
                              details: clubs[index],
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              SizedBox(height: 120),
                              Card(
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(32.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(height: 100),
                                      Text(
                                        clubs[index].name,
                                        style: TextStyle(
                                          fontFamily: 'Avenir',
                                          fontSize: 44,
                                          color: const Color(0xff47455f),
                                          fontWeight: FontWeight.w900,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      // Text(
                                      //   'Google',
                                      //   style: TextStyle(
                                      //     fontFamily: 'Avenir',
                                      //     fontSize: 23,
                                      //     color: Colors.amber,
                                      //     fontWeight: FontWeight.w500,
                                      //   ),
                                      //   textAlign: TextAlign.left,
                                      // ),
                                      SizedBox(height: 32),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            'Know more',
                                            style: TextStyle(
                                              fontFamily: 'Avenir',
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          Icon(
                                            Icons.arrow_forward,
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // Hero(
                          //     tag: 1,
                          //     child: Image.asset("assets/images/club.png")),

                          Image.asset("assets/images/clubs.png"),
                          Positioned(
                            right: 24,
                            bottom: 60,
                            child: Text(
                              clubs[index].position.toString(),
                              style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 180,
                                color: Colors.grey,
                                fontWeight: FontWeight.w900,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
