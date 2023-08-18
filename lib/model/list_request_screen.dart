import 'dart:convert';
import 'package:android_soft/constains/color.dart';
import 'package:android_soft/constains/text.dart';
import 'package:android_soft/constains/variable.dart';
import 'package:android_soft/model/Request/model_list_request.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:android_soft/constains/global.dart';
import 'package:android_soft/screen/ListRequest_Screen/popUpDetail/detail_list_request.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListRequestScreen extends StatefulWidget {

  @override
  State<ListRequestScreen> createState() => _ListRequestScreenState();
}

class _ListRequestScreenState extends State<ListRequestScreen> {
  PopUpListRequest popUpListRequest = PopUpListRequest();

  Future<List<ListRequestResponse>>? listRequest;
  List<ListRequestResponse> list_filter = [];

  TextEditingController search_text = TextEditingController();

  Color? _color;
  String? _trangthai;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // fetchListRequest();
    listRequest = fetchListRequest();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: deviceWidth(context)*0.01, right: deviceWidth(context)*0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            const Center(
              child: Text(
                'DANH MỤC YÊU CẦU ĐÃ GỬI',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(
              color: Colors.black,
              height: 25,
            ),
            Expanded(child: DataRequest())
          ],
        ),
      );
  }



  FutureBuilder<List<ListRequestResponse>> DataRequest() {
  return FutureBuilder<List<ListRequestResponse>> (
    future: listRequest,
    builder:(context, snapshot) {
      if (snapshot.hasData) {
        if (search_text.text.isEmpty) {
          list_filter = snapshot.data!;
          // print(list_filter);
        }
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              Card(
                child: ListTile(
                  leading: const Icon(Icons.search),
                  title: TextField(
                    controller: search_text,
                    decoration: const InputDecoration(
                      hintText: 'Search', border: InputBorder.none
                      ),
                    onChanged: (value) {
                      setState(() {
                        list_filter = snapshot.data!.where((item) => item.cntrno!.contains(value.toUpperCase())).toList();
                        // print(list_filter);
                      });
                    },
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.cancel),
                      onPressed: () {
                        setState(() {
                          search_text.clear();
                          // list_filter = snapshot.data!;
                        });
                      },
                    ),
                ),),
              DataTable(
                // sortColumnIndex: 1,
                // sortAscending: true,
                columnSpacing: deviceWidth(context)*0.02,
                columns: [
                        DataColumn(
                          label: Expanded(child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('STT', style: text_Table,),
                            ],
                          )),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Số container', style: text_Table),
                              ],
                            ),
                          ),
                        ),
                        // DataColumn(
                        //   label: Expanded(child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Text('Kết quả', style: text_Table),
                        //     ],
                        //   )),
                        // ),
                        DataColumn(
                          label: Expanded(
                            child: InkWell(
                              onTap: (){
                                setState(() {
                          list_filter = snapshot.data!.where(
                            (item) => item.trangThaiYc!.contains('C')
                            ).toList();
                            // print(list_filter);
                            search_text.text = 'Chờ xử lý';
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:[
                                  Text('Kết quả', style: text_Table)
                                  ]
                                ),
                            ),
                          ),
                        ),
                      ], 
                      rows: List.generate(list_filter.length, (index) {
                        var data = list_filter[index];
                        id_ListRequest = data.id;
                        cntrno_ListRequest = data.cntrno;
                        trangThaiYc_ListRequest = data.trangThaiYc;
                        if (trangThaiYc_ListRequest == 'A') {
                          _color = green;
                          _trangthai = 'Đồng ý'; 
                        } else if (trangThaiYc_ListRequest == 'C'){
                          _color = grey;
                          _trangthai = 'Chờ xử lý';
                        }
                        else {
                          _color = red;
                          _trangthai = 'Từ chối';
                        }
                        return DataRow(cells: [
                          DataCell(Container(
                            width: deviceWidth(context)*0.1,
                            child: Center(child: Text((index+1).toString(), style: text_Table,)))),
                          DataCell(Container(
                            width: deviceWidth(context)*0.35,
                            child: Center(child: Text(cntrno_ListRequest.toString(), style: text_Table)))),
                          DataCell(Container(
                            width: deviceWidth(context)*0.4,
                            child: Center(
                              child: Container(
                                width: 110,
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                child: ElevatedButton(
                                onPressed: () {
                                  fetchListRequestDetail(list_filter[index].id.toString());
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: _color,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                                    child: Text(_trangthai.toString(), style: text_style_status, textAlign: TextAlign.center,),
                                ),
                              ),
                            ),
                          )),
                        ]);
                      })
                      ),
                      ]
          ),
        );
      } 
      return Text('');
  }
  ,);}

  Future<List<ListRequestResponse>> fetchListRequest() async {
    var url = '$SERVER_NAME/Requests/GetRequestByUser?user=$tokenLogin';
    EasyLoading.show(
        status: 'Loading...',
        maskType: EasyLoadingMaskType.black,
        dismissOnTap: true,
        );
    final response = await http.get(Uri.parse(url),headers:{"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      EasyLoading.dismiss();
      var body = response.body;
      print(body);
    List dataListRequest = json.decode(body);
    return dataListRequest.map((data) => ListRequestResponse.fromJson(data)).toList();
    }
      else {
        EasyLoading.dismiss();
        throw Exception('Error');
      }
  }

  Future<void> fetchListRequestDetail(String id) async {
    var url = '$SERVER_NAME/Requests/$id';
    if (id.isNotEmpty) {
      EasyLoading.show(
        status: 'Loading...',
        maskType: EasyLoadingMaskType.black,
        dismissOnTap: true,
        );
      final response = await http.get(Uri.parse(url),
          headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200) {
        EasyLoading.dismiss();
        var body = response.body;
        final dataDetail = jsonDecode(body);
        tenYeuCau_ListRequestDetail = dataDetail['tenYeuCau'];
        noiDung_ListRequestDetail = dataDetail['noiDung'];
        cntrno_ListRequestDetail = dataDetail['cntrno'];
        sizeType_ListRequestDetail = dataDetail['sizeType'];
        trangThaiYc_ListRequestDetail = dataDetail['trangThaiYc'];
        noteHangTau_ListRequestDetail = dataDetail['noteHangTau'];
        updateTime_ListRequestDetail = dataDetail['updateTime'];
        if (dataDetail['imageName'] != null) {
          String base64imageName = dataDetail['imageName'];
          print(base64imageName.length);
          if (base64imageName.length % 4 > 0) {
            base64imageName += '=' * (4 - base64imageName.length % 4);
            setState(() {
              decodedbytes = base64.decode(base64imageName);
            });
          } else {
            setState(() {
              decodedbytes = base64.decode(base64imageName);
            });
          }
        } else {
          decodedbytes = null;
        }
        // ignore: use_build_context_synchronously
        popUpListRequest.showPopUp(context);
        } else {
          EasyLoading.dismiss();
          throw Exception('Cannot connect to server');
        }
    } else {
      throw Exception('Failed to load because no have ID');
    }
  }

}
