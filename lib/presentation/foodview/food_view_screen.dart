import 'package:flutter/material.dart';
import 'package:food_delevary_admin/infrastructure/data_modal.dart';

import '../../core/consts.dart';

class DetailMenuScreen extends StatelessWidget {
  const DetailMenuScreen({super.key, required this.user});
  final Food user;
  @override
  Widget build(BuildContext context) {
    final mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: mwidth,
            height: mwidth + 20,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image:
                        //  AssetImage("asset/detailview/Photo Menu copy.png"),
                        NetworkImage(user.imageURL),
                    fit: BoxFit.cover)),
          ),
        ),
        SizedBox.expand(
          child: DraggableScrollableSheet(
            maxChildSize: 0.9,
            minChildSize: 0.50,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: kthemeBlack,
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8),
                        width: 50,
                        height: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(20),
                          color: Colors.grey.shade800,
                        ),
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     // Container(
                      //     //   margin: EdgeInsets.all(10),
                      //     //   width: 120,
                      //     //   height: 40,
                      //     //   decoration: BoxDecoration(
                      //     //       borderRadius: BorderRadius.circular(30),
                      //     //       color: Colors.green.shade300.withOpacity(0.3)),
                      //     //   child: Center(
                      //     //     child: Text(
                      //     //       "Popular",
                      //     //       style: TextStyle(color: kthemeGreen),
                      //     //     ),
                      //     //   ),
                      //     // ),
                      //     const Spacer(),
                      //     CircleAvatar(
                      //       backgroundColor:
                      //           Colors.green.shade300.withOpacity(0.3),
                      //       radius: 20,
                      //       child: IconButton(
                      //           onPressed: () {},
                      //           icon: Icon(
                      //             Icons.location_on,
                      //             color: kthemeGreen,
                      //           )),
                      //     ),
                      //     kwidth10,
                      //     CircleAvatar(
                      //       backgroundColor:
                      //           Colors.red.shade300.withOpacity(0.3),
                      //       radius: 20,
                      //       child: IconButton(
                      //         onPressed: () {},
                      //         icon: const Icon(
                      //           Icons.favorite,
                      //           color: Colors.red,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              user.dishname,
                              style:
                                  TextStyle(fontFamily: fontBold, fontSize: 27),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.edit,
                                  color: kthemeGreen,
                                ))
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star_half,
                            color: kthemeGreen,
                          ),
                          kwidth5,
                          const Text(
                            "4.8 Rating",
                            style: TextStyle(color: Colors.grey),
                          ),
                          kwidth10,
                          Icon(
                            Icons.shopping_bag_rounded,
                            color: kthemeGreen,
                          ),
                          const Text(
                            "2000 + Order",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Text(
                          user.aboutdish,
                          style: TextStyle(
                            color: Colors.grey,
                            wordSpacing: 0.8,
                            letterSpacing: 0.3,
                            fontSize: 17,
                            fontFamily: fontBook,
                          ),
                        ),
                      ),
                      khight10,
                      Row(
                        children: [
                          Text(
                            "15",
                            style:
                                TextStyle(fontFamily: fontBold, fontSize: 20),
                          ),
                          Spacer(),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "View All",
                              )),
                        ],
                      ),
                      // SizedBox(
                      //   height: mwidth / 2 + 30,
                      //   width: double.infinity,
                      //   child: ListView.builder(
                      //     itemCount: 10,
                      //     shrinkWrap: true,
                      //     physics: const ScrollPhysics(),
                      //     scrollDirection: Axis.horizontal,
                      //     itemBuilder: (context, index) => Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: CustomCard(mwidth: mwidth),
                      //     ),
                      //   ),
                      // ),
                      // Spacer(),
                      // khight20,
                      // Container(
                      //   width: mwidth - 10,
                      //   height: 50,
                      //   decoration: BoxDecoration(
                      //       color: kthemeGreen,
                      //       borderRadius: BorderRadius.circular(15)),
                      //   child: Center(
                      //     child: Text(
                      //       "Add To Cart",
                      //       style:
                      //           TextStyle(fontFamily: fontBold, fontSize: 14),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}
