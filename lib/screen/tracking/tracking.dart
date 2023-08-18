import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_lotus/assets/color.dart';
import 'package:web_lotus/assets/style.dart';
import 'package:http/http.dart' as http;

import '../../model/model_tracking.dart';
import '../../widgets/appbar_fake.dart';
import '../../widgets/combobox.dart';
import '../../fetchdata/data_container.dart';

class Tracking extends StatefulWidget {
  const Tracking({super.key});

  @override
  State<Tracking> createState() => _TrackingState();
}

TextEditingController input = TextEditingController();

class _TrackingState extends State<Tracking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppbarWidget(),
              // const SizedBox(
              //   height: 10,
              // ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: MyColor.contentColor, 
                    borderRadius: BorderRadius.circular(10)
                  ),
                  // height: 720,
                  width: 1024,
                  padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Container Tracking', style: style20_blue,),
                      const SizedBox(height: 10,),
                      const Divider(
                        color: MyColor.normalColor,
                        height: 1,
                      ),
                      const SizedBox(height: 10,),
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
                                decoration:const InputDecoration(
                                  border: OutlineInputBorder()
                                )
                              ),
                            ),
                            const SizedBox(width: 20,),
                            InkWell(
                              onTap: () {
                                setState(() {
                                    containerTracking1 = fetchContainerTracking1(input.text);
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 40,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: MyColor.normalColor
                                ),
                                child: Text('Search', style: style15_white,),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Text('Our system does not accept House BL number assigned by NVOCC or Freight Forwarder.', style: style13_black,),
                      ),
                      SizedBox(height: 30,),
                      dataTrucking(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ))
    );
  }

  Future<ContainerTracking> fetchContainerTracking1(String inputt) async {
  final url_bk = 'http://222.252.166.214:6505/api/Tracking?BookingNo=$inputt';
  final url_cntr = 'http://222.252.166.214:6505/api/Tracking?BookingNo=&CntrNo=$inputt';
  var url = url_bk;

  if (selectedValue == 'bk') {
    setState(() {
      url = url_bk;
    });
  } else {
    setState(() {
      url = url_cntr;
    });
  }

  final response = await http.get(
    Uri.parse(url),
    headers: {
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
}


