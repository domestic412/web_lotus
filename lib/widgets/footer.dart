
import 'package:flutter/material.dart';

import '../assets/color.dart';

class Footer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      color: MyColor.footerColor,
      padding: EdgeInsets.fromLTRB(40, 5, 20, 5),
      height: 40,
      child: Text('Copyright 2023 © LOTUS LINK', style: TextStyle(color: Colors.white), ),
    );
  }
}