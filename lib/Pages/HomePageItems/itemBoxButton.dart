// ignore: file_names
import 'package:flutter/material.dart';

class ItemBoxButton extends StatelessWidget {
  final String imgUrl;
  final String imgCaption;
  final VoidCallback? ontap;

  const ItemBoxButton(
      {Key? key, required this.imgUrl, required this.imgCaption, this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          InkWell(
              onTap: ontap,
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  height: 70,
                  width: 70,
                  child: Image.asset(imgUrl))),
          SizedBox(
            height: 5,
          ),
          Text(imgCaption)
        ],
      ),
    );
  }
}
