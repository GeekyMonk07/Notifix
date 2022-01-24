import 'package:appnewui/Authentication/adminlogin/adminlogin.dart';
import 'package:appnewui/Authentication/welcomePage/background.dart';
import 'package:appnewui/Authentication/widget/button.dart';
import 'package:appnewui/constrants.dart';
import 'package:flutter/material.dart';
import 'package:appnewui/Authentication/Auth/firebase.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';


class Body extends StatefulWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _isLoading = false;
  void click() async{
    setState(() {
      _isLoading = true;
    });
    print("Signing with google clicked------>");
    try{
      final provider=Provider.of<GoogleSignInProvider>(context,listen:false);
      await provider.signInWithGoogle();
      Navigator.push(context,MaterialPageRoute(builder: (context)=>AdminLogin()));
    }catch(e){
      Fluttertoast.showToast(msg: "Error while logging in");
      setState(() {
        _isLoading = false;
      });
    }



  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return WelcomeBackground(
      body: _isLoading ? Center(child:CircularProgressIndicator()): SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * .05,
              ),
              Text(
                "WELCOME TO GLBITM",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
              ),
              Text(
                "FIND YOUR SPARK",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
              ),
              SizedBox(height: size.height * 0.05),
              
              Lottie.asset("assets/images/welcome.json", height: 250),
              
              SizedBox(height: size.height * 0.05),
              CircularButton(
                text: "LOGIN",
                color: primaryColor,
                textColor: Colors.white,
                press: () => this.click(),
              ),
              SizedBox(height: size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}

