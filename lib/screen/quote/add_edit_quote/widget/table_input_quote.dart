import 'dart:typed_data';
import 'package:archive/archive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:http/http.dart' as http;
import 'package:universal_html/html.dart' as html;
import 'package:web_lotus/assets/color.dart';
import 'package:web_lotus/assets/variable.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/widgets/removeBeforeSlash.dart';

class TableInputQuote extends StatefulWidget {
  const TableInputQuote({super.key});

  @override
  State<TableInputQuote> createState() => _TableInputQuoteState();
}

class _TableInputQuoteState extends State<TableInputQuote> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        // width: 1004,
        // alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: white,
          border: Border.all(color: blue.withOpacity(.4), width: .5),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 6),
                color: blue.withOpacity(.1),
                blurRadius: 12)
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columnSpacing: 15,
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'Seq.',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Charge',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Container',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Gate In Date',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Component',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Detail of Damage',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Damage Code',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Quantity',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Dimension',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Length',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Width',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Location',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Repair Codes',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Labor Code',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Mr. Cost',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Total Cost',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Image File',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Update Image',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Remove',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ],
            rows: <DataRow>[
              for (int i = 0; i < quoteController.countRow.value; i++)
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text((i + 1).toString())),
                    DataCell(Text(quoteController
                            .listInputQuoteDetail_show[i].chargeTypeId ??
                        '')),
                    DataCell(Text(quoteController
                            .listInputQuoteDetail_show[i].container ??
                        '')),
                    DataCell(Text(quoteController
                            .listInputQuoteDetail_show[i].inGateDate ??
                        '')),
                    DataCell(Text(quoteController
                            .listInputQuoteDetail_show[i].componentId ??
                        '')),
                    DataCell(Text(quoteController
                            .listInputQuoteDetail_show[i].damageDetail ??
                        '')),
                    DataCell(Text(
                        quoteController.listInputQuoteDetail_show[i].errorId ??
                            '')),
                    DataCell(Text(quoteController
                        .listInputQuoteDetail_show[i].quantity!
                        .toString())),
                    DataCell(Text(quoteController
                            .listInputQuoteDetail_show[i].dimension ??
                        '')),
                    DataCell(Text(quoteController
                        .listInputQuoteDetail_show[i].length!
                        .toString())),
                    DataCell(Text(quoteController
                        .listInputQuoteDetail_show[i].width!
                        .toString())),
                    DataCell(Text(
                        quoteController.listInputQuoteDetail_show[i].location ??
                            '')),
                    DataCell(Text(quoteController
                            .listInputQuoteDetail_show[i].categoryId ??
                        '')),
                    DataCell(Text(quoteController
                        .listInputQuoteDetail_show[i].laborCost!
                        .toString())),
                    DataCell(Text(quoteController
                        .listInputQuoteDetail_show[i].mrCost!
                        .toString())),
                    DataCell(Text(quoteController
                        .listInputQuoteDetail_show[i].totalCost!
                        .toString())),
                    DataCell(InkWell(
                      onTap: () {
                        downloadAndExtractZip(
                            cntr: quoteController
                                .listInputQuoteDetail_show[i].container!,
                            esdate: changeDatetoSend(date: DateTime.now()));
                      },
                      child: Text('Container', style: TextStyle(color: haian)),
                    )),
                    DataCell(Center(
                      child: InkWell(
                        onTap: () {
                          getImage(
                              ImageSource.gallery,
                              quoteController
                                  .listInputQuoteDetail_show[i].container!);
                        },
                        child: Icon(
                          Icons.add_a_photo_outlined,
                          color: haian,
                        ),
                      ),
                    )),
                    DataCell(quoteController.countRow.value != 0
                        ? InkWell(
                            onTap: () {
                              //remove infoContainer in listInfoContainer
                              quoteController.listInputQuoteDetail_show
                                  .removeAt(i);
                              quoteController.listInputQuoteDetail.removeAt(i);
                              // subtract countRowContianer
                              quoteController.countRow.value =
                                  quoteController.countRow.value - 1;
                              // if countRowContianer = 0 then Error Send Eequest
                              // quoteController.countRow.value ==
                              //         0
                              //     ? createBookingController
                              //         .boolErrorBookingRequest.value = true
                              //     : null;
                            },
                            child: Icon(Icons.delete),
                          )
                        : Text('')),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  List<XFile>? listImg;
  Future getImage(ImageSource media, String cntr) async {
    // String? base64image;
    final ImagePicker _picker = ImagePicker();
    List<XFile> img = await _picker.pickMultiImage();

    listImg = img;

    if (listImg!.isNotEmpty) {
      quoteController.pathImg.value = listImg![0].path;
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
                    itemCount: listImg!.length,
                    itemBuilder: (BuildContext context, index) {
                      return Container(
                          margin: EdgeInsets.all(15),
                          child: InkWell(
                              onTap: () {
                                quoteController.pathImg.value =
                                    listImg![index].path;
                                // print(quoteController.pathImg.value);
                              },
                              child: Text(listImg![index].name)));
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
              PostImgQuote(
                  cntr: cntr, date: changeDatetoSend(date: DateTime.now()));
            },
            child: Text(
              'Send',
              style: TextStyle(color: white),
            )),
        cancel: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: grey),
            onPressed: () {
              Get.back();
            },
            child: Text(
              'Cancel',
              style: TextStyle(color: white),
            )),
      );
    }
  }

  Future<void> PostImgQuote(
      {required String cntr, required String date}) async {
    try {
      EasyLoading.show(
        status: 'Loading...',
        maskType: EasyLoadingMaskType.black,
        dismissOnTap: true,
      );
      //PostRequest with multipartFile
      // Create a FormData object to store your files
      final formData = html.FormData();
      final url =
          '$SERVER/EQCQuote/UploadImage?Container=$cntr&EstimateDate=$date';
      // Assuming a list of XFile objects in _listImage
      if (listImg != null) {
        for (int i = 0; i < listImg!.length; i++) {
          final file = listImg![i];
          //Convert XFile to Blob
          final blob = html.Blob([await file.readAsBytes()], file.mimeType);
          // Add the Blob to the FormData object
          formData.appendBlob('uploadfile', blob, file.name);
        }
      }
      final request = html.HttpRequest();
      request.open(
        'POST',
        url,
      );
      request.send(formData);
      request.onLoad.listen((html.ProgressEvent event) {
        switch (request.status) {
          case 200:
            EasyLoading.showSuccess('Upload Success');
            print('Success send Image quote');
            if (Get.isDialogOpen == true) {
              Get.back();
            }
          default:
            EasyLoading.showError('Upload Fail');
            print('Error ${request.status} send Image quote ' + cntr);
        }
      });
    } on Exception catch (e) {
      EasyLoading.showError('Upload Fail');
      print(e);
      throw Exception('Error fetch Image - $e');
    }
  }

// List<File>? _extractedFiles;

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

          EasyLoading.dismiss();

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
                          return Container(
                              margin: EdgeInsets.all(15),
                              child: InkWell(
                                onTap: () {
                                  quoteController.pathImg.value =
                                      files[index]['path'];
                                  // print(quoteController.pathImg.value);
                                },
                                child: Text(
                                    removeBeforeSlash(files[index]['name'])),
                              ));
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
          return EasyLoading.showError('No Image');
        // Get.defaultDialog(
        //   title: 'ERROR',
        //   middleText: 'No Image',
        //   textConfirm: 'OK',
        //   onConfirm: () {
        //     Get.back();
        //   },
        // );
        default:
          return EasyLoading.showError('Error: ${response.reasonPhrase}');
        // Get.defaultDialog(
        //   title: 'ERROR',
        //   middleText: 'Error ${response.reasonPhrase}',
        //   textConfirm: 'OK',
        //   onConfirm: () {
        //     Get.back();
        //   },
        // );
        // throw Exception(response.reasonPhrase);
      }
    } on Exception catch (e) {
      EasyLoading.showError('Error: $e');
      // throw Exception('Error fetch Image - $e');
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
