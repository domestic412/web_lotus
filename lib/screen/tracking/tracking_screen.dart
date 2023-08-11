import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../assets/color.dart';
import '../../assets/style.dart';
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
  String fullStatus = '';

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
                    padding: const EdgeInsets.only(top: 50, bottom: 70),
                    child: const Center(
                      child: Text(
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
                    padding:const EdgeInsets.only(top: 20),
                    height: 200,
                    width: 1024,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(50, 10, 30, 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  Text(' Container Number', style: style1,),
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
                              flex: 2,
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(20, 10, 30, 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  Text(' Booking / Bill Number', style: style1,),
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
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(30, 10, 10, 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(''),
                                    SizedBox(height: 15,),
                                    InkWell(
                                      onTap: () {
                                        fetchContainerTracking(cntrNo.text, bkNo.text);
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
                                        child: Center(child: Text('Search', style: style2,)),
                                      ),
                                    )
                                ],),
                              ),
                            )
                        ],),
                      ],
                    ),
                  ),
                  Container(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(30),
                    // height: 1000,
                    width: 1024,
                    decoration: BoxDecoration(
                      color: MyColor1.backgroundColor,
                      borderRadius: BorderRadius.circular(7)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Details', style: style10,),
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
    // final url = 'https://14.161.21.84:2214/TrackingContainer?BookingNo=$bkNo';
    // if (cntrNo.isNotEmpty && bkNo.isNotEmpty) {
      // EasyLoading.show(
      //   status: 'Loading...',
      //   maskType: EasyLoadingMaskType.black,
      //   dismissOnTap: true,
      //   );
    if (bkNo.isNotEmpty) {
      final response = await http.get(Uri.parse(url),
          headers: {
            "Access-Control-Allow-Origin": "*",
            "Access-Control-Allow-Methods": "POST, GET",
          }
          );
        print(response.statusCode);
      if (response.statusCode == 200) {
        // EasyLoading.dismiss();
        var body = response.body;
        print(body);
        List dataCntrTracking = jsonDecode(body);
        return dataCntrTracking.map((data) => ContainerTracking.fromJson(data)).toList();
        } else {
          // EasyLoading.dismiss();
          contTrackingAlert.showContTrackingAlert(context);
          throw Exception('Error');
        }
    } else {
      // EasyLoading.dismiss();
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
      else if (snapshot.hasData) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              children: <Widget> [
                DataTable(
                  // columnSpacing: 10,
                  columns: [
                          DataColumn(
                            label: Expanded(
                              flex: 1,
                              child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Number", style: style11),
                              ],
                            )),
                          ),
                          DataColumn(
                            label: Expanded(child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Container', style: style11),
                              ],
                            )),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Vessel", style: style11),
                              ],
                            )),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Voyage", style: style11),
                              ],
                            )),
                          ),
                          DataColumn(
                            label: Expanded(child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Size', style: style11),
                              ],
                            )),
                          ),
                          DataColumn(
                            label: Expanded(child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Depot', style: style11),
                              ],
                            )),
                          ),
                          DataColumn(
                            label: Expanded(child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Status', style: style11),  //logstatus
                              ],
                            )),
                          ),
                          DataColumn(
                            label: Expanded(child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Update', style: style11),
                              ],
                            )),
                          ),
                          DataColumn(
                            label: Expanded(child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Remark', style: style11),
                              ],
                            )),
                          ),
                        ], 
                        rows: List.generate(snapshot.data!.length, (index) {
                          var data = snapshot.data![index];
                          if (data.logStatus == 'MIA') {
                            fullStatus = 'EMPTY IN AVAILABLE';
                          } else if (data.logStatus == 'MOS') {
                            fullStatus = 'EMPTY OUT SHIPPER';
                          } else if (data.logStatus == 'MOS') {
                            fullStatus = 'EMPTY OUT SHIPPER';
                          } else if (data.logStatus == 'FEX') {
                            fullStatus = 'FULL EXPORT VESSEL';
                          } else if (data.logStatus == 'MOB') {
                            fullStatus = 'EMPTY ON BOARD';
                          } else if (data.logStatus == 'FOB') {
                            fullStatus = ' FULL ON BOARD';
                          } else if (data.logStatus == 'FIM') {
                            fullStatus = ' FULL IMPORT VESSEL';
                          } else if (data.logStatus == 'FOS') {
                            fullStatus = ' FULL OUT SHIPPER';
                          } else {
                            fullStatus = '';
                          }
                          return DataRow(cells: [
                            DataCell(
                              Container(
                                child: Center(
                                  child: Text((index+1).toString(), style: style11,)))),
                            DataCell(
                              Container(
                                child: Center(
                                  child: Text(data.container.toString(), style: style11,)))),
                            DataCell(
                              Container(
                                child: Center(
                                  child: Text(data.size.toString(), style: style11,)))),
                            DataCell(
                              Container(
                                child: Center(
                                  child: Text(data.vessel.toString(), style: style11,)))),
                            DataCell(
                              Container(
                                child: Center(
                                  child: Text(data.voyage.toString(), style: style11,)))),
                            DataCell(
                              Container(
                                child: Center(
                                  child: Text(data.depot.toString(), style: style11,)))),
                            DataCell(
                              Container(
                                child: Center(
                                  child: Text(fullStatus, style: style11,)))),
                            DataCell(
                              Container(
                                child: Center(
                                  child: Text(data.logDate.toString().substring(0, 10), style: style11,)),
                              )),
                            DataCell(
                              Container(
                                child: Center(
                                  child: Text(data.remark.toString(), style: style11,)),
                              )),
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



  

  
