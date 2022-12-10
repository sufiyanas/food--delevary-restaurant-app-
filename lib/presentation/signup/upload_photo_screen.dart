import 'package:flutter/material.dart';
import 'package:food_delevary_admin/core/consts.dart';
import 'package:food_delevary_admin/presentation/Widget/material_button.dart';
import 'package:food_delevary_admin/presentation/signup/location_setup_screen.dart';
import 'package:food_delevary_admin/presentation/signup/widgets/custom_title.dart';

class UploadPhotoScreen extends StatelessWidget {
  const UploadPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const LoginpageTitle(
                appbartitle1: "Upload a picture of the",
                appbartitle2: "Restaurant"),
            containerfunction(
                mwidth: mwidth,
                imagetext: "From Gallary",
                imageurl: "asset/setup/Galleryicon.png"),
            khight10,
            containerfunction(
                mwidth: mwidth,
                imagetext: "Take Photo",
                imageurl: "asset/setup/camera.png"),
            Spacer(flex: 3),
            CutomMaterialButton(
                onpressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => (SetLocationScreen()),
                      ));
                },
                text: "Next",
                width: mwidth / 2),
            Spacer()
          ],
        ),
      ),
    );
  }

  Container containerfunction(
      {required mwidth, required imageurl, required imagetext}) {
    return Container(
      width: mwidth - 50,
      height: mwidth / 2,
      decoration: BoxDecoration(
          color: Colors.grey.shade800, borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imageurl),
          khight10,
          Text(
            imagetext,
            style: TextStyle(fontFamily: fontBold),
          )
        ],
      ),
    );
  }
}
