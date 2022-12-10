import 'package:flutter/material.dart';
import 'package:food_delevary_admin/core/consts.dart';
import 'package:food_delevary_admin/presentation/Home/home_screen.dart';
import 'package:food_delevary_admin/presentation/loginScreen/widget/text_fomfield.dart';
import 'package:food_delevary_admin/presentation/signup/signup_detail.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mheight = MediaQuery.of(context).size.height;
    final mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
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
              labeltext: "Username",
              prefixicon: Icon(
                Icons.person,
                color: kthemeGreen,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Textfieldwidget(
              labeltext: "Password",
              prefixicon: Icon(
                Icons.lock,
                color: kthemeGreen,
              ),
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => (HomeScreen()),
                  ));
            },
            color: Colors.green,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
    );
  }
}
