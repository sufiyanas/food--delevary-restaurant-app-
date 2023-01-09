import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delevary_admin/core/dbFunctions/order_screen_functions.dart';
import 'package:food_delevary_admin/infrastructure/order_modal.dart';
import 'package:food_delevary_admin/presentation/Orderpage/widget/listtile_custom.dart';
import 'package:food_delevary_admin/presentation/Widget/big_text.dart';
import 'package:food_delevary_admin/presentation/Widget/material_button.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({super.key});
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
                  final List<OrderModal> activeList = [];

                  if (activeList.isEmpty) {
                    const Text("NO Order Found!!");
                  }
                  for (var order in alldDataList) {
                    if (order.hotalEmail == userEmail) {
                      curentUserOrder.add(order);
                      for (var order in curentUserOrder) {
                        if (order.trackOrder == 1) {
                          activeList.add(order);
                        }
                      }
                    }
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: activeList.length,
                    itemBuilder: (context, index) {
                      return ListtileCardwidget(
                        trailingWidget: CutomMaterialButton(
                          onpressed: () {
                            updateOrderComplete(orderModal: activeList[index]);
                          },
                          text: "Finished",
                          width: 50,
                          height: 40,
                          borderRadius: 20,
                        ),
                        orderModal: activeList[index],
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
