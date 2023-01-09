import 'dart:developer';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delevary_admin/core/Utils.dart';
import 'package:food_delevary_admin/core/consts.dart';
import 'package:food_delevary_admin/main.dart';
import 'package:food_delevary_admin/presentation/Home/home_screen.dart';
import 'package:food_delevary_admin/presentation/loginScreen/widget/text_fomfield.dart';
import 'package:food_delevary_admin/presentation/signup/signup_detail.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final mheight = MediaQuery.of(context).size.height;
    final mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Container(
                height: mwidth,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('asset/LogIn/Logo.png'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Textfieldwidget(
                  validator: (text) =>
                      text != null && !EmailValidator.validate(text)
                          ? "Enter a vaild email"
                          : null,
                  controller: emailcontroller,
                  labeltext: "Username",
                  prefixicon: Icon(
                    Icons.person,
                    color: kthemeGreen,
                  ),
                  onchnaged: (value) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Textfieldwidget(
                  controller: passwordController,
                  labeltext: "Password",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter any password";
                    } else if (value.length < 6) {
                      return "Min 6 digits";
                    }
                    return null;
                  },
                  prefixicon: Icon(
                    Icons.lock,
                    color: kthemeGreen,
                  ),
                  onchnaged: (value) {},
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forget your Password?",
                    style: TextStyle(color: kthemeGreen),
                  )),
              MaterialButton(
                height: 50,
                onPressed: () {
                  login(context);
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => (HomeScreen()),
                  //     ));
                },
                color: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 8,
                minWidth: mwidth / 2,
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white, fontSize: 15, fontFamily: fontBold),
                ),
              ),
              Text("or"),
              MaterialButton(
                height: 50,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => (SignDetailsScreen()),
                      ));
                },
                color: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 8,
                minWidth: mwidth / 2,
                child: Text(
                  "Create a account",
                  style: TextStyle(
                      color: Colors.white, fontSize: 15, fontFamily: fontBold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future login(BuildContext context) async {
    // final isvalid = formkey.currentState!.validate();
    // if (!isvalid) {
    //   return;
    // }

    try {
      log("The email is ${emailcontroller.text} and password is ${passwordController.text}");
      showDialog(
        context: context,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passwordController.text.trim(),
        // email: "admin@gmail.com",
        // password: "101010"
      );

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Mainpage(),
          ));
    } on FirebaseAuthException catch (e) {
      log(e.message.toString());
      Utils.customSnackbar(
          context: context,
          text: e.message.toString(),
          type: AnimatedSnackBarType.error,
          mobileSnackBarPosition: MobileSnackBarPosition.top);
    }
  }
}
