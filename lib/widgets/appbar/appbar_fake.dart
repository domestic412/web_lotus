import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_lotus/assets/color.dart';
import 'package:web_lotus/assets/variable.dart';
import 'package:web_lotus/controller/info_signin_controller.dart';
import 'package:web_lotus/screen/signin/signin_page.dart';
import 'package:web_lotus/screen/tracking/tracking_page.dart';

Color color_vn = MyColor.haian; //Lang EN
Color color_text_vn = Colors.white;
Color color_en = MyColor.backgroundColor;
Color color_text_en = MyColor.haian;
bool bool_lang = false;

// Color color_en = MyColor.haian;           //Lang VN
// Color color_text_en = Colors.white;
// Color color_vn = MyColor.backgroundColor;
// Color color_text_vn = MyColor.haian;
// bool bool_lang = true;

class AppbarWidget extends StatefulWidget {
  @override
  State<AppbarWidget> createState() => _AppbarWidgetState();
}

class _AppbarWidgetState extends State<AppbarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      color: MyColor.haian,
      // padding: EdgeInsets.fromLTRB(40, 5, 20, 0),
      padding: EdgeInsets.only(top: 5),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
                alignment: Alignment.bottomLeft,
                // width: MediaQuery.of(context).size.width / 2,
                padding: EdgeInsets.only(bottom: 5, left: 40),
                child: Image.asset(
                  'lib/assets/images/logo_white_appbar_web_lotus.png',
                )),
          ),
          Expanded(
            child: Container(
              // width: MediaQuery.of(context).size.width / 2,
              padding: EdgeInsets.only(right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      inforUserController.shipperName.value != ''
                          ? Row(
                              children: [
                                Container(
                                  width: 250,
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    inforUserController.shipperName.value,
                                    style: TextStyle(color: white),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                IconButton(
                                  onPressed: () {
                                    box.remove(shipperName_signin);
                                    inforUserController.resetInfoController();
                                    Get.to(TrackingPage());
                                    // controller.selectWidget.value = dashboard;
                                    // setState(() {});
                                  },
                                  icon: Icon(
                                    Icons.logout,
                                    color: white,
                                  ),
                                )
                              ],
                            )
                          : InkWell(
                              onTap: () {
                                Get.to(SignInPage());
                              },
                              child: Container(
                                  width: 70,
                                  child: Text(
                                    'signin'.tr,
                                    // style: style14_white,
                                    style: TextStyle(color: white),
                                  )),
                            ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        // context.setLocale(Locale('vi', 'VN'));
                        var locale = Locale('vi', 'VN');
                        Get.updateLocale(locale);
                        color_vn = MyColor.backgroundColor;
                        color_text_vn = MyColor.haian;
                        color_en = MyColor.haian;
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
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5)),
                        color: color_vn,
                      ),
                      child: Text(
                        'VN',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: color_text_vn),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        // context.setLocale(Locale('en', 'EN'));
                        var locale = Locale('en', 'US');
                        Get.updateLocale(locale);
                        color_en = MyColor.backgroundColor;
                        color_text_en = MyColor.haian;
                        color_vn = MyColor.haian;
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
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5)),
                        color: color_en,
                      ),
                      child: Text(
                        'EN',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: color_text_en),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
