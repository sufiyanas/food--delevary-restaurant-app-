import 'package:flutter/material.dart';
import 'package:food_delevary_admin/core/consts.dart';

class SmallGreyText extends StatelessWidget {
  const SmallGreyText({super.key, required this.text, this.fontsize = 20});
  final String text;
  final double fontsize;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.grey,
        fontFamily: fontBook,
        fontSize: fontsize,
      ),
    );
  }
}
