

import 'package:flutter/material.dart';

import '../assets/color.dart';
import '../assets/style.dart';

class WidgetAppBar extends StatelessWidget implements PreferredSizeWidget  {
  @override
  Size get preferredSize => const Size.fromHeight(100);


  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 110,
      flexibleSpace: Container(
        padding: EdgeInsets.all(7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 5),
              child: Image.asset('lib/assets/images/hats_logo.png')
              ),
            Container(
              width: 500,
              // color: Colors.red,
            ),
            Container(
              alignment: Alignment.bottomLeft,
              child: InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  height: 30,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text('Booking', style: style18_black)),
              ),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              child: InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  height: 30,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text('Tracking', style: style18_black)),
              ),
            )
          ],
        ),
      ),
      // title: Image.asset('lib/assets/images/Appbar.png'),
      backgroundColor: MyColor1.appbarColor,
    );
  }
}