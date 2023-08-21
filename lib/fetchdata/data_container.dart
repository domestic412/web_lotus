


import 'package:flutter/material.dart';
import 'package:web_lotus/assets/color.dart';
import 'package:web_lotus/assets/style.dart';
import 'package:web_lotus/fetchdata/data_booking.dart';

import '../model/model_tracking.dart';

class Data_Container extends StatefulWidget {
  const Data_Container({super.key});

  @override
  State<Data_Container> createState() => _Data_ContainerState();
}

Color? color_time;

class _Data_ContainerState extends State<Data_Container> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 45),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.arrow_right),
                Text('Container Tracking Detail'),
              ],
            ),
          ),
          SizedBox(height: 5,),
          DataTable(
            border: TableBorder.all(),
            columns: [
              DataColumn(
                label: Expanded(child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Seq', style: style12_black,)
                  ],
                ))
                ),
              DataColumn(
                label: Expanded(child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Container', style: style12_black,)
                  ],
                ))
                ),
              DataColumn(
                label: Expanded(child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Status', style: style12_black,)
                  ],
                ))
                ),
              DataColumn(
                label: Expanded(child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Location', style: style12_black,)
                  ],
                ))
                ),
              DataColumn(
                label: Expanded(child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Event Date', style: style12_black,)
                  ],
                ))
                )
            ],
            rows: List.generate(list_filter!.length, (index) {
              var date = list_filter![index].eventDate.toString().substring(0,10);
              var time = list_filter![index].eventDate.toString().substring(11,16);
              var dt = DateTime.tryParse(list_filter![index].eventDate.toString());
              if (dt!.compareTo(DateTime.now()) < 0) {
                color_time = MyColor.normalColor;
              } else {
                color_time = Colors.black;
              }
              return DataRow(
                cells: [
                  DataCell(
                    Container(
                      width: 30,
                      child: Center(child: Text((index+1).toString(), style: style13_black,)),
                    )
                  ),
                  DataCell(
                    Container(
                      width: 100,
                      child: Center(child: Text(list_filter![index].container.toString(), style: style13_black,)),
                    )
                  ),
                  DataCell(
                    Container(
                      width: 220,
                      child: Text(list_filter![index].status.toString(), style: style13_black,),
                    )
                  ),
                  DataCell(
                    Container(
                      width: 170,
                      child: Center(child: Text(list_filter![index].location.toString(), style: style13_black,)),
                    )
                  ),
                  DataCell(
                    Container(
                      width: 120,
                      child: Center(child: Text('$date   $time', style: TextStyle(fontSize: 13, color: color_time,),)),
                    )
                  )
                ]);
            })
            ),
        ],
      ),
    );
  }
}