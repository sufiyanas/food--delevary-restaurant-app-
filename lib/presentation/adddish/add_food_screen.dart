import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:food_delevary_admin/core/consts.dart';
import 'package:food_delevary_admin/infrastructure/data_modal.dart';
import 'package:food_delevary_admin/presentation/Widget/material_button.dart';
import 'package:food_delevary_admin/presentation/loginScreen/widget/text_fomfield.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:image_picker/image_picker.dart';

class AddFoodScreen extends StatefulWidget {
  AddFoodScreen({super.key});
  @override
  State<AddFoodScreen> createState() => _AddFoodScreenState();
}

class _AddFoodScreenState extends State<AddFoodScreen> {
  // var items = [
  final TextEditingController dishnamecontroller = TextEditingController();
  final TextEditingController aboutDishcontroller = TextEditingController();
  final TextEditingController incredientController = TextEditingController();
  final TextEditingController orginalpriceController = TextEditingController();
  final TextEditingController offerPricecontroller = TextEditingController();
  String? imageURL;
  double progress = 0.0;
  String? imagepath;
  String? imagename;
  UploadTask? uploadTask;
  //is veg
  final userAuth = FirebaseAuth.instance.currentUser!;

  bool isnonveg = false;
  selectimage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }
    setState(() {
      imagepath = image.path;
      imagename = image.name;
    });
  }

  //upload file to fireBase
  uploadFiletoFirebase() async {
    // log("Upload File Called");
    final path = 'files/$imagename';
    final file = File(imagepath!);
    // log(imagepath.toString());
    final ref = FirebaseStorage.instance.ref(path);
    setState(() {
      uploadTask = ref.putFile(file);
    });
    // log('Uploaded');
    final sanpshot = await uploadTask!.whenComplete(() {});
    // log('After Upload');
    final urlDownload = await sanpshot.ref.getDownloadURL();
    // log("Download Link : $urlDownload");
    // setState(() {
    //   uploadTask = null;
    // });
    return urlDownload;
  }

  @override
  Widget build(BuildContext context) {
    final mwidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: SingleChildScrollView(
          child: Column(children: [
            InkWell(
              onTap: () async {
                await selectimage();
              },
              child: Container(
                // width: mwidth / 2,
                height: mwidth / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade800,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: (imagepath != null)
                          ? FileImage(File(imagepath!))
                          : const AssetImage("asset/home/hotalLogo.jpg")
                              as ImageProvider),
                ),
              ),
            ),
            khight20,
            Textfieldwidget(
                onchnaged: (p0) {},
                controller: dishnamecontroller,
                labeltext: "Dish Name",
                prefixicon: const Icon(Icons.restaurant_menu_outlined)),
            khight10,
            const Text("Food type"),
            ToggleSwitch(
              minWidth: 120.0,
              minHeight: 70,
              initialLabelIndex: 1,
              cornerRadius: 20.0,
              inactiveBgColor: Colors.grey.shade800,
              activeFgColor: Colors.white,
              // inactiveBgColor: Colors.grey,
              inactiveFgColor: Colors.white,
              totalSwitches: 2,
              labels: const ['veg', 'Non-veg'],
              icons: const [
                Icons.restaurant_rounded,
                Icons.restaurant_outlined
              ],
              activeBgColors: const [
                [Colors.green],
                [Colors.red]
              ],
              onToggle: (index) {
                if (index == 1) {
                  isnonveg = true;
                }
                print('switched to: $index');
              },
            ),
            khight10,
            // const Textfieldwidgetcomment(labeltext: "Say about dish"),
            Textfieldwidget(
              labeltext: "Say about dish",
              controller: aboutDishcontroller,
              maxline: 3,
              onchnaged: (String) {},
              prefixicon: const SizedBox(),
            ),

            khight10,
            // const Textfieldwidget(
            //     labeltext: "Restaurant Name",
            //     prefixicon: Icon(Icons.restaurant_menu_outlined)),
            Textfieldwidget(
              labeltext: "Increadients(min-4)",
              controller: incredientController,
              maxline: 3,
              onchnaged: (String) {},
              prefixicon: const SizedBox(),
            ),

            khight10,
            Textfieldwidget(
                onchnaged: (p0) {},
                controller: orginalpriceController,
                labeltext: "Price",
                prefixicon: const Icon(Icons.attach_money_outlined)),
            khight10,
            Textfieldwidget(
                onchnaged: (p0) {},
                controller: offerPricecontroller,
                labeltext: "Discount",
                prefixicon: const Icon(Icons.attach_money_outlined)),
            khight20,
            CutomMaterialButton(
                onpressed: () async {
                  imageURL = await uploadFiletoFirebase();

                  final Food user = Food(
                      isNonveg: isnonveg,
                      restaurentEmail: userAuth.email!,
                      imageURL: imageURL ??
                          'https://artsmidnorthcoast.com/wp-content/uploads/2014/05/no-image-available-icon-6.png',
                      dishname: dishnamecontroller.text,
                      aboutdish: aboutDishcontroller.text,
                      increadients: incredientController.text,
                      orginalPrice: orginalpriceController.text,
                      offerPrice: offerPricecontroller.text,
                      count: "1");
                  await addingAllfood(user);
                  addingtoindividualhotal(
                      user, userAuth.email!, dishnamecontroller.text);
                },
                text: "Add",
                width: mwidth / 2)
          ]),
        ),
      ),
    ));
  }

  // Widget buildProgress() {
  //   return StreamBuilder<TaskSnapshot>(
  //       stream: uploadTask?.snapshotEvents,
  //       builder: (context, snapshot) {
  //         if (snapshot.hasData) {
  //           final data = snapshot.data!;
  //           double progress = data.bytesTransferred / data.totalBytes;
  //         }
  //         return SizedBox(
  //           height: 100,
  //           child: Stack(
  //             children: [
  //               LinearProgressIndicator(
  //                 value: progress,
  //                 backgroundColor: Colors.blue,
  //                 color: Colors.red,
  //               ),
  //               Center(
  //                 child: Text("${(100 * progress).roundToDouble()}%"),
  //               )
  //             ],
  //           ),
  //         );
  //       });
  // }
}

//for creating user
Future addingAllfood(Food user) async {
  final docUser = FirebaseFirestore.instance.collection("food").doc();
  user.id = docUser.id;

  final json = user.toJson();
  await docUser.set(json);
}

Future addingtoindividualhotal(
    Food user, String currentuserEmail, String Foodname) async {
  final docUser = FirebaseFirestore.instance
      .collection("Restaurent")
      .doc(currentuserEmail)
      .collection("catagory")
      .doc(Foodname);
  user.id = docUser.id;

  final json = user.toJson();
  await docUser.set(json);
}
