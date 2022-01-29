import 'package:appnewui/constrants.dart';
import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  final String text;
  final String initial;
  final Color color;
  final IconData? icon, suffixicon;
  final bool privacy;
  final TextInputType keyType;
  final String? data;
  final Function(String)? ontap;

  const RoundedTextField(
      {Key? key,
      required this.text,
      required this.initial,
      this.ontap,
      this.data,
      required this.color,
      required this.privacy,
      required this.icon,
      required this.keyType,
      this.suffixicon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    Size size = MediaQuery.of(context).size;
    return Material(
      borderRadius: BorderRadius.circular(29),
      color: secondaryPurple,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        height: 55,
        width: size.width * .8,
        child: Form(
          key: _formKey,
          child: TextFormField(
            initialValue: initial,
            onChanged: ontap,

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
      ),
    );
  }
}
