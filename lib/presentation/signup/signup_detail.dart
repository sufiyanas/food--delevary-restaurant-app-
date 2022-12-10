import 'package:flutter/material.dart';
import 'package:food_delevary_admin/core/consts.dart';
import 'package:food_delevary_admin/presentation/Widget/material_button.dart';
import 'package:food_delevary_admin/presentation/loginScreen/widget/text_fomfield.dart';
import 'package:food_delevary_admin/presentation/signup/upload_photo_screen.dart';
import 'package:food_delevary_admin/presentation/signup/widgets/custom_title.dart';

class SignDetailsScreen extends StatelessWidget {
  const SignDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isSwitched = true;
    final mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const LoginpageTitle(
              appbartitle1: "Fill Your Restaurant ",
              appbartitle2: "Details",
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Textfieldwidget(
                  labeltext: "Restaurant name",
                  prefixicon: Icon(
                    Icons.restaurant_menu,
                    color: kthemeGreen,
                  )),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Textfieldwidgetcomment(
                labeltext: "Say about Restaurant ",
                // prefixicon: Icon(
                //   Icons.list_alt_outlined,
                //   color: kthemeGreen,
                // ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Textfieldwidget(
                  labeltext: "Email",
                  prefixicon: Icon(
                    Icons.email,
                    color: kthemeGreen,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Textfieldwidget(
                  labeltext: "Mobile Number",
                  prefixicon: Icon(
                    Icons.call,
                    color: kthemeGreen,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Textfieldwidget(
                labeltext: "GST (optional)",
                prefixicon: Icon(
                  Icons.numbers_rounded,
                  color: kthemeGreen,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.shade800),
                child: Row(
                  children: [
                    kwidth5,
                    Icon(
                      Icons.dining,
                      color: Colors.green,
                    ),
                    kwidth10,
                    Text(
                      "Dining",
                      style: TextStyle(
                          fontSize: 15, color: Colors.grey, letterSpacing: 0.9),
                    ),
                    Spacer(),
                    Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        // setState(() {
                        //   isSwitched = value;
                        //   print(isSwitched);
                        // });
                      },
                      activeTrackColor: Colors.lightGreenAccent,
                      activeColor: Colors.green,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            CutomMaterialButton(
                onpressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => (const UploadPhotoScreen()),
                      ));
                },
                text: "Next",
                width: mwidth / 2),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
