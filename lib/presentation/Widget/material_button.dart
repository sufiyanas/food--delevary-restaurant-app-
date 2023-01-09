import 'package:flutter/material.dart';
import 'package:food_delevary_admin/core/consts.dart';

class CutomMaterialButton extends StatelessWidget {
  const CutomMaterialButton(
      {Key? key,
      required this.onpressed,
      required this.text,
      required this.width,
      this.borderRadius = 10,
      this.height = 50})
      : super(key: key);

  final Function() onpressed;
  final String text;
  final double width;
  final double borderRadius;
  final double height;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      onPressed: onpressed,
      color: Colors.green,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius)),
      elevation: 8,
      minWidth: width,
      child: Text(
        text,
        style:
            TextStyle(color: Colors.white, fontSize: 15, fontFamily: fontBold),
      ),
    );
  }
}
