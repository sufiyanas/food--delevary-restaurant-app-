import 'package:flutter/material.dart';
import 'package:food_delevary_admin/core/consts.dart';

class Textfieldwidget extends StatelessWidget {
  const Textfieldwidget(
      {Key? key,
      required this.labeltext,
      this.prefixicon,
      this.suffixicon,
      required this.controller,
      this.minimumlines = 1})
      : super(key: key);
  final String labeltext;
  final Widget? prefixicon;
  final Widget? suffixicon;
  final TextEditingController controller;
  final int minimumlines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: minimumlines,
      controller: controller,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade800,
          suffixIcon: suffixicon ?? SizedBox(),
          enabledBorder: OutlineInputBorder(
            // borderSide: BorderSide(color: Colors.greenAccent),
            borderRadius: BorderRadius.circular(20.0),
          ),
          border: OutlineInputBorder(),
          // fillColor: kthemeGreen,
          hoverColor: kthemeGreen,
          focusColor: kthemeGreen,
          labelText: labeltext,
          prefixIcon: prefixicon ?? SizedBox()),
    );
  }
}

class Textfieldwidgetcomment extends StatelessWidget {
  const Textfieldwidgetcomment(
      {Key? key,
      required this.labeltext,
      // required this.prefixicon,
      this.suffixicon})
      : super(key: key);
  final String labeltext;
  // final Widget prefixicon;
  final Widget? suffixicon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 4,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade800,
        suffixIcon: suffixicon ?? SizedBox(),
        enabledBorder: OutlineInputBorder(
          // borderSide: BorderSide(color: Colors.greenAccent),
          borderRadius: BorderRadius.circular(20.0),
        ),
        border: OutlineInputBorder(),
        // fillColor: kthemeGreen,
        hoverColor: kthemeGreen,
        focusColor: kthemeGreen,
        // labelText: labeltext,
        hintText: labeltext,

        //prefixIcon: prefixicon
      ),
    );
  }
}
