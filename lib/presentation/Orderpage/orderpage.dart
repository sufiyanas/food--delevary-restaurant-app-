import 'package:flutter/material.dart';
import 'package:food_delevary_admin/presentation/Orderpage/complete_screen.dart';
import 'package:food_delevary_admin/presentation/Orderpage/order_screen.dart';

class OrderPage extends StatelessWidget {
  OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mwidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("My Orders"),
          bottom: const TabBar(indicatorColor: Colors.green, tabs: [
            Tab(
              text: "Order",
            ),
            Tab(
              text: "Complete",
            ),
          ]),
        ),
        body: TabBarView(children: [OrderScreen(), CompleateScreen()]),
      ),
    );
  }
}
