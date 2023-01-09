import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delevary_admin/core/dbFunctions/notification_functions.dart';
import 'package:food_delevary_admin/infrastructure/order_modal.dart';
import 'package:food_delevary_admin/presentation/notificationscreen/widgets/notification_tile.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});
  final currentUserEmail = FirebaseAuth.instance.currentUser!.email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Column(
        children: [
          const Text("06 Dec 2022"),
          Expanded(
            child: StreamBuilder(
              stream: getOrderStream(userEmail: currentUserEmail!),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text("Somthing went wrong"),
                  );
                } else if (snapshot.hasData) {
                  final orderList = snapshot.data;

                  if (orderList!.isEmpty) {
                    return Center(
                      child: Text("The List is empty"),
                    );
                  } else {
                    List<OrderModal> processingList = [];

                    for (var order in orderList) {
                      if (order.hotalEmail == currentUserEmail) {
                        if (order.trackOrder == 0) {
                          processingList.add(order);
                        }
                      }
                    }

                    return (processingList.isEmpty)
                        ? Center(
                            child: Text("The List is empty"),
                          )
                        : ListView.builder(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: processingList.length,
                            itemBuilder: (context, index) {
                              final item = processingList[index];
                              return notificationTileWidget(
                                hotalEmail: currentUserEmail!,
                                order: item,
                              );
                            },
                          );
                  }
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
