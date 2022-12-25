import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delevary_admin/core/consts.dart';
import 'package:food_delevary_admin/infrastructure/data_modal.dart';
import 'package:food_delevary_admin/presentation/adddish/add_food_screen.dart';
import 'package:food_delevary_admin/presentation/foodview/food_view_screen.dart';
import 'package:food_delevary_admin/presentation/notificationscreen/notificationscreen.dart';
import 'package:food_delevary_admin/presentation/signup/widgets/custum_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          CustomAppBar(
            textone: "Add Your",
            texttwo: "Restaurant Menu",
            actionButton: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => (const NotificationScreen()),
                    ));
                  },
                  icon: Badge(
                    badgeColor: Colors.red,
                    toAnimate: true,
                    // badgeContent: const Text(
                    //   "1",
                    //   style: TextStyle(fontSize: 5),
                    // ),
                    position: BadgePosition.bottomEnd(bottom: 19, end: 2),
                    child: Icon(
                      Icons.notifications_none,
                      size: 30,
                      color: kthemeGreen,
                    ),
                  ),
                )),
          ),
          khight10,
          StreamBuilder<List<User>>(
            stream: fetchFoood(CollectionName: "food"),
            builder: (context, snapShot) {
              final users = snapShot.data!;
              if (snapShot.hasData) {
                return ListView(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  children: users.map(buildFood).toList(),
                );
              } else if (snapShot.hasError) {
                return const Text("Something went wrong!!");
              } else {
                return Center(
                  child: Text("No data found"),
                );
              }
            },
          )
        ],
      ),
      floatingActionButton: CircleAvatar(
        radius: 30,
        child: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => (AddFoodScreen()),
              ),
            );
            // _showMyDialog(context);
          },
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}

Widget buildFood(User user) {
  return ListtileCard(
    mwidth: 100,
    userModel: user,
  );
}

Stream<List<User>> fetchFoood({required String CollectionName}) =>
    FirebaseFirestore.instance.collection(CollectionName).snapshots().map(
        (snapShot) =>
            snapShot.docs.map((doc) => User.fromJson(doc.data())).toList());
//   Future<void> _showMyDialog(BuildContext ctx) async {
//     return showDialog<void>(
//       context: ctx,
//       barrierDismissible: false, // user must tap button!
//       builder: (BuildContext context) {
//         String? catogary;
//         return AlertDialog(
//           // titlePadding: EdgeInsets.symmetric(vertical: 10),

//           clipBehavior: Clip.none,
//           shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(20.0))),
//           title: const Text('Add your food'),
//           content: SingleChildScrollView(
//             child:
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('Add'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

class ListtileCard extends StatelessWidget {
  const ListtileCard({
    Key? key,
    required this.mwidth,
    required this.userModel,
  }) : super(key: key);

  final double mwidth;
  final User userModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => (DetailMenuScreen(
                user: userModel,
              )),
            ));
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        width: mwidth - 10,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade800),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  "asset/home/2-2-2-2foodgroups_vegetables_detailfeature.jpg",
                  width: mwidth / 3 - 20,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userModel.dishname,
                    style: TextStyle(fontFamily: fontBold, fontSize: 17),
                  ),
                  khight5,
                  Text(
                    userModel.id,
                    style: TextStyle(
                        fontFamily: fontBook, fontSize: 17, color: Colors.grey),
                  )
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                "\$${userModel.orginalPrice}",
                style: const TextStyle(color: Colors.orange, fontSize: 25),
              ),
            )
          ],
        ),
      ),
    );
  }
}
