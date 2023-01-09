import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delevary_admin/core/consts.dart';
import 'package:food_delevary_admin/core/dbFunctions/order_screen_functions.dart';
import 'package:food_delevary_admin/infrastructure/order_modal.dart';
import 'package:food_delevary_admin/presentation/Orderpage/widget/listtile_custom.dart';
import 'package:food_delevary_admin/presentation/Widget/big_text.dart';

class CompleateScreen extends StatelessWidget {
  CompleateScreen({super.key});
  final userEmail = FirebaseAuth.instance.currentUser!.email;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: getOrderStream(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  log(snapshot.error.toString());
                  return Center(child: Text(snapshot.error.toString()));
                } else if (snapshot.hasData) {
                  final List<OrderModal> curentUserOrder = [];
                  final alldDataList = snapshot.data!;
                  final List<OrderModal> compleateList = [];

                  if (alldDataList.isEmpty) {
                    const Text("NO Order Found!!");
                  }
                  for (var order in alldDataList) {
                    if (order.hotalEmail == userEmail) {
                      curentUserOrder.add(order);
                      for (var order in curentUserOrder) {
                        if (order.isCompleated == true) {
                          compleateList.add(order);
                        }
                      }
                    }
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: compleateList.length,
                    itemBuilder: (context, index) {
                      return ListtileCardwidget(
                        trailingWidget: Text("Finished",
                            style: TextStyle(
                                fontFamily: fontBook,
                                color: Colors.green,
                                fontSize: 20)),
                        orderModal: compleateList[index],
                        mwidth: 100,
                        ontap: () {},
                      );
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
