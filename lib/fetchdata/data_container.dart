import 'package:flutter/material.dart';
import 'package:web_lotus/assets/style.dart';
import 'package:web_lotus/fetchdata/data_booking.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Data_Container extends StatefulWidget {
  const Data_Container({super.key});

  @override
  State<Data_Container> createState() => _Data_ContainerState();
}

Color? color_time;
String dt = '';

class _Data_ContainerState extends State<Data_Container> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.arrow_right),
                SelectableText('title_container'.tr),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          DataTable(
              border: TableBorder.all(),
              columns: [
                DataColumn(
                    label: Expanded(
                        child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SelectableText(
                      'seq'.tr,
                      style: style15_black_bold,
                    )
                  ],
                ))),
                DataColumn(
                    label: Expanded(
                        child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SelectableText(
                      'container'.tr,
                      style: style15_black_bold,
                    )
                  ],
                ))),
                DataColumn(
                    label: Expanded(
                        child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SelectableText(
                      'status_container'.tr,
                      style: style15_black_bold,
                    )
                  ],
                ))),
                DataColumn(
                    label: Expanded(
                        child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SelectableText(
                      'location_container'.tr,
                      style: style15_black_bold,
                    )
                  ],
                ))),
                DataColumn(
                    label: Expanded(
                        child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SelectableText(
                      'eventDate_container'.tr,
                      style: style15_black_bold,
                    )
                  ],
                )))
              ],
              rows: List.generate(list_filter!.length, (index) {
                list_filter![index].eventDate != null
                    ? dt = DateFormat("yyyy-MM-dd  hh:mm")
                        .format(DateTime.parse(list_filter![index].eventDate))
                    : dt = '';
                return DataRow(cells: [
                  DataCell(Container(
                    width: 30,
                    child: Center(
                        child: SelectableText(
                      (index + 1).toString(),
                      style: style13_black,
                    )),
                  )),
                  DataCell(Container(
                    width: 100,
                    child: Center(
                        child: SelectableText(
                      list_filter![index].container.toString(),
                      style: style13_black,
                    )),
                  )),
                  DataCell(Container(
                    width: 220,
                    child: SelectableText(
                      list_filter![index].status.toString(),
                      style: style13_black,
                    ),
                  )),
                  DataCell(Container(
                    width: 170,
                    child: Center(
                        child: SelectableText(
                      list_filter![index].location.toString(),
                      style: style13_black,
                    )),
                  )),
                  DataCell(Container(
                    width: 120,
                    child: Center(
                        child: SelectableText(
                      dt,
                      style: TextStyle(
                        fontSize: 13,
                        color: color_time,
                      ),
                    )),
                  ))
                ]);
              })),
        ],
      ),
    );
  }
}
