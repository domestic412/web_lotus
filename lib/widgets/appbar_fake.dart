

import 'package:flutter/material.dart';

import '../assets/color.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      width: double.infinity,
      color: MyColor.appbarColor,
      padding: EdgeInsets.fromLTRB(40, 5, 20, 5),
      height: 50,
      child: Image.asset('lib/assets/images/logo_appbar_web_lotus.png',),
    );
  }
}