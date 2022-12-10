import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Column(
        children: const [
          Text("06 Dec 2022"),
          notificationTileWidget(),
          notificationTileWidget(),
          notificationTileWidget()
        ],
      ),
    );
  }
}

class notificationTileWidget extends StatelessWidget {
  const notificationTileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(),
      title: Text("Order"),
      subtitle: Text("New order placed"),
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
