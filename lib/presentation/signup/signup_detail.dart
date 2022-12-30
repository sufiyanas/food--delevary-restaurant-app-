import 'dart:developer';
import 'dart:ui' as ui;
import 'package:email_validator/email_validator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delevary_admin/core/consts.dart';
import 'package:food_delevary_admin/presentation/Widget/big_text.dart';
import 'package:food_delevary_admin/presentation/Widget/material_button.dart';
import 'package:food_delevary_admin/presentation/Widget/smalltext.dart';
import 'package:food_delevary_admin/presentation/loginScreen/widget/text_fomfield.dart';
import 'package:food_delevary_admin/presentation/signup/upload_photo_screen.dart';
import 'package:food_delevary_admin/presentation/signup/widgets/custom_title.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SignDetailsScreen extends StatefulWidget {
  SignDetailsScreen({super.key});

  @override
  State<SignDetailsScreen> createState() => _SignDetailsScreenState();
}

class _SignDetailsScreenState extends State<SignDetailsScreen> {
  final TextEditingController restorentnamecontroller = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController gstController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController detailcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool isDinning = false;
  String? address;
  @override
  Widget build(BuildContext context) {
    bool isSwitched = true;
    Set<Marker> markers = {};
    late GoogleMapController googleMapController;

    CameraPosition initialCameraPosition = const CameraPosition(
      target: LatLng(9.9312, 76.2673),
      zoom: 10,
    );

    final mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                const LoginpageTitle(
                  appbartitle1: "Fill Your Restaurant ",
                  appbartitle2: "Details",
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Textfieldwidget(
                    controller: restorentnamecontroller,
                    labeltext: "Restaurant name",
                    prefixicon: Icon(
                      Icons.restaurant_menu,
                      color: kthemeGreen,
                    ),
                    onchnaged: (String) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter any thing";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Textfieldwidget(
                    maxline: 3,
                    controller: detailcontroller,
                    labeltext: "Hotal details",
                    prefixicon: Icon(
                      Icons.email,
                      color: kthemeGreen,
                    ),
                    onchnaged: (value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter any thing";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Textfieldwidget(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter any thing";
                      }
                      return null;
                    },
                    textInputType: TextInputType.number,
                    controller: numberController,
                    labeltext: "Mobile Number",
                    prefixicon: Icon(
                      Icons.call,
                      color: kthemeGreen,
                    ),
                    onchnaged: (String) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Textfieldwidget(
                    controller: gstController,
                    labeltext: "GST (optional)",
                    prefixicon: Icon(
                      Icons.numbers_rounded,
                      color: kthemeGreen,
                    ),
                    onchnaged: (String) {},
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
                        const Icon(
                          Icons.dining,
                          color: Colors.green,
                        ),
                        kwidth10,
                        const Text(
                          "Dining",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              letterSpacing: 0.9),
                        ),
                        const Spacer(),
                        Switch(
                          value: isDinning,
                          onChanged: (value) {
                            setState(() {
                              isDinning = value;
                            });
                          },
                          activeTrackColor: Colors.lightGreenAccent,
                          activeColor: Colors.green,
                        ),
                      ],
                    ),
                  ),
                ),
                SmallGreyText(text: "Try to add background removed image"),
                khight10,
                SmallGreyText(text: "(PNG highly recommended)"),
                containerfunction(
                    mwidth: mwidth,
                    imageurl: "asset/setup/addimage.png",
                    imagetext: "",
                    ontap: () {}),
                Divider(
                  color: Colors.grey,
                ),
                BigTextWithBold(text: "LogIn Information"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Textfieldwidget(
                    controller: emailController,
                    labeltext: "Email",
                    prefixicon: Icon(
                      Icons.email,
                      color: kthemeGreen,
                    ),
                    onchnaged: (value) {},
                    validator: (text) =>
                        text != null && !EmailValidator.validate(text)
                            ? "Enter a vaild email"
                            : null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Textfieldwidget(
                    obscuseText: true,
                    controller: passwordController,
                    labeltext: "password",
                    prefixicon: Icon(
                      Icons.lock,
                      color: kthemeGreen,
                    ),
                    onchnaged: (value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter any password";
                      } else if (value.length < 6) {
                        return "Min 6 digits";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Textfieldwidget(
                    obscuseText: true,
                    controller: passwordController,
                    labeltext: "Conform password",
                    prefixicon: Icon(
                      Icons.lock,
                      color: kthemeGreen,
                    ),
                    onchnaged: (value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter any password";
                      } else if (value.length < 6) {
                        return "Min 6 digits";
                      }
                      return null;
                    },
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                BigTextWithBold(text: "Onner Information"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Textfieldwidget(
                    controller: restorentnamecontroller,
                    labeltext: "Fullname",
                    prefixicon: Icon(
                      Icons.person,
                      color: kthemeGreen,
                    ),
                    onchnaged: (String) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter any thing";
                      }
                      return null;
                    },
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                BigTextWithBold(text: "Restaurent Zone"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Textfieldwidget(
                    maxline: 4,
                    controller: detailcontroller,
                    labeltext: "hotal Address",
                    prefixicon: Icon(
                      Icons.email,
                      color: kthemeGreen,
                    ),
                    onchnaged: (value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter any thing";
                      }
                      return null;
                    },
                  ),
                ),
                Stack(
                  children: [
                    SizedBox(
                      width: mwidth * 0.95,
                      height: mwidth * 0.70,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: GoogleMap(
                          initialCameraPosition: initialCameraPosition,
                          markers: markers,
                          zoomControlsEnabled: false,
                          mapType: MapType.normal,
                          onMapCreated: (GoogleMapController controller) {
                            googleMapController = controller;
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      bottom: 10,
                      child: CircleAvatar(
                        child: IconButton(
                            onPressed: () async {
                              Position position = await determinePOsition();

                              getuserAddress(position);
                              googleMapController.animateCamera(
                                  CameraUpdate.newCameraPosition(CameraPosition(
                                      target: LatLng(position.latitude,
                                          position.longitude),
                                      tilt: 10,
                                      bearing: 10,
                                      zoom: 16)));
                              final Uint8List markIcons = await getImages(
                                  "asset/setup/location-removebg-preview.png",
                                  120);
                              markers.clear();
                              markers.add(Marker(
                                  markerId: MarkerId("your Current location"),
                                  icon: BitmapDescriptor.fromBytes(markIcons,
                                      size: Size.fromRadius(10)),
                                  position: LatLng(
                                      position.latitude, position.longitude)));
                              setState(() {});
                            },
                            icon: Icon(
                              Icons.location_searching_rounded,
                              size: 25,
                            )),
                      ),
                    )
                  ],
                ),
                CutomMaterialButton(
                    onpressed: () {
                      final isvalid = formkey.currentState!.validate();
                      if (!isvalid) {
                        return;
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => (UploadPhotoScreen(
                              address: detailcontroller.text,
                              details: detailcontroller.text,
                              email: emailController.text,
                              gstnumber: gstController.text,
                              isDinnig: isDinning,
                              mobile: numberController.text,
                              restaurantname: restorentnamecontroller.text,
                            )),
                          ));
                    },
                    text: "Next",
                    width: mwidth / 2),
              ],
            ),
          ),
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
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        width: mwidth - 50,
        height: mwidth / 2,
        decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image: AssetImage(imageurl), fit: BoxFit.cover)),
      ),
    );
  }

  //map funtuon temp must remove it a file

  Future<Position> determinePOsition() async {
    bool seaviceEnebled;
    LocationPermission permission;
    seaviceEnebled = await Geolocator.isLocationServiceEnabled();

    if (!seaviceEnebled) {
      await Geolocator.openLocationSettings();
      return Future.error("Location service as desabled");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission == await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permition denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location permistion are permenettly denied");
    }
    Position position = await Geolocator.getCurrentPosition();

    return position;
  }

  getuserAddress(Position position) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemark[0];

    setState(() {});
    address =
        "${place.name},${place.street},PIN:${place.postalCode},${place.subLocality},${place.locality},${place.country}";
    log(place.toString());
  }
  //google marker image change

  Future<Uint8List> getImages(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }
}
