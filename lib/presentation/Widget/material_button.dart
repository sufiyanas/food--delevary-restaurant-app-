import 'package:flutter/material.dart';
import 'package:food_delevary_admin/core/consts.dart';

class CutomMaterialButton extends StatelessWidget {
  const CutomMaterialButton({
    Key? key,
    required this.onpressed,
    required this.text,
    required this.width,
  }) : super(key: key);

  final Function() onpressed;
  final String text;
  final double width;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      onPressed: onpressed,
      color: Colors.green,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
