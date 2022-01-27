import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  final String? imgUrl;
  final String imgtext;
  final VoidCallback? ontap;

  const SettingsButton(
      {Key? key, this.imgUrl, required this.imgtext, this.ontap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(30),
      color: Color(0xffF1E6FF),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: ontap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          height: 50,
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(
              //   width: 30,
              // ),
              Container(height: 35, width: 35, child: Image.asset("$imgUrl")),
              SizedBox(
                width: 10,
              ),
              Text(
                "$imgtext",
                style: TextStyle(
                    // color: Color(0xff6F35A5),
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}
