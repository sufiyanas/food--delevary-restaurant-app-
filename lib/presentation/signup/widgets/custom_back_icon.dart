import 'package:flutter/material.dart';

class CustomBackIcon extends StatelessWidget {
  const CustomBackIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.brown.shade600.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15)),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.orange,
        ),
      ),
    );
  }
}
