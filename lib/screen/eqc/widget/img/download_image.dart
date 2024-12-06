import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:web_lotus/assets/color.dart';
import 'package:web_lotus/assets/variable.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/widgets/removeBeforeSlash.dart';
import 'package:universal_html/html.dart' as html;
import 'package:http/http.dart' as http;

import 'upload_image_zip.dart';

bool errorImg = false;

Future<void> downloadAndExtractZip(
    {required String cntr, required String esdate}) async {
  try {
    EasyLoading.show(
      status: 'Loading...',
      maskType: EasyLoadingMaskType.black,
      dismissOnTap: true,
    );
    var url = errorImg == true
        ? '$SERVER/EQCQuote/DownloadImage?Container=$cntr&EstimateDate=$esdate'
        : '$SERVER/EQCQuote/DownloadImageComplete?Container=$cntr&EstimateDate=$esdate';

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
        int i = 0;
        int tong = 0;
        EasyLoading.dismiss();

        return Get.defaultDialog(
          title: 'Preview Image',
          content: Container(
            height: fullSizeHeight! * 0.8,
            width: fullSizeWidth! * 0.8,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 5),
                      height: fullSizeHeight! * 0.7,
                      width: fullSizeWidth! * 0.25,
                      decoration: BoxDecoration(border: Border.all()),
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: files.length,
                          itemBuilder: (BuildContext context, index) {
                            tong = files.length - 1;
                            return Row(
                              children: [
                                // Container(
                                //   width: 50,
                                //   color: white,
                                //   child: Center(child: Text('${index + 1}.')),
                                // ),
                                Container(
                                    margin: EdgeInsets.all(5),
                                    child: InkWell(
                                      onTap: () {
                                        i = index;
                                        quoteController.pathImg.value =
                                            files[index]['path'];
                                        quoteController.nameImg.value =
                                            removeBeforeSlash(
                                                files[index]['name']);
                                      },
                                      child: Text('${index + 1}. ' +
                                          removeBeforeSlash(
                                              files[index]['name'])),
                                    )),
                              ],
                            );
                          }),
                    ),
                    Obx(() => Actions(
                          actions: <Type, Action<Intent>>{
                            UpIntent: CallbackAction<UpIntent>(
                              onInvoke: (UpIntent intent) {
                                if (i == 0) {
                                } else {
                                  --i;
                                  quoteController.pathImg.value =
                                      files[i]['path'];
                                  quoteController.nameImg.value =
                                      removeBeforeSlash(files[i]['name']);
                                }
                              },
                            ),
                            DownIntent: CallbackAction<DownIntent>(
                              onInvoke: (DownIntent intent) {
                                if (i == tong) {
                                } else {
                                  ++i;
                                  quoteController.pathImg.value =
                                      files[i]['path'];
                                  quoteController.nameImg.value =
                                      removeBeforeSlash(files[i]['name']);
                                }
                              },
                            ),
                          },
                          child: Shortcuts(
                            shortcuts: <LogicalKeySet, Intent>{
                              LogicalKeySet(
                                LogicalKeyboardKey.arrowUp,
                              ): UpIntent(),
                              LogicalKeySet(
                                LogicalKeyboardKey.arrowDown,
                              ): DownIntent(),
                            },
                            child: Focus(
                              autofocus: true,
                              child: Container(
                                height: fullSizeHeight! * 0.7,
                                width: fullSizeWidth! * 0.5,
                                decoration: BoxDecoration(border: Border.all()),
                                child: Column(
                                  children: [
                                    Image.network(quoteController.pathImg.value,
                                        errorBuilder: (BuildContext context,
                                            Object error,
                                            StackTrace? stackTrace) {
                                      return const Center(
                                        child: Text(
                                            'This image type is not supported:'),
                                      );
                                    }),
                                    Center(
                                        child: Text(
                                      '${i + 1}. ' +
                                          quoteController.nameImg.value,
                                    ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: haian),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      'OK',
                      style: TextStyle(color: white),
                    )),
              ],
            ),
          ),
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
