


import 'package:flutter/material.dart';
import 'package:web_lotus/assets/style.dart';
import 'package:web_lotus/fetchdata/data_booking.dart';

import '../model/model_tracking.dart';

class Data_Container extends StatefulWidget {
  const Data_Container({super.key});

  @override
  State<Data_Container> createState() => _Data_ContainerState();
}


class _Data_ContainerState extends State<Data_Container> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DataTable(
        columns: [
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
          return DataRow(
            cells: [
              DataCell(
                Container(
                  width: 100,
                  child: Center(child: Text(list_filter![index].container.toString(), style: style12_black,)),
                )
              ),
              DataCell(
                Container(
                  width: 100,
                  child: Center(child: Text(list_filter![index].status.toString(), style: style12_black,)),
                )
              ),
              DataCell(
                Container(
                  width: 100,
                  child: Center(child: Text(list_filter![index].location.toString(), style: style12_black,)),
                )
              ),
              DataCell(
                Container(
                  width: 100,
                  child: Center(child: Text('$date   $time', style: style12_black,)),
                )
              )
            ]);
        })
        ),
    );
  }
}