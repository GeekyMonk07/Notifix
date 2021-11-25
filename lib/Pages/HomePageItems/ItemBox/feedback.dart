import 'package:appnewui/constrants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lottie/lottie.dart';

class AppFeedback extends StatefulWidget {
  const AppFeedback({Key? key}) : super(key: key);

  @override
  State<AppFeedback> createState() => _AppFeedbackState();
}

class _AppFeedbackState extends State<AppFeedback> {
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: secondaryPurple,
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
                    Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Text(
                        "Rate Our App",
                        //details.name,
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 56,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                        child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Lottie.asset("assets/images/appfeedback.json",
                            height: 200),
                        // const Text(
                        //   "Uploading Timetable...",
                        //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        // ),
                      ],
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        "Rating: $rating",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: RatingBar.builder(
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: primaryColor,
                          ),
                          onRatingUpdate: (rating) => setState(() {
                            this.rating = rating;
                          }),
                        ),
                      ),
                    ),
                  ]),
            ))));
  }
}
