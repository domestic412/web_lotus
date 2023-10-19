
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../assets/color.dart';

Color color_vn = MyColor.normalColor;          //Lang EN
Color color_text_vn = Colors.white;
Color color_en = MyColor.backgroundColor;
Color color_text_en = MyColor.normalColor;
bool bool_lang = false;

// Color color_en = MyColor.normalColor;           //Lang VN
// Color color_text_en = Colors.white;
// Color color_vn = MyColor.backgroundColor;
// Color color_text_vn = MyColor.normalColor;
// bool bool_lang = true;

class AppbarWidget extends StatefulWidget {
  // Function updateLanguage;
  // AppbarWidget(this.updateLanguage);

  @override
  State<AppbarWidget> createState() => _AppbarWidgetState();
}


class _AppbarWidgetState extends State<AppbarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      color: MyColor.normalColor,
      // padding: EdgeInsets.fromLTRB(40, 5, 20, 0),
      padding: EdgeInsets.only(top: 5),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            width: MediaQuery.of(context).size.width/2,
            padding: EdgeInsets.only(bottom: 5, left: 40),
            child: Image.asset('lib/assets/images/logo_white_appbar_web_lotus.png',)),
          Container(
            width: MediaQuery.of(context).size.width/2,
            padding: EdgeInsets.only(right: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      context.setLocale(Locale('vi','VN'));
                      color_vn = MyColor.backgroundColor;
                      color_text_vn = MyColor.normalColor;
                      color_en = MyColor.normalColor;
                      color_text_en = Colors.white;
                      bool_lang = true;
                      // this.widget.updateLanguage();
                    });
                  },
                  child: Container(
                    height: 30,
                    width: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                      color: color_vn,
                    ),
                    child: Text('VN', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: color_text_vn), textAlign: TextAlign.center,),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      context.setLocale(Locale('en', 'EN'));
                      color_en = MyColor.backgroundColor;
                      color_text_en = MyColor.normalColor;
                      color_vn = MyColor.normalColor;
                      color_text_vn = Colors.white;
                      bool_lang = false;
                      // this.widget.updateLanguage();
                    });
                  },
                  child: Container(
                    height: 30,
                    width: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                      color: color_en,
                    ),
                    child: Text('EN', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: color_text_en), textAlign: TextAlign.center,),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}