import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  final String text;
  final Color color;
  final IconData? icon, suffixicon;
  final bool privacy;
  final TextInputType keyType;

  const RoundedTextField(
      {Key? key,
      required this.text,
      required this.color,
      required this.privacy,
      required this.icon,
      required this.keyType,
      this.suffixicon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      borderRadius: BorderRadius.circular(29),
      color: Color(0xfffac439),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        height: 55,
        width: size.width * .8,
        child: TextFormField(
          cursorColor: color,
          obscureText: privacy,
          keyboardType: keyType, //type of keyboard

          decoration: InputDecoration(
              hintText: text,
              border: InputBorder.none,
              icon: Icon(
                icon,
                color: color,
              ),
              suffixIcon: Icon(
                suffixicon,
                color: color,
              )),
        ),
      ),
    );
  }
}
