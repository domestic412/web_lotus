// import 'package:flutter/material.dart';
// import 'package:web_lotus/assets/text.dart';

// import '../model/tracking.dart';

// class DataContainer extends StatefulWidget {
//   const DataContainer({super.key});

//   @override
//   State<DataContainer> createState() => _DataContainerState();
// }
// Future<List<ContainerTracking>>? containerTrackings;

// class _DataContainerState extends State<DataContainer> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(5),
//       child: FutureBuilder<List<ContainerTracking>> (
//     future: containerTrackings,
//     builder:(context, snapshot) {
//       if (snapshot.connectionState == ConnectionState.waiting) {
//       return const Center(
//         child: CircularProgressIndicator()
//         );}
//       // else if (snapshot.hasData && (snapshot.data != [])) {
//       else if (snapshot.hasData) {
//         setState(() {
//           bool_data = true;
//         });
//         var length = snapshot.data!.length;
//         for ( var index = 0; index < length; index++) {
//           var data = snapshot.data![index];
//           if (data.logStatus == 'MOS') {                      //KH lay cont rong dong hang
//             setState(() {
//               data_container_MOS_depo = data.depot.toString();
//               data_container_MOS_date = data.logDate.toString().substring(0,10);
//               data_container_MOS_time = data.logDate.toString().substring(11,16);
//             });
            
//           } else if (data.logStatus == 'FEX') {                //Cont xuat ha cang
//             setState(() {
//               seq = 2;
//               data_container_FEX_terminal = data.depot.toString();
//               data_container_FEX_date = data.logDate.toString().substring(0,10);
//               data_container_FEX_time = data.logDate.toString().substring(11,16);
//             });
//           } else if (data.logStatus == 'FOB') {                 //Tren tau
//             setState(() {
//               seq = 3;
//               data_container_FOB_terminal = data.depot.toString();
//               data_container_FOB_vessel = data.vessel.toString();
//               data_container_FOB_date = data.logDate.toString().substring(0,10);
//               data_container_FOB_time = data.logDate.toString().substring(11,16);
//             });
//           } else if (data.logStatus == 'FIM') {                 //Cont nhap ha cang
//             setState(() {
//               seq = 4;
//               data_container_FIM_terminal = data.depot.toString();
//               data_container_FIM_date = data.logDate.toString().substring(0,10);
//               data_container_FIM_time = data.logDate.toString().substring(11,16);
//             });
//           } else if (data.logStatus == 'FOS') {                   // KH lay cont ve kho rut hang
//             setState(() {
//               seq = 5;
//               data_containre_FOS_depo = data.depot.toString();
//               data_container_FOS_date = data.logDate.toString().substring(0,10);
//               data_container_FOS_time = data.logDate.toString().substring(11,16);
//             });
//           } else if (data.logStatus == 'MIA') {                   // KH lay cont ve kho rut hang
//             setState(() {
//               seq = 5;
//               data_container_MIA_depo = data.depot.toString();
//               data_container_MIA_date = data.logDate.toString().substring(0,10);
//               data_container_MIA_time = data.logDate.toString().substring(11,16);
//             });
//           }
//         }
//         return Container();
//       }
//       return Container();
//   }
//   ,)
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:web_lotus/model/model_tracking.dart';

import '../assets/style.dart';

Future<ContainerTracking>? containerTracking1;

  FutureBuilder<ContainerTracking> dataTrucking() {
  return FutureBuilder<ContainerTracking> (
    future: containerTracking1,
    builder:(context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(
        child: CircularProgressIndicator()
        );}
      else if (snapshot.hasData && (snapshot.data != [])) {
        var data_bk = snapshot.data!.trackingContainers;
        var data_cntr = snapshot.data!.trackingZims;
        // print(data_bk);
        return Container(
          padding: const EdgeInsets.only(bottom: 30),
          width: 1024,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              Container(
                padding: EdgeInsets.only(left: 20),
                child: const Row(
                  children: [
                    Icon(Icons.arrow_right),
                    Text('Container Tracking Detail')
                  ],
                ),
              ),
              DataTable(
                border: TableBorder.all(),
                columns: [
                        DataColumn(
                          label: Expanded(child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Seq', style: style15_black_bold),
                            ],
                          )),
                        ),                        
                        // DataColumn(
                        //   label: Expanded(child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Text('Booking', style: style15_black_bold),  //logstatus
                        //     ],
                        //   )),
                        // ),
                        DataColumn(
                          label: Expanded(child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Container', style: style15_black_bold),
                            ],
                          )),
                        ),
                        DataColumn(
                          label: Expanded(child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Size', style: style15_black_bold),
                            ],
                          )),
                        ),
                      ], 
                      rows: List.generate(data_bk!.length, (index) {
                        print(data_bk);
                        return DataRow(
                          cells: [
                          DataCell(
                            Container(
                              width: 30,
                              child: Center(
                                child: Text((index+1).toString(), style: style13_black,)),
                            )),
                          // DataCell(
                          //   Container(
                          //     width: 400,
                          //     child: Text(data_bk[index].bookingNo.toString(), style: style13_blue,))),
                          DataCell(
                            Container(
                              // width: 200,
                              width: 600,
                              child: InkWell(
                                onTap: (){},
                                child: Text(data_bk[index].container.toString(), style: style13_black,)),
                            )),
                          DataCell(
                            Container(
                              width: 120,
                              child: Center(
                                child: Text(data_bk[index].size.toString(), style: style13_black)),
                            )),
                        ]);
                      })
                      ),
                      
              // DataTable(
              //   border: TableBorder.all(),
              //   columns: [
              //           DataColumn(
              //             label: Expanded(child: Row(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                 Text('Seq', style: style15_black_bold),
              //               ],
              //             )),
              //           ),                        
              //           DataColumn(
              //             label: Expanded(child: Row(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                 Text('Status', style: style15_black_bold),  //logstatus
              //               ],
              //             )),
              //           ),
              //           DataColumn(
              //             label: Expanded(child: Row(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                 Text('Location', style: style15_black_bold),
              //               ],
              //             )),
              //           ),
              //           DataColumn(
              //             label: Expanded(child: Row(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                 Text('Event Date', style: style15_black_bold),
              //               ],
              //             )),
              //           ),
              //         ], 
                      // rows: List.generate(snapshot.data!.length, (index) {
                      //   print(snapshot.data!.length);
                      //   var data = snapshot.data![index];
                      //   var time = data.eventDate.toString().substring(11,16);
                      //   var date = data.eventDate.toString().substring(0,10);
                      //   // if (data.eventDate!.compareTo(DateTime.now()) > 0 ) {                                              //end row color
                      //   // setState(() {
                      //   // });
                      //   // }
                      //   return DataRow(
                      //     cells: [
                      //     DataCell(
                      //       Container(
                      //         width: 30,
                      //         child: Center(
                      //           child: Text((index+1).toString(), style: style13_black,)),
                      //       )),
                      //     DataCell(
                      //       Container(
                      //         width: 400,
                      //         child: Text(snapshot.data![index].status!, style: style13_blue,))),
                      //     DataCell(
                      //       Container(
                      //         width: 200,
                      //         child: Center(
                      //           child: Text(snapshot.data![index].location!, style: style13_black,)),
                      //       )),
                      //     DataCell(
                      //       Container(
                      //         width: 120,
                      //         child: Center(
                      //           child: Text('$date    $time', style: style13_black)),
                      //       )),
                      //   ]);
                      // })
              //         ),
                      ]
          ),
        );
      }
      return Text('');
  }
  ,);}

