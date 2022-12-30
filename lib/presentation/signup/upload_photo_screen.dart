import 'package:flutter/material.dart';
import 'package:food_delevary_admin/core/consts.dart';
import 'package:food_delevary_admin/presentation/signup/selectedphotoscreen.dart';
import 'package:food_delevary_admin/presentation/signup/widgets/custom_title.dart';
import 'package:image_picker/image_picker.dart';

class UploadPhotoScreen extends StatelessWidget {
  UploadPhotoScreen(
      {super.key,
      required this.restaurantname,
      required this.details,
      required this.address,
      required this.email,
      required this.mobile,
      required this.gstnumber,
      required this.isDinnig});
  final ImagePicker picker = ImagePicker();
  String? imagepath;
  String? imagename;
  final String restaurantname;
  final String details;
  final String address;
  final String email;
  final String mobile;
  final String gstnumber;
  final bool isDinnig;

//select image from gallary
  selectImageGallary() async {
    final XFile? imageGallary =
        await picker.pickImage(source: ImageSource.gallery);
    if (imageGallary == null) {
      return;
    }

    imagepath = imageGallary.path;
    imagename = imageGallary.name;
  }

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
                ontap: () async {
                  await selectImageGallary();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SelectedPhotoViewScrreen(
                            imagename: imagename,
                            imagepath: imagepath,
                            restaurantname: restaurantname,
                            details: details,
                            address: address,
                            email: email,
                            mobile: mobile,
                            gstnumber: gstnumber,
                            isDinnig: isDinnig),
                      ));
                },
                mwidth: mwidth,
                imagetext: "From Gallary",
                imageurl: "asset/setup/Galleryicon.png"),
            khight10,
            containerfunction(
                ontap: () {},
                mwidth: mwidth,
                imagetext: "Take Photo",
                imageurl: "asset/setup/camera.png"),
            Spacer(flex: 3),
            // CutomMaterialButton(
            //     onpressed: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => (SetLocationScreen()),
            //           ));
            //     },
            //     text: "Next",
            //     width: mwidth / 2),
            Spacer()
          ],
        ),
      ),
    );
  }

  Widget containerfunction(
      {required mwidth,
      required imageurl,
      required imagetext,
      required Function() ontap}) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: mwidth - 50,
        height: mwidth / 2,
        decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.circular(15)),
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
      ),
    );
  }
}
