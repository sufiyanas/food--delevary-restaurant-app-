import 'package:flutter/material.dart';
import 'package:food_delevary_admin/core/consts.dart';
import 'package:food_delevary_admin/presentation/signup/widgets/custom_back_icon.dart';
import 'package:food_delevary_admin/presentation/signup/widgets/custum_appbar.dart';

class LoginpageTitle extends StatelessWidget {
  const LoginpageTitle({
    Key? key,
    required this.appbartitle1,
    required this.appbartitle2,
  }) : super(key: key);
  final String appbartitle1;
  final String appbartitle2;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: CustomBackIcon(),
        ),
        khight10,
        CustomAppBar(textone: appbartitle1, texttwo: appbartitle2),
        khight10,
        Text("This data will be displayed on user ",
            style: TextStyle(fontFamily: fontBook, fontSize: 15)),
        khight10,
        Text("application",
            style: TextStyle(fontFamily: fontBook, fontSize: 15))
      ],
    );
  }
}
