import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:universal_html/html.dart' as html;
import 'package:web_lotus/assets/color.dart';
import 'package:web_lotus/assets/variable.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/screen/eqc/repair_complete/list_repair_complete_page.dart';
import 'package:web_lotus/screen/eqc/repair_complete/support_page.dart';

import 'upload_image_zip.dart';

Future getImage({
  required String cntr,
  required String inGateDate,
}) async {
  final ImagePicker _picker = ImagePicker();
  List<XFile> img = await _picker.pickMultiImage();
  // List<XFile>? listImg;
  List<XFile> listImg = img;
  int i = 0;
  int tong = 0;
  var completeDate = DateTime.now();

  if (listImg.isNotEmpty) {
    quoteController.pathImg.value = listImg[0].path;
    quoteController.nameImg.value = listImg[0].name;
    return Get.defaultDialog(
      title: 'Preview Image',
      titlePadding: EdgeInsets.all(5),
      contentPadding: EdgeInsets.all(5),
      content: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     // WidgetContainerLabel(label: 'Date Completed'),
          //     Container(
          //       width: 120,
          //       padding: const EdgeInsets.all(5),
          //       margin: const EdgeInsets.all(5),
          //       color: const Color.fromARGB(255, 92, 117, 160),
          //       child: Text(
          //         'Date Completed',
          //         style: style11_white,
          //       ),
          //     ),
          //     CustomPopup(
          //       showArrow: false,
          //       content: SizedBox(
          //         height: 270,
          //         width: 270,
          //         child: CalendarDatePicker(
          //           initialDate: completeDate,
          //           firstDate: DateTime(2024),
          //           lastDate: DateTime(2123),
          //           onDateChanged: (value) {
          //             // quoteController.fromDate_text.value =
          //             //     DateFormat('dd/MM/yyyy').format(value);
          //             completeDate = value;
          //           },
          //         ),
          //       ),
          //       child: Container(
          //         decoration: BoxDecoration(border: Border.all(color: grey)),
          //         margin: EdgeInsets.symmetric(horizontal: 10),
          //         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          //         child: Text(
          //           changeDatetoShow(date: completeDate),
          //           style: style11_black,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          Container(
            height: fullSizeHeight! * 0.8,
            width: fullSizeWidth! * 0.8,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: fullSizeHeight! * 0.7,
                      width: fullSizeWidth! * 0.25,
                      decoration:
                          BoxDecoration(color: white, border: Border.all()),
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: listImg.length,
                          itemBuilder: (BuildContext context, index) {
                            tong = listImg.length - 1;
                            return Row(
                              children: [
                                Container(
                                  width: 50,
                                  color: white,
                                  child: Center(child: Text('${index + 1}.')),
                                ),
                                Container(
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    child: InkWell(
                                        onTap: () {
                                          i = index;
                                          quoteController.pathImg.value =
                                              listImg[index].path;
                                          quoteController.nameImg.value =
                                              listImg[index].name;
                                        },
                                        child: Text(
                                          listImg[index].name,
                                          softWrap: true,
                                        ))),
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
                                      listImg[i].path;
                                  quoteController.nameImg.value =
                                      listImg[i].name;
                                }
                              },
                            ),
                            DownIntent: CallbackAction<DownIntent>(
                              onInvoke: (DownIntent intent) {
                                if (i == tong) {
                                } else {
                                  ++i;
                                  quoteController.pathImg.value =
                                      listImg[i].path;
                                  quoteController.nameImg.value =
                                      listImg[i].name;
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
                                  decoration: BoxDecoration(
                                      color: white, border: Border.all()),
                                  child: Column(
                                    children: [
                                      Image.network(
                                        quoteController.pathImg.value,
                                        errorBuilder: (BuildContext context,
                                            Object error,
                                            StackTrace? stackTrace) {
                                          return const Center(
                                            child: Text(
                                                'This image type is not supported:'),
                                          );
                                        },
                                      ),
                                      Center(
                                        child: Text(
                                          quoteController.nameImg.value,
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: haian),
                        onPressed: () {
                          PostImgQuote(
                              cntr: cntr,
                              inGateDate: inGateDate,
                              completeDate:
                                  changeDatetoSend(date: completeDate),
                              listImg: listImg);
                        },
                        child: Text(
                          'Send Repair Photos',
                          style: TextStyle(color: white),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: grey),
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: white),
                        )),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> PostImgQuote(
    {required String cntr,
    required String inGateDate,
    required String completeDate,
    required List<XFile> listImg}) async {
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
        '$SERVER/EQCQuote/UploadCompleteImg?Container=$cntr&InGateDate=$inGateDate&CompleteDate=$completeDate';
    // Assuming a list of XFile objects in _listImage
    for (int i = 0; i < listImg.length; i++) {
      final file = listImg[i];
      //Convert XFile to Blob
      final blob = html.Blob([await file.readAsBytes()], file.mimeType);
      // Add the Blob to the FormData object
      formData.appendBlob('uploadfile', blob, file.name);
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

          Get.to(SupportPage());
          Get.to(() => ListRepairCompletePage());
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
