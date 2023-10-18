
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:web_lotus/assets/color.dart';
import 'package:web_lotus/assets/text.dart';
import 'package:web_lotus/fetchdata/data_container.dart';

import 'package:web_lotus/model/model_tracking.dart';
import 'package:web_lotus/screen/tracking/tracking.dart';
import 'package:web_lotus/widgets/appbar_fake.dart';

import '../assets/style.dart';

class Data_Booking extends StatefulWidget {
  Function updateDataContainer;
  Data_Booking(this.updateDataContainer);

  @override
  State<Data_Booking> createState() => _Data_BookingState();
}

Future<ContainerTracking>? containerTracking;
List? list_filter;
// List<TrackingZimsEN>? list_filter_en;
// List<TrackingZimsVN>? list_filter_vn;

class _Data_BookingState extends State<Data_Booking> {


  @override
  Widget build(BuildContext context) {
    return dataBooking();
  }

  FutureBuilder<ContainerTracking> dataBooking() {
  return FutureBuilder<ContainerTracking> (
    future: containerTracking,
    builder:(context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(
        child: CircularProgressIndicator()
        );}
      else if (snapshot.hasData) {
          var data_bk = snapshot.data!.trackingContainers;
          var data_cntr_en = snapshot.data!.trackingZimsEN;
          var data_cntr_vn = snapshot.data!.trackingZimsVN;
          if (data_bk.toString() != [].toString()) {
            if (data_cntr_en.toString() != [].toString() && cntr_no != null) {
                if (bool_lang == false) {
                  list_filter = data_cntr_en!.where((item) => item.container!.contains(cntr_no!)).toList();
                } else {
                  list_filter = data_cntr_vn!.where((item) => item.container!.contains(cntr_no!)).toList();
                }
              }
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
                padding: EdgeInsets.only(left: 45),
                child: Row(
                  children: [
                    Icon(Icons.arrow_right),
                    SelectableText('title_booking'.tr())
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
                              SelectableText('seq'.tr(), style: style15_black_bold),
                            ],
                          )),
                        ),                        
                        DataColumn(
                          label: Expanded(child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SelectableText('container'.tr(), style: style15_black_bold),
                            ],
                          )),
                        ),
                        DataColumn(
                          label: Expanded(child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SelectableText('size_booking'.tr(), style: style15_black_bold),
                            ],
                          )),
                        ),
                      ], 
                rows: List.generate(data_bk!.length, (index) {
                  print(data_bk.length);
                        return DataRow(
                          cells: [
                          DataCell(
                            Container(
                              width: 30,
                              child: Center(
                                child: SelectableText((index+1).toString(), style: style13_black,)),
                            )),
                          DataCell(
                            Row(
                              children: [
                                Container(
                                  child: InkWell(
                                    onTap: () {
                                      print(bool_lang);
                                      print(bool_data_container);
                                      cntr_no = data_bk[index].container.toString();
                                      if (bool_lang == false) {
                                        list_filter = data_cntr_en!.where((item) => item.container!.contains(cntr_no!)).toList();
                                      } else {
                                        list_filter = data_cntr_vn!.where((item) => item.container!.contains(cntr_no!)).toList();
                                      }
                                      print('$list_filter');
                                      this.widget.updateDataContainer();
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(bottom: 2),
                                      decoration: BoxDecoration(
                                        border: Border(bottom: BorderSide(
                                          color: MyColor.normalColor,
                                          width: 1,
                                        ))
                                      ),
                                      child: Text(data_bk[index].container.toString(), style: style13_blue_underline,))),
                                ),
                                SizedBox(width: 520,)
                              ],
                            )),
                          DataCell(
                            Container(
                              width: 120,
                              child: Center(
                                child: SelectableText(data_bk[index].size.toString(), style: style13_black)),
                            )),
                        ]);
                      })
              ),
            ]
          ),
        );
          } else {
              if (data_cntr_en.toString() != [].toString()) {
                cntr_no = input.text.toUpperCase().toString();
                if (bool_lang == false) {
                  list_filter = data_cntr_en!.where((item) => item.container!.contains(cntr_no!)).toList();
                } else {
                  list_filter = data_cntr_vn!.where((item) => item.container!.contains(cntr_no!)).toList();
                }
                print(list_filter);
                return Data_Container();
              } else {
                return Text('');
              }
          }
      } 
      return Text('');
  }
  ,);}

  // void updateLanguage() {
  //   setState(() {
  //   });
  // }
}