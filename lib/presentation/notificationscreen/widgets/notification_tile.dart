import 'package:flutter/material.dart';
import 'package:food_delevary_admin/core/dbFunctions/notification_functions.dart';
import 'package:food_delevary_admin/infrastructure/order_modal.dart';

class notificationTileWidget extends StatelessWidget {
  const notificationTileWidget(
      {Key? key, required this.order, required this.hotalEmail})
      : super(key: key);
  final OrderModal order;
  final String hotalEmail;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(order.imageURL),
      ),
      title: Text(order.dishname),
      subtitle: Text("New order"),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed: () {
                allowOrder(hotalEmail: hotalEmail, order: order);
              },
              icon: Icon(
                Icons.done,
                color: Colors.green,
              )),
          IconButton(
              onPressed: () {
                cancelOrder(hotalEmail: hotalEmail, order: order);
              },
              icon: Icon(
                Icons.close,
                color: Colors.red,
              )),
        ],
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  AppBarWidget({Key? key})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "Notification ",
        style: TextStyle(fontSize: 20),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.of(context).pop(),
      ),
      automaticallyImplyLeading: true,
    );
  }
}
