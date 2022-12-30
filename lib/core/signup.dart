
// import 'dart:io';

// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';

// uploadFiletoFirebase(BuildContext context) async {
//     final path = 'HotalPhotos/${imagename}Profile';
//     final file = File(imagepath!);
//     log(imagepath.toString());
//     final ref = FirebaseStorage.instance.ref(path);

//     uploadTask = ref.putFile(file);
//     showDialog(
//       context: context,
//       builder: (context) => const Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//     log('Uploaded');
//     final sanpshot = await uploadTask!.whenComplete(() {});
//     log('After Upload');
//     final urlDownload = await sanpshot.ref.getDownloadURL();
//     log("Download Link : $urlDownload");

//     uploadTask = null;

//     return urlDownload;
//   }