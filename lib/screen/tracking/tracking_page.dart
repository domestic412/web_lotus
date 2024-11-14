import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:web_lotus/assets/color.dart';
import 'package:web_lotus/assets/style.dart';
import 'package:http/http.dart' as http;
import 'package:web_lotus/assets/text.dart';
import 'package:web_lotus/assets/variable.dart';
import 'package:web_lotus/fetchdata/data_booking.dart';
import 'package:web_lotus/model/model_tracking.dart';
import 'package:web_lotus/widgets/appbar/appbar_fake.dart';
import 'package:web_lotus/widgets/combobox.dart';
import 'package:web_lotus/widgets/footer.dart';

class TrackingPage extends StatefulWidget {
  const TrackingPage({super.key});

  @override
  State<TrackingPage> createState() => _TrackingPageState();
}

TextEditingController input = TextEditingController();
final ScrollController horizontalScroll = ScrollController();
double width_20 = 20;

class _TrackingPageState extends State<TrackingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.backgroundColor,
      bottomSheet: Footer(),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppbarWidget(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 40),
                  decoration: BoxDecoration(
                      color: MyColor.contentColor,
                      borderRadius: BorderRadius.circular(10)),
                  width: 1004,
                  // constraints: BoxConstraints(minWidth: 1004, maxWidth: 1400),
                  // width: FWidth,
                  padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SelectableText(
                        'containerTracking'.tr,
                        style: style20_blue,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: MyColor.haian,
                        height: 1,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const DropdownButtonExample(),
                            const SizedBox(width: 20),
                            Container(
                              height: 40,
                              width: 500,
                              child: TextField(
                                  controller: input,
                                  style: style15_black,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder())),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  containerTracking = fetchContainerTracking(
                                      input.text.toUpperCase());
                                  bool_data_container = false;
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 40,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: MyColor.haian),
                                child: Text(
                                  'search'.tr,
                                  style: style15_white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: SelectableText(
                          'note'.tr,
                          style: style13_black,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Data_Booking(updateDataContainer),
                      // Container(
                      //   child: bool_data_container ? Data_Container() : null,
                      // )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<ContainerTracking> fetchContainerTracking(String inputt) async {
    String str = inputt.trim().tr;
    final url_bk_en = '$SERVER/Tracking?BookingNo=$str&CntrNo=';
    final url_cntr_en = '$SERVER/Tracking?BookingNo=&CntrNo=$str';
    String? url;
    if (selectedValue == 'bk') {
      setState(() {
        url = url_bk_en;
      });
    } else {
      setState(() {
        url = url_cntr_en;
      });
    }
    final response = await http.get(
      Uri.parse(url!),
      headers: {
        // "Content-Type": "application/json",
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Methods": "GET", //use fot http, not use https
      },
    );

    print(response.statusCode);

    if (response.statusCode == 200) {
      var body = response.body;
      if (body == '[]') {
        return throw Exception();
      }
      var dataCntrTracking = jsonDecode(body);
      return ContainerTracking.fromJson(dataCntrTracking);
    } else {
      print('Error');
      throw Exception('Error');
    }
  }

  void updateDataContainer() {
    setState(() {
      bool_data_container = true;
    });
  }
}
