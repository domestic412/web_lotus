// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// import '../../assets/color.dart';
// import '../../assets/style.dart';
// import '../../assets/text.dart';
// import '../../model/tracking.dart';
// import '../../widgets/appbar.dart';
// import 'alert.dart';

// class TrackingScreen extends StatefulWidget {

//   @override
//   State<TrackingScreen> createState() => _TrackingScreenState();
// }

// class _TrackingScreenState extends State<TrackingScreen> {

//   ContTrackingAlert contTrackingAlert = ContTrackingAlert();
//   Future<List<ContainerTracking>>? containerTrackings;

//   TextEditingController cntrNo = TextEditingController();
//   TextEditingController bkNo = TextEditingController();
//   String showTextError = '';
//   Color color_data = MyColor.dataColor;
//   bool bool_data = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: MyColor.normalColor,
//         appBar: WidgetAppBar(),
//         body: SafeArea(
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.only(top: 40, bottom: 50),
//                     child: const Center(
//                       child: SelectableText(
//                         'Container Tracking',
//                         style: TextStyle(fontSize: 50, color: Colors.white, fontWeight: FontWeight.w500),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       color: MyColor.backgroundColor,
//                       borderRadius: BorderRadius.circular(7)
//                     ),
//                     padding:const EdgeInsets.only(top: 20, left: 50, right: 50),
//                     height: 190,
//                     width: 1024,
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             Expanded(
//                               flex: 5,
//                               child: Container(
//                                 padding: const EdgeInsets.fromLTRB(20, 10, 30, 10),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                   Text(' Booking / Bill Number', style: style18_black,),
//                                   const SizedBox(height: 10,),
//                                   TextField(
//                                     controller: bkNo,
//                                     decoration: const InputDecoration(
//                                       hintText: 'Booking / Bill Number',
//                                       border: OutlineInputBorder()
//                                     ),
//                                   )
//                                 ],),
//                               ),
//                             ),
//                             Expanded(
//                               flex: 5,
//                               child: Container(
//                                 padding: EdgeInsets.fromLTRB(0, 10, 30, 10),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                   Text(' Container Number', style: style18_black,),
//                                   SizedBox(height: 10,),
//                                   TextField(
//                                     controller: cntrNo,
//                                     decoration: const InputDecoration(
//                                       hintText: 'Container Number',
//                                       border: OutlineInputBorder()
//                                     ),
//                                   )
//                                 ],),
//                               ),
//                             ),
//                             Expanded(
//                               flex: 2,
//                               child: Container(
//                                 padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(''),
//                                     SizedBox(height: 15,),
//                                     InkWell(
//                                       onTap: () {
//                                     setState(() {
//                                     containerTrackings = fetchContainerTracking(cntrNo.text, bkNo.text);
//                                 });
//                                       },
//                                       child: Container(
//                                         decoration: BoxDecoration(
//                                           color: Color.fromARGB(255, 76, 100, 206),
//                                           borderRadius: BorderRadius.circular(10)
//                                         ),
//                                         height: 50,
//                                         width: 120,
//                                         child: Center(child: Text('Search', style: style18_white,)),
//                                       ),
//                                     )
//                                 ],),
//                               ),
//                             )
//                         ],),
//                         SizedBox(height: 10),
//                         Container(
//                           padding: EdgeInsets.only(left: 20),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Expanded(child: Text('Our system does not accept House BL number assigned by NVOCC or Freight Forwarder.', style: style15_black,)),
//                             ],
//                           ),
//                         ),
//                         SizedBox(height: 5),
//                         Container(
//                           padding: EdgeInsets.only(left: 20),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Text(showTextError, style: style20_red,),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   Container(
//                     height: 10,
//                   ),
//                         buildDataTracking(),
//                   Container(height: 40,)
//                 ],
//               ),
//             )));
//   }

//   Future<List<ContainerTracking>> fetchContainerTracking(String cntrNo, String bkNo) async {
//     // var url = 'https://222.252.166.214:2214/api/Tracking?BookingNo=$bkNo&CntrNo=$cntrNo';
//     var url = 'http://222.252.166.214:6505/api/Tracking?BookingNo=$bkNo&CntrNo=$cntrNo';
//       final response = await http.get(Uri.parse(url),
//           headers: {
//             "Access-Control-Allow-Origin": "*",
//             "Access-Control-Allow-Methods": "POST, GET", //use fot http, not use https
//           }
//           );
//         print(response.statusCode);
//       if (response.statusCode == 200) {
//         var body = response.body;
//         // print(body);
//         if (body == '[]') {
//             setState(() {
//               showTextError = errorInput;
//             });
//         } else {
//             setState(() {
//               showTextError = '';
//             });
//         }
//         List dataCntrTracking = jsonDecode(body);
//         return dataCntrTracking.map((data) => ContainerTracking.fromJson(data)).toList();
//       } else if (response.statusCode == 400) {
//           setState(() {
//             showTextError = errorInput2;
//           });
//           throw Exception('Error');
//       } else {
//         setState(() {
//           showTextError = errorServer;
//         });
//         throw Exception('Error');
//       }
//   }

//   FutureBuilder<List<ContainerTracking>> buildDataTracking() {
//   return FutureBuilder<List<ContainerTracking>> (
//     future: containerTrackings,
//     builder:(context, snapshot) {
//       if (snapshot.connectionState == ConnectionState.waiting) {
//       return const Center(
//         child: CircularProgressIndicator()
//         );}
//       else if (snapshot.hasData & (snapshot.data != [])) {
//         return Container(
//           padding: EdgeInsets.only(top: 30, bottom: 30),
//           width: 1024,
//           decoration: BoxDecoration(
//             color: MyColor.backgroundColor,
//             borderRadius: BorderRadius.circular(7)
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget> [
//               DataTable(
//                 columns: [
//                         DataColumn(
//                           label: Expanded(child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text('Container', style: style15_black_bold),
//                             ],
//                           )),
//                         ),
//                         // DataColumn(
//                         //   label: Expanded(
//                         //     child: Row(
//                         //     // mainAxisAlignment: MainAxisAlignment.center,
//                         //     children: [
//                         //       Text("Size", style: style15_black_bold),
//                         //     ],
//                         //   )),
//                         // ),
//                         // DataColumn(
//                         //   label: Expanded(
//                         //     child: Row(
//                         //     mainAxisAlignment: MainAxisAlignment.center,
//                         //     children: [
//                         //       Text("Vessel", style: style15_black_bold),
//                         //     ],
//                         //   )),
//                         // ),
//                         // DataColumn(
//                         //   label: Expanded(
//                         //     child: Row(
//                         //     mainAxisAlignment: MainAxisAlignment.center,
//                         //     children: [
//                         //       Text('Voyage', style: style15_black_bold),
//                         //     ],
//                         //   )),
//                         // ),
                        
//                         DataColumn(
//                           label: Expanded(child: Row(
//                             // mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text('Status', style: style15_black_bold),  //logstatus
//                             ],
//                           )),
//                         ),
//                         DataColumn(
//                           label: Expanded(child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text('Location', style: style15_black_bold),
//                             ],
//                           )),
//                         ),
//                         DataColumn(
//                           label: Expanded(child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text('Date', style: style15_black_bold),
//                             ],
//                           )),
//                         ),
//                       ], 
//                       rows: List.generate(snapshot.data!.length, (index) {
//                         print(snapshot.data!.length);
//                         var data = snapshot.data![index];
//                         var time = data.eventDate.toString().substring(11,16);
//                         var date = data.eventDate.toString().substring(0,10);
//                         if (Ccontainer == data.container.toString()) {     //row color
//                           bool_data = bool_data;
//                         } else {
//                           bool_data = !bool_data;
//                           Ccontainer = data.container.toString();
//                         }
//                         if (bool_data == true) {
//                           color_data = MyColor.dataColor;
//                         } else {
//                           color_data = MyColor.backgroundColor;
//                         }                                                   //end row color
//                         if (data.logStatus == 'MIA') {
//                           detailStatus = 'EMPTY RETURN';                 // Cont rỗng trả về
//                         } else if (data.logStatus == 'MOS') {
//                           detailStatus = 'EMPTY RELEASE FOR OUTBOUND';      // KH lấy cont rỗng đóng hàng
//                         }  else if (data.logStatus == 'FEX') {
//                           detailStatus = 'OUTBOUND FULL CY';                 // Hạ cảng chờ xuất
//                         } else if (data.logStatus == 'FOB') {
//                           detailStatus = 'ONBOARD';                          // Trên tàu
//                         } else if (data.logStatus == 'FIM') {
//                           detailStatus = 'INBOUND FULL CY';                   // Cont hàng nhập hạ cảng
//                         } else if (data.logStatus == 'FOS') {
//                           detailStatus = 'INBOUND FULL DELIVERY';             // KH lấy cont hàng về kho rút hàng
//                         } else {
//                           detailStatus = '#';
//                         }
                        
//                         if (data.vessel == 'HAW') {
//                           detailVessel = 'HAIAN WEST';
//                         } else if (data.vessel == 'HAM') {
//                           detailVessel = 'HAIAN MIND';
//                         } else if (data.vessel == 'HAV') {
//                           detailVessel = 'HAIAN VIEW';
//                         } else if (data.vessel == 'HAE') {
//                           detailVessel = 'HAIAN EAST';
//                         } else if (data.vessel == 'HAB') {
//                           detailVessel = 'HAIAN BELL';
//                         } else if (data.vessel == 'HAL') {
//                           detailVessel = 'HAIAN LINK';
//                         } else if (data.vessel == 'HAP') {
//                           detailVessel = 'HAIAN PARK';
//                         } else if (data.vessel == 'HAT') {
//                           detailVessel = 'HAIAN TIME';
//                         } else if (data.vessel == 'HAC') {
//                           detailVessel = 'HAIAN CITY';
//                         } else if (data.vessel == 'HAR') {
//                           detailVessel = 'HAIAN ROSE';
//                         } else if (data.vessel == 'ABB') {
//                           detailVessel = 'ANBIEN BAY';
//                         } else if (data.vessel == null) {
//                           detailVessel = '';
//                         } else {
//                           detailVessel = '#';
//                         }
        
//                         if (data.voyage == null) {
//                           detailVoyage = '';
//                         } else {
//                           detailVoyage = data.voyage.toString();
//                         }
//                         return DataRow(
//                           color: MaterialStateProperty.all(color_data),
//                           cells: [
//                           DataCell(
//                             Container(
//                               width: 200,
//                               child: Center(
//                                 child: Text(data.container.toString(), style: style12_black,)),
//                             )),
//                           // DataCell(
//                           //   Container(
//                           //     width: 40,
//                           //     child: Text(data.size.toString(), style: style12_black,))),
//                           // DataCell(
//                           //   Container(
//                           //     width: 80,
//                           //     child: Center(
//                           //       child: Text(detailVessel, style: style12_black,)))),
//                           // DataCell(
//                           //   Container(
//                           //     width: 50,
//                           //     child: Center(
//                           //       child: Text(detailVoyage, style: style12_black,)),
//                           //   )),
                          
//                           DataCell(
//                             Container(
//                               width: 250,
//                               child: Text(snapshot.data![index].status!, style: style13_blue,))),
//                           DataCell(
//                             Container(
//                               width: 200,
//                               child: Center(
//                                 child: Text(snapshot.data![index].location!, style: style12_black,)),
//                             )),
//                           DataCell(
//                             Container(
//                               width: 150,
//                               child: Center(
//                                 child: Text('$date \n $time', style: style12_black)),
//                             )),
//                         ]);
//                       })
//                       ),
//                       ]
//           ),
//         );
//       }
//       return Text('');
//   }
//   ,);}
// }
