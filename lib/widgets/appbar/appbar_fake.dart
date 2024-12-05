import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_lotus/assets/color.dart';
import 'package:web_lotus/assets/text.dart';
import 'package:web_lotus/assets/variable.dart';
import 'package:web_lotus/controller/divider_controller.dart';
import 'package:web_lotus/controller/info_signin_controller.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/model/model_init_quote.dart';
import 'package:web_lotus/screen/eqc/add_quote_new/add_edit_quote.dart';
import 'package:web_lotus/screen/eqc/list_eqc/listEQC_page.dart';
import 'package:web_lotus/screen/eqc/repair_complete/list_repair_complete_page.dart';
import 'package:web_lotus/screen/signin/signin_page.dart';
import 'package:web_lotus/screen/tracking/tracking_page.dart';

import 'check_login_appbar.dart';

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
    checkInfoUser();
    return Stack(children: [
      Container(
        // alignment: Alignment.center,
        width: double.infinity,
        color: MyColor.haian,
        // padding: EdgeInsets.fromLTRB(40, 5, 20, 0),
        padding: EdgeInsets.only(top: 5),
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.only(bottom: 5, left: 40),
                  child: Image.asset(
                    'lib/assets/images/logo_white_appbar_web_lotus.png',
                  )),
            ),
            Expanded(
              flex: 7,
              child: Container(
                // width: MediaQuery.of(context).size.width / 2,
                padding: EdgeInsets.only(right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        inforUserController.userName.value != ''
                            ? Row(
                                children: [
                                  Text(
                                    inforUserController.userName.value,
                                    style: TextStyle(color: white),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      box.remove(userName_signin);
                                      inforUserController.resetInfoController();
                                      Get.to(() => TrackingPage());
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
                                  Get.to(() => SignInPage());
                                },
                                child: SizedBox(
                                  height: 25,
                                  child: Text(
                                    'signin'.tr,
                                    // style: style14_white,
                                    style: TextStyle(color: white),
                                  ),
                                ),
                              ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
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
      ),
      MenuBar(),
    ]);
  }
}

class MenuBar extends StatefulWidget {
  MenuBar({super.key});

  @override
  State<MenuBar> createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {
  Color? colorDividerTracking;

  Color? colorDividerQuote;

  Color? colorDividerQuoteList;

  Color? colorDividerDraft;

  Color? colorDividerApproved;

  Color? colorDividerComplete;

  @override
  Widget build(BuildContext context) {
    switch (dividerController.dividerPage.value) {
      case 'Tracking':
        colorDividerTracking = white;
        colorDividerQuote = haian;
      case 'Quote':
        {
          colorDividerTracking = haian;
          colorDividerQuote = white;
          switch (dividerController.dividerCompQuote.value) {
            case 'QuoteList':
              colorDividerQuoteList = white;
              colorDividerDraft = haian;
              colorDividerApproved = haian;
              colorDividerComplete = haian;
            case 'Draft':
              colorDividerQuoteList = haian;
              colorDividerDraft = white;
              colorDividerApproved = haian;
              colorDividerComplete = haian;
            case 'Approved':
              colorDividerQuoteList = haian;
              colorDividerDraft = haian;
              colorDividerApproved = white;
              colorDividerComplete = haian;
            case 'Complete':
              colorDividerQuoteList = haian;
              colorDividerDraft = haian;
              colorDividerApproved = haian;
              colorDividerComplete = white;
          }
        }
    }
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  dividerController.dividerPage.value = 'Tracking';
                  Get.to(() => TrackingPage());
                },
                child: Column(
                  children: [
                    Text(
                      'Tracking',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 90,
                      child: Divider(
                        thickness: 2,
                        color: colorDividerTracking,
                      ),
                    )
                  ],
                ),
              ),
              // SizedBox(width: 10),
              PopupMenuButton(
                child: Column(
                  children: [
                    Text(
                      'Quote',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 90,
                      child: Divider(
                        thickness: 2,
                        color: colorDividerQuote,
                      ),
                    )
                  ],
                ),
                itemBuilder: (BuildContext context) {
                  return listQuote
                      .map((e) => PopupMenuItem(child: Text(e), value: e))
                      .toList();
                },
                onSelected: (value) {
                  quoteController.listDetails.clear();
                  dividerController.dividerPage.value = 'Quote';
                  if (inforUserController.userName.value == '') {
                    Get.to(() => SignInPage());
                  } else {
                    switch (value) {
                      case 'Create Quote':
                        quoteController.listInputQuoteDetail.value = [];
                        quoteController.listInputQuoteDetail_show.value = [];
                        InitEQCQuote().fetchInitQuote(eqcQuoteId_new);
                        Get.to(() => AEQuotePage());
                      case 'Management EQC':
                        Get.to(() => ListEQCPage());
                      case 'Repair Complete':
                        Get.to(() => ListRepairCompletePage());
                    }
                  }
                },
              ),
              // ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: haian,
              //       elevation: 0.0,
              //     ),
              //     onPressed: () {
              //       dividerController.dividerPage.value = 'Quote';
              //       switch (inforUserController.userName.value) {
              //         case '':
              //           Get.to(() => SignInPage());
              //           break;
              //         default:
              //           Get.to(() => ListEQCPage());
              //           break;
              //       }
              //     },
              //     child: Column(
              //       children: [
              //         Container(
              //             padding: EdgeInsets.only(top: 10),
              //             child: Text(
              //               'Quote',
              //               style: TextStyle(color: Colors.white),
              //             )),
              //         SizedBox(
              //           width: 90,
              //           child: Divider(
              //             thickness: 2,
              //             color: colorDividerQuote,
              //           ),
              //         ),
              //       ],
              //     )),
            ],
          ),
          // dividerController.dividerPage.value == 'Quote'
          //     ? FittedBox(
          //         child: Container(
          //           // padding: EdgeInsets.all(2),
          //           decoration: BoxDecoration(
          //               color: haian,
          //               borderRadius: BorderRadius.only(
          //                   bottomLeft: Radius.circular(5),
          //                   bottomRight: Radius.circular(5))),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               ElevatedButton(
          //                 style: ElevatedButton.styleFrom(
          //                   backgroundColor: haian,
          //                   elevation: 0.0,
          //                 ),
          //                 onPressed: () {
          //                   setState(() {
          //                     dividerController.dividerCompQuote.value =
          //                         'QuoteList';
          //                   });
          //                 },
          //                 child: Column(
          //                   children: [
          //                     Text(
          //                       'Quote List',
          //                       style: style11_white,
          //                     ),
          //                     SizedBox(
          //                       height: 5,
          //                     ),
          //                     SizedBox(
          //                       width: 80,
          //                       child: Divider(
          //                         height: 0,
          //                         indent: 0,
          //                         thickness: 2,
          //                         color: colorDividerQuoteList,
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //               ElevatedButton(
          //                 style: ElevatedButton.styleFrom(
          //                   backgroundColor: haian,
          //                   elevation: 0.0,
          //                 ),
          //                 onPressed: () {
          //                   setState(() {
          //                     dividerController.dividerCompQuote.value =
          //                         'Draft';
          //                   });
          //                 },
          //                 child: Column(
          //                   children: [
          //                     Text(
          //                       'Draft',
          //                       style: style11_white,
          //                     ),
          //                     SizedBox(
          //                       height: 5,
          //                     ),
          //                     SizedBox(
          //                       width: 80,
          //                       child: Divider(
          //                         height: 0,
          //                         indent: 0,
          //                         thickness: 2,
          //                         color: colorDividerDraft,
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //               ElevatedButton(
          //                 style: ElevatedButton.styleFrom(
          //                   backgroundColor: haian,
          //                   elevation: 0.0,
          //                 ),
          //                 onPressed: () {
          //                   setState(() {
          //                     dividerController.dividerCompQuote.value =
          //                         'Approved';
          //                   });
          //                 },
          //                 child: Column(
          //                   children: [
          //                     Text(
          //                       'Approved',
          //                       style: style11_white,
          //                     ),
          //                     SizedBox(
          //                       height: 5,
          //                     ),
          //                     SizedBox(
          //                       width: 80,
          //                       child: Divider(
          //                         height: 0,
          //                         indent: 0,
          //                         thickness: 2,
          //                         color: colorDividerApproved,
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //               ElevatedButton(
          //                 style: ElevatedButton.styleFrom(
          //                   backgroundColor: haian,
          //                   elevation: 0.0,
          //                 ),
          //                 onPressed: () {
          //                   setState(() {
          //                     dividerController.dividerCompQuote.value =
          //                         'Complete';
          //                   });
          //                 },
          //                 child: Column(
          //                   children: [
          //                     Text(
          //                       'Complete',
          //                       style: style11_white,
          //                     ),
          //                     SizedBox(
          //                       height: 5,
          //                     ),
          //                     SizedBox(
          //                       width: 80,
          //                       child: Divider(
          //                         height: 0,
          //                         indent: 0,
          //                         thickness: 2,
          //                         color: colorDividerComplete,
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       )
          //     : SizedBox()
        ],
      ),
    );
  }
}
