
import 'package:appnewui/Authentication/widget/button.dart';
import 'package:appnewui/constrants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


import 'background.dart';

class UpdateBody extends StatefulWidget {
  const UpdateBody({Key? key}) : super(key: key);

  @override
  _UpdateBodyState createState() => _UpdateBodyState();
}

class _UpdateBodyState extends State<UpdateBody> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // StoreRedirect.redirect();
    return UpdateBackground(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * .05,
              ),
              Text(
                "New updates avaialable",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
              ),

              SizedBox(height: size.height * 0.06),
              Lottie.asset("assets/images/update.json",
                  height: 500),
              SizedBox(height: size.height * 0.080),
              CircularButton(
                text: "Update",
                color: primaryColor,
                textColor: Colors.white,
                press: () async{


                  // StoreRedirect.redirect(
                  //   androidAppId: "com.iyaffle.rangoli",
                  //
                  // );
                  // await LaunchReview.launch(androidAppId: "com.iyaffle.rangoli",);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


