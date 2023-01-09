import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:food_delevary_admin/core/consts.dart';
import 'package:food_delevary_admin/presentation/Widget/material_button.dart';
import 'package:food_delevary_admin/presentation/signup/widgets/custom_title.dart';

class SelectedPhotoViewScrreen extends StatelessWidget {
  SelectedPhotoViewScrreen({
    super.key,
    this.imagepath,
    this.imagename,
    required this.restaurantname,
    required this.details,
    required this.address,
    required this.email,
    required this.mobile,
    required this.gstnumber,
    required this.isDinnig,
  });
  String? imagepath;
  String? imagename;
  final String restaurantname;
  final String details;
  final String address;
  final String email;
  final String mobile;
  final String gstnumber;
  final bool isDinnig;
  UploadTask? uploadTask;
  // final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    final mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const LoginpageTitle(
              appbartitle1: "Are you Okkay",
              appbartitle2: "With this Profile?"),
          khight20,
          Container(
            width: mwidth * 0.70,
            height: mwidth * 0.70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    image: (imagepath != null)
                        ? FileImage(File(imagepath!))
                        : const AssetImage("asset/LogIn/Logo.png")
                            as ImageProvider)),
          ),
          const Spacer(),
          CutomMaterialButton(
              onpressed: () async {
                final imageUrl = await uploadFiletoFirebase(context);
              },
              text: "Upload Image",
              width: mwidth / 2),
          khight20,
        ],
      ),
    ));
  }

  uploadFiletoFirebase(BuildContext context) async {
    final path = 'HotalPhotos/${imagename}Profile';
    final file = File(imagepath!);
    log(imagepath.toString());
    final ref = FirebaseStorage.instance.ref(path);

    uploadTask = ref.putFile(file);
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    log('Uploaded');
    final sanpshot = await uploadTask!.whenComplete(() {});
    log('After Upload');
    final urlDownload = await sanpshot.ref.getDownloadURL();
    log("Download Link : $urlDownload");

    uploadTask = null;

    return urlDownload;
  }
}
