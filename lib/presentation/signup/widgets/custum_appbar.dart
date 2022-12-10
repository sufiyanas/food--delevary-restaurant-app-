import 'package:flutter/material.dart';
import 'package:food_delevary_admin/core/consts.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      required this.textone,
      required this.texttwo,
      this.actionButton});

  final String textone;
  final String texttwo;
  final Widget? actionButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                textone,
                style: TextStyle(fontFamily: fontBold, fontSize: 30),
              ),
              khight10,
              Text(texttwo,
                  style: TextStyle(fontFamily: fontBold, fontSize: 30)),
            ],
          ),
          Spacer(),
          actionButton ?? SizedBox(),
          kwidth10
        ],
      ),
    );
  }
}
