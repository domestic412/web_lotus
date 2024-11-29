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
import 'package:web_lotus/model/model_quote_detail.dart';
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
      ...row.getCells().map<Widget>((dataGridCell) => Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(5.0),
            child: dataGridCell.value == null
                ? SizedBox()
                : dataGridCell.columnName == 'Image'
                    ? InkWell(
                        onTap: () {
                          downloadAndExtractZip(
                              cntr: row.getCells()[1].value,
                              esdate: row.getCells()[17].value);
                        },
                        child: Text(
                          dataGridCell.value.toString(),
                          style: style12_blue,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    : Text(dataGridCell.value.toString(),
                        style: style11_black, overflow: TextOverflow.ellipsis),
          ))
    ].toList());
  }

  void applyFilter({
    required String cntr,
    required String chargeTypeCode,
    required String componentCode,
    required String categoryCode,
    required String damageCode,
    required String location,
  }) {
    _listEQC = _listEQC_original
        .where((element) =>
            element.container!.toUpperCase().contains(cntr.toUpperCase()) &&
            element.chargeType!
                .toUpperCase()
                .contains(chargeTypeCode.toUpperCase()) &&
            element.component!
                .toUpperCase()
                .contains(componentCode.toUpperCase()) &&
            element.category!
                .toUpperCase()
                .contains(categoryCode.toUpperCase()) &&
            element.damageCode!
                .toUpperCase()
                .contains(damageCode.toUpperCase()) &&
            element.location!.toUpperCase().contains(location.toUpperCase()))
        .toList();
    buildDataGridRows();
    notifyListeners();
  }

  void clear() {
    _listEQC = _listEQC_original;
    buildDataGridRows();
    notifyListeners();
  }

  @override
  Widget? buildGroupCaptionCellWidget(
      RowColumnIndex rowColumnIndex, String summaryValue) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        child: Text(summaryValue));
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

  // List<XFile>? listImg;
  // Future getImage(
  //     {required ImageSource media,
  //     required String cntr,
  //     required String esdate}) async {
  //   final ImagePicker _picker = ImagePicker();
  //   List<XFile> img = await _picker.pickMultiImage();

  //   listImg = img;

  //   if (listImg!.isNotEmpty) {
  //     quoteController.pathImg.value = listImg![0].path;
  //     return Get.defaultDialog(
  //       title: 'Preview Image',
  //       content: Container(
  //         height: fullSizeHeight! * 0.8,
  //         width: fullSizeWidth! * 0.8,
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Container(
  //               height: fullSizeHeight! * 0.8,
  //               width: fullSizeWidth! * 0.25,
  //               decoration: BoxDecoration(border: Border.all()),
  //               child: ListView.builder(
  //                   scrollDirection: Axis.vertical,
  //                   itemCount: listImg!.length,
  //                   itemBuilder: (BuildContext context, index) {
  //                     return Row(
  //                       children: [
  //                         Container(
  //                           width: 50,
  //                           color: white,
  //                           child: Center(child: Text('${index + 1}.')),
  //                         ),
  //                         Container(
  //                             margin: EdgeInsets.symmetric(vertical: 10),
  //                             child: InkWell(
  //                                 onTap: () {
  //                                   quoteController.pathImg.value =
  //                                       listImg![index].path;
  //                                   // print(quoteController.pathImg.value);
  //                                 },
  //                                 child: Text(listImg![index].name))),
  //                       ],
  //                     );
  //                   }),
  //             ),
  //             Obx(() => Container(
  //                   height: fullSizeHeight! * 0.8,
  //                   width: fullSizeWidth! * 0.5,
  //                   decoration: BoxDecoration(border: Border.all()),
  //                   child: Image.network(quoteController.pathImg.value,
  //                       errorBuilder: (BuildContext context, Object error,
  //                           StackTrace? stackTrace) {
  //                     return const Center(
  //                       child: Text('This image type is not supported:'),
  //                     );
  //                   }),
  //                 ))
  //           ],
  //         ),
  //       ),
  //       confirm: ElevatedButton(
  //           style: ElevatedButton.styleFrom(backgroundColor: haian),
  //           onPressed: () {
  //             PostImgQuote(
  //               cntr: cntr,
  //               date: esdate,
  //             );
  //           },
  //           child: Text(
  //             'Send',
  //             style: TextStyle(color: white),
  //           )),
  //       cancel: ElevatedButton(
  //           style: ElevatedButton.styleFrom(backgroundColor: grey),
  //           onPressed: () {
  //             Get.back();
  //           },
  //           child: Text(
  //             'Cancel',
  //             style: TextStyle(color: white),
  //           )),
  //     );
  //   }
  // }

  // Future<void> PostImgQuote(
  //     {required String cntr, required String date}) async {
  //   try {
  //     EasyLoading.show(
  //       status: 'Loading...',
  //       maskType: EasyLoadingMaskType.black,
  //       dismissOnTap: true,
  //     );
  //     //PostRequest with multipartFile
  //     // Create a FormData object to store your files
  //     final formData = html.FormData();
  //     final url =
  //         '$SERVER/EQCQuote/CheckImage?Container=$cntr&EstimateDate=$date';
  //     // Assuming a list of XFile objects in _listImage
  //     if (listImg != null) {
  //       for (int i = 0; i < listImg!.length; i++) {
  //         final file = listImg![i];
  //         //Convert XFile to Blob
  //         final blob = html.Blob([await file.readAsBytes()], file.mimeType);
  //         // Add the Blob to the FormData object
  //         formData.appendBlob('uploadfile', blob, file.name);
  //       }
  //     }
  //     final request = html.HttpRequest();
  //     request.open(
  //       'POST',
  //       url,
  //     );
  //     request.send(formData);
  //     request.onLoad.listen((html.ProgressEvent event) {
  //       switch (request.status) {
  //         case 200:
  //           EasyLoading.showSuccess('Upload Success');
  //           print('Success send Image quote');
  //           if (Get.isDialogOpen == true) {
  //             Get.back();
  //           }
  //           Get.to(SupportPage());
  //           Get.to(() => QuoteDetailsPage());
  //         default:
  //           EasyLoading.showError('Upload Fail');
  //           print('Error ${request.status} send Image quote ' + cntr);
  //       }
  //     });
  //   } on Exception catch (e) {
  //     EasyLoading.showError('Upload Fail');
  //     print(e);
  //     throw Exception('Error fetch Image - $e');
  //   }
  // }
}
