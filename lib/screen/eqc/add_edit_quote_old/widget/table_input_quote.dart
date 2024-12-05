// import 'dart:io';
// import 'dart:typed_data';
// import 'package:archive/archive.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// // import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

// import 'package:http/http.dart' as http;
// import 'package:universal_html/html.dart' as html;
// import 'package:web_lotus/assets/color.dart';
// import 'package:web_lotus/assets/variable.dart';
// import 'package:web_lotus/controller/init_quote_controller.dart';
// import 'package:web_lotus/widgets/removeBeforeSlash.dart';

// import 'info_cont_quote.dart/widget/widget_category.dart';
// import 'info_cont_quote.dart/widget/widget_charge.dart';
// import 'info_cont_quote.dart/widget/widget_component.dart';
// import 'info_cont_quote.dart/widget/widget_container.dart';
// import 'info_cont_quote.dart/widget/widget_demension.dart';
// import 'info_cont_quote.dart/widget/widget_detailDamage.dart';
// import 'info_cont_quote.dart/widget/widget_error.dart';
// import 'info_cont_quote.dart/widget/widget_gateInDate.dart';
// import 'info_cont_quote.dart/widget/widget_laborCost.dart';
// import 'info_cont_quote.dart/widget/widget_length.dart';
// import 'info_cont_quote.dart/widget/widget_location.dart';
// import 'info_cont_quote.dart/widget/widget_mrCost.dart';
// import 'info_cont_quote.dart/widget/widget_quantity.dart';
// import 'info_cont_quote.dart/widget/widget_totalCost.dart';
// import 'info_cont_quote.dart/widget/widget_width.dart';

// class TableInputQuote extends StatefulWidget {
//   const TableInputQuote({super.key});

//   @override
//   State<TableInputQuote> createState() => _TableInputQuoteState();
// }

// class _TableInputQuoteState extends State<TableInputQuote> {
//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => Expanded(
//         child: Container(
//           // width: 1004,
//           // alignment: Alignment.topCenter,
//           decoration: BoxDecoration(
//             color: white,
//             border: Border.all(color: blue.withOpacity(.4), width: .5),
//             boxShadow: [
//               BoxShadow(
//                   offset: const Offset(0, 6),
//                   color: blue.withOpacity(.1),
//                   blurRadius: 12)
//             ],
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: DataTable(
//               columnSpacing: 15,
//               columns: <DataColumn>[
//                 const DataColumn(
//                   label: Text(
//                     'Seq.',
//                     style: TextStyle(fontStyle: FontStyle.italic),
//                   ),
//                 ),
//                 const DataColumn(
//                   label: Text(
//                     'Charge',
//                     style: TextStyle(fontStyle: FontStyle.italic),
//                   ),
//                 ),
//                 const DataColumn(
//                   label: Text(
//                     'Container',
//                     style: TextStyle(fontStyle: FontStyle.italic),
//                   ),
//                 ),
//                 const DataColumn(
//                   label: Text(
//                     'Gate In Date',
//                     style: TextStyle(fontStyle: FontStyle.italic),
//                   ),
//                 ),
//                 const DataColumn(
//                   label: Text(
//                     'Component',
//                     style: TextStyle(fontStyle: FontStyle.italic),
//                   ),
//                 ),
//                 const DataColumn(
//                   label: Text(
//                     'Detail of Damage',
//                     style: TextStyle(fontStyle: FontStyle.italic),
//                   ),
//                 ),
//                 const DataColumn(
//                   label: Text(
//                     'Damage Code',
//                     style: TextStyle(fontStyle: FontStyle.italic),
//                   ),
//                 ),
//                 const DataColumn(
//                   label: Text(
//                     'Quantity',
//                     style: TextStyle(fontStyle: FontStyle.italic),
//                   ),
//                 ),
//                 const DataColumn(
//                   label: Text(
//                     'Dimension',
//                     style: TextStyle(fontStyle: FontStyle.italic),
//                   ),
//                 ),
//                 const DataColumn(
//                   label: Text(
//                     'Length',
//                     style: TextStyle(fontStyle: FontStyle.italic),
//                   ),
//                 ),
//                 const DataColumn(
//                   label: Text(
//                     'Width',
//                     style: TextStyle(fontStyle: FontStyle.italic),
//                   ),
//                 ),
//                 const DataColumn(
//                   label: Text(
//                     'Location',
//                     style: TextStyle(fontStyle: FontStyle.italic),
//                   ),
//                 ),
//                 const DataColumn(
//                   label: Text(
//                     'Repair Codes',
//                     style: TextStyle(fontStyle: FontStyle.italic),
//                   ),
//                 ),
//                 const DataColumn(
//                   label: Text(
//                     'Labor Code',
//                     style: TextStyle(fontStyle: FontStyle.italic),
//                   ),
//                 ),
//                 const DataColumn(
//                   label: Text(
//                     'Mr. Cost',
//                     style: TextStyle(fontStyle: FontStyle.italic),
//                   ),
//                 ),
//                 const DataColumn(
//                   label: Text(
//                     'Total Cost',
//                     style: TextStyle(fontStyle: FontStyle.italic),
//                   ),
//                 ),
//                 DataColumn(
//                   label: InkWell(
//                     onTap: () {
//                       SelectFileZip();
//                     },
//                     child: const Text(
//                       // 'Image File',
//                       'Upload Image',
//                       style: TextStyle(fontStyle: FontStyle.italic),
//                     ),
//                   ),
//                 ),
//                 // DataColumn(
//                 //   label: Text(
//                 //     'Update Image',
//                 //     style: TextStyle(fontStyle: FontStyle.italic),
//                 //   ),
//                 // ),
//                 const DataColumn(
//                   label: Text(
//                     '',
//                   ),
//                 ),
//                 const DataColumn(
//                   label: Text(
//                     'Remove',
//                     style: TextStyle(fontStyle: FontStyle.italic),
//                   ),
//                 ),
//               ],
//               rows: <DataRow>[
//                 for (int i = 0; i < quoteController.countRow.value; i++)
//                   DataRow(
//                     cells: <DataCell>[
//                       DataCell(Text((i + 1).toString())),
//                       DataCell(Text(quoteController
//                               .listInputQuoteDetail_show[i].chargeTypeId ??
//                           '')),
//                       DataCell(Text(quoteController
//                               .listInputQuoteDetail_show[i].container ??
//                           '')),
//                       DataCell(Text(quoteController
//                               .listInputQuoteDetail_show[i].inGateDate ??
//                           '')),
//                       DataCell(Text(quoteController
//                               .listInputQuoteDetail_show[i].componentId ??
//                           '')),
//                       DataCell(Text(quoteController
//                               .listInputQuoteDetail_show[i].damageDetail ??
//                           '')),
//                       DataCell(Text(quoteController
//                               .listInputQuoteDetail_show[i].errorId ??
//                           '')),
//                       DataCell(Text(quoteController
//                           .listInputQuoteDetail_show[i].quantity!
//                           .toString())),
//                       DataCell(Text(quoteController
//                               .listInputQuoteDetail_show[i].dimension ??
//                           '')),
//                       DataCell(Text(quoteController
//                           .listInputQuoteDetail_show[i].length!
//                           .toString())),
//                       DataCell(Text(quoteController
//                           .listInputQuoteDetail_show[i].width!
//                           .toString())),
//                       DataCell(Text(quoteController
//                               .listInputQuoteDetail_show[i].location ??
//                           '')),
//                       DataCell(Text(quoteController
//                               .listInputQuoteDetail_show[i].categoryId ??
//                           '')),
//                       DataCell(Text(quoteController
//                           .listInputQuoteDetail_show[i].laborCost!
//                           .toString())),
//                       DataCell(Text(quoteController
//                           .listInputQuoteDetail_show[i].mrCost!
//                           .toString())),
//                       DataCell(Text(quoteController
//                           .listInputQuoteDetail_show[i].totalCost!
//                           .toString())),
//                       DataCell(
//                         quoteController
//                                     .listInputQuoteDetail_show[i].isImgUpload ==
//                                 true
//                             ? InkWell(
//                                 onTap: () {
//                                   downloadAndExtractZip(
//                                       cntr: quoteController
//                                           .listInputQuoteDetail_show[i]
//                                           .container!,
//                                       esdate: changeDatetoSend(
//                                           date: DateTime.now()));
//                                 },
//                                 child: Text(
//                                     quoteController.listInputQuoteDetail_show[i]
//                                             .container ??
//                                         '',
//                                     style: TextStyle(color: haian)),
//                               )
//                             : const SizedBox.shrink(),
//                       ),
//                       // DataCell(Center(
//                       //   child: InkWell(
//                       //     onTap: () {
//                       //       getImage(
//                       //           quoteController
//                       //               .listInputQuoteDetail_show[i].container!,
//                       //           i);
//                       //     },
//                       //     child: Icon(
//                       //       Icons.add_a_photo_outlined,
//                       //       color: haian,
//                       //     ),
//                       //   ),
//                       // )),
//                       DataCell(quoteController.countRow.value != 0
//                           ? InkWell(
//                               onTap: () {
//                                 // quoteController.chargeName.value = quoteController.listInputQuoteDetail_show[i].chargeTypeId!;
//                                 // quoteController.container.value.text = quoteController.listInputQuoteDetail_show[i].container!;
//                                 // // quoteController.gateInDate_text.value = quoteController.listInputQuoteDetail_show[i].inGateDate!;
//                                 // quoteController.componentName.value = quoteController.listInputQuoteDetail_show[i].componentId!;
//                                 // quoteController.detailDamage.value.text = quoteController.listInputQuoteDetail_show[i].damageDetail!;
//                                 // quoteController.errorName.value = quoteController.listInputQuoteDetail_show[i].errorId!;
//                                 // quoteController.quantity.value.text = quoteController.listInputQuoteDetail_show[i].quantity!.toString();
//                                 // quoteController.dimension.value.text = quoteController.listInputQuoteDetail_show[i].dimension!;
//                                 // quoteController.length.value.text = quoteController.listInputQuoteDetail_show[i].length!.toString();
//                                 // quoteController.width.value.text = quoteController.listInputQuoteDetail_show[i].width!.toString();
//                                 // quoteController.location.value.text = quoteController.listInputQuoteDetail_show[i].location!;
//                                 // quoteController.categoryName.value = quoteController.listInputQuoteDetail_show[i].categoryId!;
//                                 // quoteController.laborCost.value.text = quoteController.listInputQuoteDetail_show[i].laborCost!.toString();
//                                 // quoteController.mrCost.value.text = quoteController.listInputQuoteDetail_show[i].mrCost!.toString();
//                                 // quoteController.totalCost.value.text = quoteController.listInputQuoteDetail_show[i].totalCost!.toString();
//                                 _dialogChangeQuote(context, i);
//                               },
//                               child: const Icon(
//                                 Icons.settings,
//                               ),
//                             )
//                           : const Text('')),
//                       DataCell(quoteController.countRow.value != 0
//                           ? InkWell(
//                               onTap: () {
//                                 //remove infoContainer in listInfoContainer
//                                 quoteController.listInputQuoteDetail_show
//                                     .removeAt(i);
//                                 quoteController.listInputQuoteDetail
//                                     .removeAt(i);
//                                 // subtract countRowContianer
//                                 quoteController.countRow.value =
//                                     quoteController.countRow.value - 1;
//                                 // if countRowContianer = 0 then Error Send Eequest
//                                 // quoteController.countRow.value ==
//                                 //         0
//                                 //     ? createBookingController
//                                 //         .boolErrorBookingRequest.value = true
//                                 //     : null;
//                               },
//                               child: const Icon(Icons.delete),
//                             )
//                           : const Text('')),
//                     ],
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> _dialogChangeQuote(BuildContext context, int i) async {
//     return showDialog(
//         context: context,
//         builder: ((BuildContext context) {
//           return AlertDialog(
//             content: Container(
//               height: 250,
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(top: 10, bottom: 5),
//                       child: const Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           WidgetCharge(),
//                           WidgetContainer(),
//                           WidgetGetInDate(),
//                           WidgetComponent(),
//                           WidgetDetailDamage(),
//                           WidgetError(),
//                           WidgetQuantity(),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(top: 5, bottom: 10),
//                       child: const Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           WidgetDemension(),
//                           WidgetLength(),
//                           WidgetWidth(),
//                           WidgetLocation(),
//                           WidgetCategory(),
//                           WidgetLaborCost(),
//                           WidgetMrCost(),
//                           WidgetTotalCost(),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         ElevatedButton(
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                             // quoteController
//                             //         .listInputQuoteDetail_show[i].chargeTypeId =
//                             //     quoteController.chargeName.value;
//                             // quoteController
//                             //         .listInputQuoteDetail[i].chargeTypeId =
//                             //     quoteController.chargeTypeId.value;
//                           },
//                           style: ButtonStyle(
//                               backgroundColor:
//                                   MaterialStatePropertyAll<Color>(haian),
//                               minimumSize:
//                                   MaterialStateProperty.all(Size(100, 40))),
//                           child: Text('OK'),
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         ElevatedButton(
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                           style: ButtonStyle(
//                               backgroundColor:
//                                   MaterialStatePropertyAll<Color>(grey),
//                               minimumSize:
//                                   MaterialStateProperty.all(Size(100, 40))),
//                           child: Text('Cancel'),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         }));
//   }

//   // Future<void> SelectFileZip() async {
//   //   try {
//   //     FilePickerResult? result = await FilePicker.platform.pickFiles(
//   //       type: FileType.custom,
//   //       allowedExtensions: ['zip'],
//   //     );
//   //     final url = '$SERVER/EQCQuote/UploadFileZip';
//   //     if (result != null && result.files.isNotEmpty) {
//   //       final file = result.files.first;
//   //       if (file.bytes != null) {
//   //         // EasyLoading.show(
//   //         //   status: 'Loading...',
//   //         //   maskType: EasyLoadingMaskType.black,
//   //         //   dismissOnTap: true,
//   //         // );
//   //         // Create a Blob from file data
//   //         final blob = html.Blob([file.bytes!]);
//   //         // Create FormData and append the Blob as a file
//   //         final formData = html.FormData();
//   //         formData.appendBlob('uploadfile', blob, file.name);

//   //         // Send the FormData using XMLHttpRequest
//   //         final request = html.HttpRequest();
//   //         request.open('POST', url, async: true);

//   //         // Set up event listeners
//   //         request.onLoadEnd.listen((event) {
//   //           if (request.status == 200) {
//   //             print("File uploaded successfully");
//   //           } else {
//   //             print("Failed to upload file: ${request.status}");
//   //           }
//   //         });

//   //         request.send(formData);
//   //         request.onLoad.listen((html.ProgressEvent event) {
//   //           switch (request.status) {
//   //             case 200:
//   //               var response = request.responseText;
//   //               print(response);
//   //               // EasyLoading.showSuccess('Upload Success');

//   //               // quoteController.listInputQuoteDetail_show[i].isImgUpload = true;
//   //               // quoteController.listInputQuoteDetail[i].isImgUpload = true;
//   //               // setState(() {
//   //               //   // print(quoteController.listInputQuoteDetail);
//   //               // });
//   //               print('Success send Image quote');
//   //             // if (Get.isDialogOpen == true) {
//   //             //   Get.back();
//   //             // }
//   //             default:
//   //             // EasyLoading.showError('Upload Image Fail');
//   //           }
//   //         });
//   //       } else {
//   //         // EasyLoading.showError('Error File Zip');
//   //       }
//   //     } else {
//   //       // User canceled the picker
//   //       // EasyLoading.showError('No file select');
//   //     }
//   //   } on Exception catch (e) {
//   //     // EasyLoading.showError('Fail to select file zip');
//   //     print(e);
//   //     throw Exception('Error select file zip - $e');
//   //   }
//   // }

//   List<XFile>? listImg;
//   Future getImage(String cntr, int i) async {
//     // String? base64image;
//     final ImagePicker _picker = ImagePicker();
//     List<XFile> img = await _picker.pickMultiImage();

//     listImg = img;

//     if (listImg!.isNotEmpty) {
//       quoteController.pathImg.value = listImg![0].path;
//       return Get.defaultDialog(
//         title: 'Preview Image',
//         content: Container(
//           height: deviceHeight(context) * 0.8,
//           width: deviceWidth(context) * 0.8,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 height: deviceHeight(context) * 0.8,
//                 width: deviceWidth(context) * 0.25,
//                 decoration: BoxDecoration(border: Border.all()),
//                 child: ListView.builder(
//                     scrollDirection: Axis.vertical,
//                     itemCount: listImg!.length,
//                     itemBuilder: (BuildContext context, index) {
//                       return Row(
//                         children: [
//                           Container(
//                             width: 50,
//                             color: white,
//                             child: Center(child: Text('${index + 1}.')),
//                           ),
//                           Container(
//                               margin: EdgeInsets.symmetric(vertical: 10),
//                               child: InkWell(
//                                   onTap: () {
//                                     quoteController.pathImg.value =
//                                         listImg![index].path;
//                                     // print(quoteController.pathImg.value);
//                                   },
//                                   child: Text(listImg![index].name))),
//                         ],
//                       );
//                     }),
//               ),
//               Obx(() => Container(
//                     height: deviceHeight(context) * 0.8,
//                     width: deviceWidth(context) * 0.5,
//                     decoration: BoxDecoration(border: Border.all()),
//                     child: Image.network(quoteController.pathImg.value,
//                         errorBuilder: (BuildContext context, Object error,
//                             StackTrace? stackTrace) {
//                       return const Center(
//                         child: Text('This image type is not supported:'),
//                       );
//                     }),
//                   ))
//             ],
//           ),
//         ),
//         confirm: ElevatedButton(
//             style: ElevatedButton.styleFrom(backgroundColor: haian),
//             onPressed: () {
//               PostImgQuote(
//                   cntr: cntr,
//                   date: changeDatetoSend(date: DateTime.now()),
//                   i: i);
//             },
//             child: Text(
//               'Send',
//               style: TextStyle(color: white),
//             )),
//         cancel: ElevatedButton(
//             style: ElevatedButton.styleFrom(backgroundColor: grey),
//             onPressed: () {
//               Get.back();
//             },
//             child: Text(
//               'Cancel',
//               style: TextStyle(color: white),
//             )),
//       );
//     }
//   }

//   Future<void> PostImgQuote(
//       {required String cntr, required String date, required int i}) async {
//     try {
//       EasyLoading.show(
//         status: 'Loading...',
//         maskType: EasyLoadingMaskType.black,
//         dismissOnTap: true,
//       );
//       //PostRequest with multipartFile
//       // Create a FormData object to store your files
//       final formData = html.FormData();
//       final url =
//           '$SERVER/EQCQuote/UploadImage?Container=$cntr&EstimateDate=$date';
//       // Assuming a list of XFile objects in _listImage
//       if (listImg != null) {
//         for (int i = 0; i < listImg!.length; i++) {
//           final file = listImg![i];
//           //Convert XFile to Blob
//           final blob = html.Blob([await file.readAsBytes()], file.mimeType);
//           // Add the Blob to the FormData object
//           formData.appendBlob('uploadfile', blob, file.name);
//         }
//       }
//       final request = html.HttpRequest();
//       request.open(
//         'POST',
//         url,
//       );
//       request.send(formData);
//       request.onLoad.listen((html.ProgressEvent event) {
//         switch (request.status) {
//           case 200:
//             EasyLoading.showSuccess('Upload Success');
//             quoteController.listInputQuoteDetail_show[i].isImgUpload = true;
//             quoteController.listInputQuoteDetail[i].isImgUpload = true;
//             setState(() {
//               // print(quoteController.listInputQuoteDetail);
//             });
//             print('Success send Image quote');
//             if (Get.isDialogOpen == true) {
//               Get.back();
//             }
//           default:
//             EasyLoading.showError('Upload Fail');
//             print('Error ${request.status} send Image quote ' + cntr);
//         }
//       });
//     } on Exception catch (e) {
//       EasyLoading.showError('Upload Fail');
//       print(e);
//       throw Exception('Error fetch Image - $e');
//     }
//   }

//   // Future<void> downloadAndExtractZip(
//   //     {required String cntr, required String esdate}) async {
//   //   try {
//   //     // EasyLoading.show(
//   //     //   status: 'Loading...',
//   //     //   maskType: EasyLoadingMaskType.black,
//   //     //   dismissOnTap: true,
//   //     // );

//   //     var url =
//   //         '$SERVER/EQCQuote/DownloadImage?Container=$cntr&EstimateDate=$esdate';

//   //     final response = await http.get(Uri.parse(url), headers: {
//   //       "Access-Control-Allow-Origin": "*",
//   //       "Access-Control-Allow-Methods": "GET", //use fot http, not use https
//   //     });
//   //     switch (response.statusCode) {
//   //       case 200:
//   //         Uint8List bytes = response.bodyBytes;
//   //         List<dynamic> files = await _extractZipFile(bytes);
//   //         quoteController.pathImg.value = files[0]['path'];

//   //         // EasyLoading.dismiss();

//   //         return Get.defaultDialog(
//   //           title: 'Preview Image',
//   //           content: Container(
//   //             height: deviceHeight(context) * 0.8,
//   //             width: deviceWidth(context) * 0.8,
//   //             child: Row(
//   //               mainAxisAlignment: MainAxisAlignment.center,
//   //               children: [
//   //                 Container(
//   //                   height: deviceHeight(context) * 0.8,
//   //                   width: deviceWidth(context) * 0.25,
//   //                   decoration: BoxDecoration(border: Border.all()),
//   //                   child: ListView.builder(
//   //                       scrollDirection: Axis.vertical,
//   //                       itemCount: files.length,
//   //                       itemBuilder: (BuildContext context, index) {
//   //                         return Row(
//   //                           children: [
//   //                             Container(
//   //                               width: 50,
//   //                               color: white,
//   //                               child: Center(child: Text('${index + 1}.')),
//   //                             ),
//   //                             Container(
//   //                                 margin:
//   //                                     const EdgeInsets.symmetric(vertical: 10),
//   //                                 child: InkWell(
//   //                                   onTap: () {
//   //                                     quoteController.pathImg.value =
//   //                                         files[index]['path'];
//   //                                     // print(quoteController.pathImg.value);
//   //                                   },
//   //                                   child: Text(removeBeforeSlash(
//   //                                       files[index]['name'])),
//   //                                 )),
//   //                           ],
//   //                         );
//   //                       }),
//   //                 ),
//   //                 Obx(() => Container(
//   //                       height: deviceHeight(context) * 0.8,
//   //                       width: deviceWidth(context) * 0.5,
//   //                       decoration: BoxDecoration(border: Border.all()),
//   //                       child: Image.network(quoteController.pathImg.value,
//   //                           errorBuilder: (BuildContext context, Object error,
//   //                               StackTrace? stackTrace) {
//   //                         return const Center(
//   //                           child: Text('This image type is not supported:'),
//   //                         );
//   //                       }),
//   //                     ))
//   //               ],
//   //             ),
//   //           ),
//   //           confirm: ElevatedButton(
//   //               style: ElevatedButton.styleFrom(backgroundColor: haian),
//   //               onPressed: () {
//   //                 // quoteController.pathImg.value = '';
//   //                 Get.back();
//   //               },
//   //               child: Text(
//   //                 'OK',
//   //                 style: TextStyle(color: white),
//   //               )),
//   //         );
//   //       case 404:
//   //       // return EasyLoading.showError('No Image');
//   //       default:
//   //       // return EasyLoading.showError('Error: ${response.reasonPhrase}');
//   //     }
//   //   } on Exception catch (e) {
//   //     // EasyLoading.showError('Error: $e');
//   //   }
//   // }

//   // Future<List<dynamic>> _extractZipFile(Uint8List zipData) async {
//   //   final archive = ZipDecoder().decodeBytes(zipData);
//   //   final extractedFiles = [];
//   //   for (final file in archive) {
//   //     if (file.isFile) {
//   //       final data = file.content as List<int>;
//   //       final name = file.name;
//   //       final blob = html.Blob([data], 'image/png');
//   //       final url = html.Url.createObjectUrlFromBlob(blob);
//   //       extractedFiles.add({'name': name, 'path': url});
//   //     }
//   //   }
//   //   return extractedFiles;
//   // }
// }
