import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_lotus/assets/color.dart';
import 'package:web_lotus/assets/style.dart';
import 'package:web_lotus/assets/variable.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/model/model_listEQC.dart';
import 'package:http/http.dart' as http;
import 'package:universal_html/html.dart' as html;
import 'package:web_lotus/widgets/removeBeforeSlash.dart';

class DataListEQCSource extends DataGridSource {
  DataListEQCSource(this._listEQC) {
    _listEQC_original = _listEQC;
    buildDataGridRows();
  }

  List<ListEQC> _listEQC = [];
  List<ListEQC> _listEQC_original = [];
  List<DataGridRow> dataGridRows = [];
  String remarks = '';
  bool reject = false;

  void buildDataGridRows() {
    dataGridRows = _listEQC.map<DataGridRow>((DataGridRow) {
      return DataGridRow.getDataGridRow_ListEQC();
    }).toList();
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: [
      Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(5.0),
        child: Text(
          (dataGridRows.indexOf(row) + 1).toString(),
          style: style11_black,
        ),
      ),
      ...row.getCells().map<Widget>((dataGridCell) {
        if (dataGridCell.columnName == 'Status') {
          if (dataGridCell.value.toString().toUpperCase() == 'CANCEL') {
            reject = true;
          } else {
            reject = false;
          }
        }
        if (dataGridCell.columnName == 'completeImgUpload') {
          if (dataGridCell.value.toString() == '') {
            remarks = 'Ask for the post repair photos';
          }
        } else if (dataGridCell.columnName == 'Approval') {
          if (dataGridCell.value == null) {
            remarks = 'Waiting for approval';
          } else {
            if (reject == true) {
              remarks = '';
            }
          }
        } else if (dataGridCell.columnName == 'isImgUpload') {
          if (dataGridCell.value.toString() == '') {
            remarks = 'Add photos to Quote Request';
          }
        } else if (dataGridCell.columnName == 'Complete') {
          if (dataGridCell.value != null) {
            remarks = '';
          }
        }
        return Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(5.0),
          child: dataGridCell.value == null ||
                  dataGridCell.value.toString().toUpperCase() == 'CANCEL'
              ? SizedBox()
              : dataGridCell.columnName == 'Request' ||
                      dataGridCell.columnName == 'Approval' ||
                      dataGridCell.columnName == 'Complete'
                  ? Text(
                      changeStringDatetoShow(
                          date: dataGridCell.value.toString()),
                      style: style11_black,
                      overflow: TextOverflow.ellipsis)
                  : dataGridCell.columnName == 'Remarks'
                      ? Text(remarks,
                          style: style11_black, overflow: TextOverflow.ellipsis)
                      : Text(dataGridCell.value.toString(),
                          style: style11_black,
                          overflow: TextOverflow.ellipsis),
        );
      })
    ].toList());
  }

  void applyFilter({
    required String depot,
    required String cntr,
    // required String size,
    required String quoteCcy,
    // required String approveCode,
    required String quoteNo,
    //search detail
    required String charge,
    required String component,
    required String damageCode,
    required String damageDetail,
    required String category,
    required String location,
    required String payer,
  }) {
    _listEQC = _listEQC_original
        .where((element) =>
            element.quoteNo!.toUpperCase().contains(quoteNo.toUpperCase()) &&
            element.depot!.toUpperCase().contains(depot.toUpperCase()) &&
            element.container!.toUpperCase().contains(cntr.toUpperCase()) &&
            // element.size
            //     .toString()
            //     .toUpperCase()
            //     .contains(size.toUpperCase()) &&
            element.quoteCcy!.toUpperCase().contains(quoteCcy.toUpperCase()) &&
            // element.approveCode!
            //     .toUpperCase()
            //     .contains(approveCode.toUpperCase()) &&
            element.details!.any((value) => value.chargeType!
                .toUpperCase()
                .contains(charge.toUpperCase())) &&
            element.details!.any((value) => value.component!
                .toUpperCase()
                .contains(component.toUpperCase())) &&
            element.details!.any((value) => value.damageCode!
                .toUpperCase()
                .contains(damageCode.toUpperCase())) &&
            element.details!.any((value) => value.damageDetail!
                .toUpperCase()
                .contains(damageDetail.toUpperCase())) &&
            element.details!.any((value) => value.category!
                .toUpperCase()
                .contains(category.toUpperCase())) &&
            element.details!.any((value) => value.location!
                .toUpperCase()
                .contains(location.toUpperCase())) &&
            element.details!
                .any((value) => value.payer!.toUpperCase().contains(payer.toUpperCase())))
        .toList();
    buildDataGridRows();
    notifyListeners();
  }

  void clear() {
    _listEQC = _listEQC_original;
    buildDataGridRows();
    notifyListeners();
  }

  Future<void> downloadAndExtractZip(
      {required String cntr, required String esdate}) async {
    try {
      EasyLoading.show(
        status: 'Loading...',
        maskType: EasyLoadingMaskType.black,
        dismissOnTap: true,
      );
      var url =
          '$SERVER/EQCQuote/DownloadImage?Container=$cntr&EstimateDate=$esdate';

      final response = await http.get(Uri.parse(url), headers: {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Methods": "GET", //use fot http, not use https
      });
      switch (response.statusCode) {
        case 200:
          Uint8List bytes = response.bodyBytes;
          List<dynamic> files = await _extractZipFile(bytes);
          quoteController.pathImg.value = files[0]['path'];
          quoteController.nameImg.value = removeBeforeSlash(files[0]['name']);
          EasyLoading.dismiss();

          return Get.defaultDialog(
            title: 'Preview Image',
            content: Container(
              height: fullSizeHeight! * 0.8,
              width: fullSizeWidth! * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 5),
                    height: fullSizeHeight! * 0.8,
                    width: fullSizeWidth! * 0.25,
                    decoration: BoxDecoration(border: Border.all()),
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: files.length,
                        itemBuilder: (BuildContext context, index) {
                          return Row(
                            children: [
                              Container(
                                width: 50,
                                color: white,
                                child: Center(child: Text('${index + 1}.')),
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  child: InkWell(
                                    onTap: () {
                                      quoteController.pathImg.value =
                                          files[index]['path'];
                                      quoteController.nameImg.value =
                                          removeBeforeSlash(
                                              files[index]['name']);
                                      // print(quoteController.pathImg.value);
                                    },
                                    child: Text(removeBeforeSlash(
                                        files[index]['name'])),
                                  )),
                            ],
                          );
                        }),
                  ),
                  Obx(() => Container(
                        height: fullSizeHeight! * 0.8,
                        width: fullSizeWidth! * 0.5,
                        decoration: BoxDecoration(border: Border.all()),
                        child: Column(
                          children: [
                            Image.network(quoteController.pathImg.value,
                                errorBuilder: (BuildContext context,
                                    Object error, StackTrace? stackTrace) {
                              return const Center(
                                child:
                                    Text('This image type is not supported:'),
                              );
                            }),
                            Center(
                                child: Text(
                              quoteController.nameImg.value,
                            ))
                          ],
                        ),
                      ))
                ],
              ),
            ),
            confirm: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: haian),
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  'OK',
                  style: TextStyle(color: white),
                )),
          );
        case 404:
          return EasyLoading.showError('No Image');
        default:
          return EasyLoading.showError('Error: ${response.reasonPhrase}');
      }
    } on Exception catch (e) {
      EasyLoading.showError('Error: $e');
    }
  }

  Future<List<dynamic>> _extractZipFile(Uint8List zipData) async {
    final archive = ZipDecoder().decodeBytes(zipData);
    final extractedFiles = [];
    for (final file in archive) {
      if (file.isFile) {
        final data = file.content as List<int>;
        final name = file.name;
        final blob = html.Blob([data], 'image/png');
        final url = html.Url.createObjectUrlFromBlob(blob);
        extractedFiles.add({'name': name, 'path': url});
      }
    }
    return extractedFiles;
  }
}
