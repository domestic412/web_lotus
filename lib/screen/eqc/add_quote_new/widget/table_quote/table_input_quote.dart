import 'dart:typed_data';
import 'package:archive/archive.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:universal_html/html.dart' as html;
import 'package:web_lotus/assets/color.dart';
import 'package:web_lotus/assets/variable.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/widgets/container/WidgetGridColumn.dart';
import 'package:web_lotus/widgets/removeBeforeSlash.dart';
import 'data_input_quote_gridview.dart';

class TableInputQuote extends StatefulWidget {
  const TableInputQuote({super.key});

  @override
  State<TableInputQuote> createState() => _TableInputQuoteState();
}

class _TableInputQuoteState extends State<TableInputQuote> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => SfDataGridTheme(
          data: SfDataGridThemeData(headerColor: Colors.grey[200]),
          child: SfDataGrid(
              rowHeight: 30,
              headerRowHeight: 40,
              columnWidthMode: ColumnWidthMode.fill,
              selectionMode: SelectionMode.single,
              gridLinesVisibility: GridLinesVisibility.both,
              headerGridLinesVisibility: GridLinesVisibility.both,
              source: DataInputQuoteGridview(
                  quoteController.listInputQuoteDetail_show),
              columns: [
                WidgetGridColumn(label: 'Seq.', visible: true),
                WidgetGridColumn(label: 'eqcQuoteId', visible: false),
                WidgetGridColumn(label: 'Charge Type', visible: true),
                WidgetGridColumn(label: 'Container', visible: true),
                WidgetGridColumn(label: 'Gate In Date', visible: true),
                WidgetGridColumn(label: 'Component', visible: true),
                WidgetGridColumn(label: 'Damege Detail', visible: true),
                WidgetGridColumn(label: 'Damage Code', visible: true),
                WidgetGridColumn(label: 'Quantity', visible: true),
                WidgetGridColumn(label: 'Dimension', visible: true),
                WidgetGridColumn(label: 'Length', visible: true),
                WidgetGridColumn(label: 'Width', visible: true),
                WidgetGridColumn(label: 'Location', visible: true),
                WidgetGridColumn(label: 'Category', visible: true),
                WidgetGridColumn(label: 'Labor Cost', visible: true),
                WidgetGridColumn(label: 'Mr Cost', visible: true),
                WidgetGridColumn(label: 'Total Cost', visible: true),
                WidgetGridColumn(label: 'Image', visible: true),
                WidgetGridColumn(label: 'R', visible: true),
              ]),
        ));
  }

  // Future<void> SelectFileZip() async {
  //   try {
  //     FilePickerResult? result = await FilePicker.platform.pickFiles(
  //       type: FileType.custom,
  //       allowedExtensions: ['zip'],
  //     );
  //     final url = '$SERVER/EQCQuote/UploadFileZip';
  //     if (result != null && result.files.isNotEmpty) {
  //       final file = result.files.first;
  //       if (file.bytes != null) {
  //         // EasyLoading.show(
  //         //   status: 'Loading...',
  //         //   maskType: EasyLoadingMaskType.black,
  //         //   dismissOnTap: true,
  //         // );
  //         // Create a Blob from file data
  //         final blob = html.Blob([file.bytes!]);
  //         // Create FormData and append the Blob as a file
  //         final formData = html.FormData();
  //         formData.appendBlob('uploadfile', blob, file.name);

  //         // Send the FormData using XMLHttpRequest
  //         final request = html.HttpRequest();
  //         request.open('POST', url, async: true);

  //         // Set up event listeners
  //         request.onLoadEnd.listen((event) {
  //           if (request.status == 200) {
  //             print("File uploaded successfully");
  //           } else {
  //             print("Failed to upload file: ${request.status}");
  //           }
  //         });

  //         request.send(formData);
  //         request.onLoad.listen((html.ProgressEvent event) {
  //           switch (request.status) {
  //             case 200:
  //               var response = request.responseText;
  //               print(response);
  //               // EasyLoading.showSuccess('Upload Success');

  //               // quoteController.listInputQuoteDetail_show[i].isImgUpload = true;
  //               // quoteController.listInputQuoteDetail[i].isImgUpload = true;
  //               // setState(() {
  //               //   // print(quoteController.listInputQuoteDetail);
  //               // });
  //               print('Success send Image quote');
  //             // if (Get.isDialogOpen == true) {
  //             //   Get.back();
  //             // }
  //             default:
  //             // EasyLoading.showError('Upload Image Fail');
  //           }
  //         });
  //       } else {
  //         // EasyLoading.showError('Error File Zip');
  //       }
  //     } else {
  //       // User canceled the picker
  //       // EasyLoading.showError('No file select');
  //     }
  //   } on Exception catch (e) {
  //     // EasyLoading.showError('Fail to select file zip');
  //     print(e);
  //     throw Exception('Error select file zip - $e');
  //   }
  // }

  // List<XFile>? listImg;
  // Future getImage(String cntr, int i) async {
  //   // String? base64image;
  //   final ImagePicker _picker = ImagePicker();
  //   List<XFile> img = await _picker.pickMultiImage();

  //   listImg = img;

  //   if (listImg!.isNotEmpty) {
  //     quoteController.pathImg.value = listImg![0].path;
  //     return Get.defaultDialog(
  //       title: 'Preview Image',
  //       content: Container(
  //         height: deviceHeight(context) * 0.8,
  //         width: deviceWidth(context) * 0.8,
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Container(
  //               height: deviceHeight(context) * 0.8,
  //               width: deviceWidth(context) * 0.25,
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
  //                   height: deviceHeight(context) * 0.8,
  //                   width: deviceWidth(context) * 0.5,
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
  //                 cntr: cntr,
  //                 date: changeDatetoSend(date: DateTime.now()),
  //                 i: i);
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
  //     {required String cntr, required String date, required int i}) async {
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
  //         '$SERVER/EQCQuote/UploadImage?Container=$cntr&EstimateDate=$date';
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
  //           quoteController.listInputQuoteDetail_show[i].isImgUpload = true;
  //           quoteController.listInputQuoteDetail[i].isImgUpload = true;
  //           setState(() {
  //             // print(quoteController.listInputQuoteDetail);
  //           });
  //           print('Success send Image quote');
  //           if (Get.isDialogOpen == true) {
  //             Get.back();
  //           }
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

  Future<void> downloadAndExtractZip(
      {required String cntr, required String esdate}) async {
    try {
      // EasyLoading.show(
      //   status: 'Loading...',
      //   maskType: EasyLoadingMaskType.black,
      //   dismissOnTap: true,
      // );

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

          // EasyLoading.dismiss();

          return Get.defaultDialog(
            title: 'Preview Image',
            content: Container(
              height: deviceHeight(context) * 0.8,
              width: deviceWidth(context) * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: deviceHeight(context) * 0.8,
                    width: deviceWidth(context) * 0.25,
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
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: InkWell(
                                    onTap: () {
                                      quoteController.pathImg.value =
                                          files[index]['path'];
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
                        height: deviceHeight(context) * 0.8,
                        width: deviceWidth(context) * 0.5,
                        decoration: BoxDecoration(border: Border.all()),
                        child: Image.network(quoteController.pathImg.value,
                            errorBuilder: (BuildContext context, Object error,
                                StackTrace? stackTrace) {
                          return const Center(
                            child: Text('This image type is not supported:'),
                          );
                        }),
                      ))
                ],
              ),
            ),
            confirm: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: haian),
                onPressed: () {
                  // quoteController.pathImg.value = '';
                  Get.back();
                },
                child: Text(
                  'OK',
                  style: TextStyle(color: white),
                )),
          );
        case 404:
        // return EasyLoading.showError('No Image');
        default:
        // return EasyLoading.showError('Error: ${response.reasonPhrase}');
      }
    } on Exception catch (e) {
      // EasyLoading.showError('Error: $e');
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
