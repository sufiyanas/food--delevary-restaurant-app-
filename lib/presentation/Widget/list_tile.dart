import 'package:flutter/material.dart';
import 'package:food_delevary_admin/core/consts.dart';
import 'package:food_delevary_admin/infrastructure/data_modal.dart';
import 'package:food_delevary_admin/infrastructure/order_modal.dart';
import 'package:food_delevary_admin/presentation/foodview/food_view_screen.dart';

class ListtileCard extends StatelessWidget {
  const ListtileCard({
    Key? key,
    required this.mwidth,
    required this.userModel,
  }) : super(key: key);

  final double mwidth;
  final Food userModel;

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

class TileWidgetForOder extends StatelessWidget {
  const TileWidgetForOder(
      {super.key, required this.mWidth, required this.orderModal});

  final OrderModal orderModal;
  final double mWidth;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: mWidth - 10,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey.shade800),
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
                width: mWidth / 3 - 20,
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
                  orderModal.dishname,
                  style: TextStyle(fontFamily: fontBold, fontSize: 17),
                ),
                khight5,
                Text(
                  orderModal.userEmail,
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
              "",
              style: const TextStyle(color: Colors.orange, fontSize: 25),
            ),
          )
        ],
      ),
    );
  }
}
