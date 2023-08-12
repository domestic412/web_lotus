import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../assets/color.dart';
import '../../assets/style.dart';
import '../../assets/text.dart';
import '../../model/tracking.dart';
import '../../widgets/appbar.dart';
import 'alert.dart';

class TrackingScreen extends StatefulWidget {

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {

  ContTrackingAlert contTrackingAlert = ContTrackingAlert();
  Future<List<ContainerTracking>>? containerTrackings;

  TextEditingController cntrNo = TextEditingController();
  TextEditingController bkNo = TextEditingController();
  String showTextError = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColor1.normalColor,
        appBar: WidgetAppBar(),
        body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 40, bottom: 50),
                    child: const Center(
                      child: SelectableText(
                        'Container Tracking',
                        style: TextStyle(fontSize: 50, color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: MyColor1.backgroundColor,
                      borderRadius: BorderRadius.circular(7)
                    ),
                    padding:const EdgeInsets.only(top: 20, left: 50, right: 50),
                    height: 167,
                    width: 1024,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(20, 10, 30, 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  Text(' Booking / Bill Number', style: style18_black,),
                                  const SizedBox(height: 10,),
                                  TextField(
                                    controller: bkNo,
                                    decoration: const InputDecoration(
                                      hintText: 'Booking / Bill Number',
                                      border: OutlineInputBorder()
                                    ),
                                  )
                                ],),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(0, 10, 30, 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  Text(' Container Number', style: style18_black,),
                                  SizedBox(height: 10,),
                                  TextField(
                                    controller: cntrNo,
                                    decoration: const InputDecoration(
                                      hintText: 'Container Number',
                                      border: OutlineInputBorder()
                                    ),
                                  )
                                ],),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(''),
                                    SizedBox(height: 15,),
                                    InkWell(
                                      onTap: () {
                                    setState(() {
                                    containerTrackings = fetchContainerTracking(cntrNo.text, bkNo.text);
                                });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(255, 76, 100, 206),
                                          borderRadius: BorderRadius.circular(10)
                                        ),
                                        height: 50,
                                        width: 120,
                                        child: Center(child: Text('Search', style: style18_white,)),
                                      ),
                                    )
                                ],),
                              ),
                            )
                        ],),
                        SizedBox(height: 5),
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(showTextError, style: style20_red,),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(30),
                    width: 1024,
                    decoration: BoxDecoration(
                      color: MyColor1.backgroundColor,
                      borderRadius: BorderRadius.circular(7)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Details', style: style32_black,),
                        // Divider(),
                        SizedBox(
                          height: 30,
                        ),
                        buildDataTracking()
                      ],
                    ),
                  ),
                  Container(height: 40,)
                ],
              ),
            )));
  }

  Future<List<ContainerTracking>> fetchContainerTracking(String cntrNo, String bkNo) async {
    var url = 'http://222.252.166.214:6505/api/Tracking?BookingNo=$bkNo&CntrNo=$cntrNo';
    if (bkNo.isNotEmpty) {
      final response = await http.get(Uri.parse(url),
          headers: {
            "Access-Control-Allow-Origin": "*",
            "Access-Control-Allow-Methods": "POST, GET",
          }
          );
        print(response.statusCode);
      if (response.statusCode == 200) {
        var body = response.body;
        print(body);
        if (body == '[]') {
          if (cntrNo.isEmpty) {
            setState(() {
              showTextError = errorInput;
            });
          } else {
            setState(() {
              showTextError = error2Input;
            });
          };
        } else {
          setState(() {
            showTextError = '';
          });
        }
          List dataCntrTracking = jsonDecode(body);
          return dataCntrTracking.map((data) => ContainerTracking.fromJson(data)).toList();
        } else {
          throw Exception('Error');
        }
    } else {
      setState(() {
        showTextError = errorInput;
      });
      throw Exception('Failed to load');
    }
  }

  FutureBuilder<List<ContainerTracking>> buildDataTracking() {
  return FutureBuilder<List<ContainerTracking>> (
    future: containerTrackings,
    builder:(context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(
        child: CircularProgressIndicator()
        );}
      else if (snapshot.hasData & (snapshot.data != [])) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              children: <Widget> [
                DataTable(
                  // columnSpacing: 10,
                  columns: [
                          DataColumn(
                            label: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Number", style: style13_black),
                            ],
                            ),
                          ),
                          DataColumn(
                            label: Expanded(child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Container', style: style13_black),
                              ],
                            )),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Size", style: style13_black),
                              ],
                            )),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Vessel", style: style13_black),
                              ],
                            )),
                          ),
                          DataColumn(
                            label: Expanded(child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Voyage', style: style13_black),
                              ],
                            )),
                          ),
                          DataColumn(
                            label: Expanded(child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Depot', style: style13_black),
                              ],
                            )),
                          ),
                          DataColumn(
                            label: Expanded(child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Status', style: style13_black),  //logstatus
                              ],
                            )),
                          ),
                          DataColumn(
                            label: Expanded(child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Update', style: style13_black),
                              ],
                            )),
                          ),
                        ], 
                        rows: List.generate(snapshot.data!.length, (index) {
                          var data = snapshot.data![index];
                          if (data.logStatus == 'MIA') {
                            detailStatus = 'EMPTY IN AVAILABLE';
                          } else if (data.logStatus == 'MOS') {
                            detailStatus = 'EMPTY OUT SHIPPER';
                          } else if (data.logStatus == 'MOS') {
                            detailStatus = 'EMPTY OUT SHIPPER';
                          } else if (data.logStatus == 'FEX') {
                            detailStatus = 'FULL EXPORT VESSEL';
                          } else if (data.logStatus == 'MOB') {
                            detailStatus = 'EMPTY ON BOARD';
                          } else if (data.logStatus == 'FOB') {
                            detailStatus = 'FULL ON BOARD';
                          } else if (data.logStatus == 'FIM') {
                            detailStatus = 'FULL IMPORT VESSEL';
                          } else if (data.logStatus == 'FOS') {
                            detailStatus = 'FULL OUT SHIPPER';
                          } else {
                            detailStatus = '#';
                          }
                          
                          if (data.vessel == 'HAW') {
                            detailVessel = 'HAIAN WEST';
                          } else if (data.vessel == 'HAM') {
                            detailVessel = 'HAIAN MIND';
                          } else if (data.vessel == 'HAV') {
                            detailVessel = 'HAIAN VIEW';
                          } else if (data.vessel == 'HAE') {
                            detailVessel = 'HAIAN EAST';
                          } else if (data.vessel == 'HAB') {
                            detailVessel = 'HAIAN BELL';
                          } else if (data.vessel == 'HAL') {
                            detailVessel = 'HAIAN LINK';
                          } else if (data.vessel == 'HAP') {
                            detailVessel = 'HAIAN PARK';
                          } else if (data.vessel == 'HAT') {
                            detailVessel = 'HAIAN TIME';
                          } else if (data.vessel == 'HAC') {
                            detailVessel = 'HAIAN CITY';
                          } else if (data.vessel == 'HAR') {
                            detailVessel = 'HAIAN ROSE';
                          } else if (data.vessel == 'ABB') {
                            detailVessel = 'ANBIEN BAY';
                          } else if (data.vessel == null) {
                            detailVessel = '';
                          } else {
                            detailVessel = '#';
                          }

                          if (data.voyage == null) {
                            detailVoyage = '';
                          } else {
                            detailVoyage = data.voyage.toString();
                          }
                          return DataRow(cells: [
                            DataCell(
                              Center(
                                child: Text((index+1).toString(), style: style12_black,))),
                            DataCell(
                              Center(
                                child: Text(data.container.toString(), style: style12_black,))),
                            DataCell(
                              Text(data.size.toString(), style: style12_black,)),
                            DataCell(
                              Text(detailVessel, style: style12_black,)),
                            DataCell(
                              Text('$detailVoyage', style: style12_black,)),
                            DataCell(
                              Center(
                                child: Text(data.depot.toString(), style: style12_black,))),
                            DataCell(
                              Text(detailStatus, style: style12_green,)),
                            DataCell(
                              Center(
                                child: Text(data.logDate.toString().substring(0, 10), style: style12_black))),
                          ]);
                        })
                        ),
                        ]
            ),
          ),
        );
      }
      return Text('');
  }
  ,);}
}
