import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

class Utils {
  // static final messagerkey = GlobalKey<ScaffoldMessengerState>();
  // static showSnackBar(String? text) {
  //   if (text == null) {
  //     return;
  //   }
  //   final snackBar = SnackBar(
  //     content: Text(text),
  //     backgroundColor: Colors.red,
  //   );

  //   messagerkey.currentState!
  //     ..removeCurrentSnackBar()
  //     ..showSnackBar(snackBar);
  // }
  static customSnackbar(
      {required BuildContext context,
      required String text,
      required AnimatedSnackBarType type,
      MobileSnackBarPosition mobileSnackBarPosition =
          MobileSnackBarPosition.bottom}) {
    AnimatedSnackBar.material(
      text,
      type: type,
      // ignore: prefer_const_constructors
      duration: Duration(seconds: 7),
      mobileSnackBarPosition: mobileSnackBarPosition,
      // desktopSnackBarPosition: DesktopSnackBarPosition.bottomLeft,
    ).show(context);
  }
}
