import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:universal_html/html.dart' as html;
import 'package:web_lotus/assets/color.dart';
import 'package:web_lotus/assets/variable.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/model/model_quote_detail.dart';
import 'package:web_lotus/widgets/removeBeforeSlash.dart';

class DataTableQuoteDetails extends DataTableSource {
  List<EQCQuoteDetail>? data;
  String? _dt1;

  DataTableQuoteDetails({this.data});

  List<EQCQuoteDetail> list_filter(String query) {
    return data!
        .where((item) =>
            (item.chargeType?.contains(query.toUpperCase()) ?? false) ||
            (item.component?.contains(query.toUpperCase()) ?? false) ||
            (item.category?.contains(query.toUpperCase()) ?? false) ||
            (item.damageCode?.contains(query.toUpperCase()) ?? false) ||
            (item.container?.contains(query.toUpperCase()) ?? false) ||
            (item.damageDetail?.contains(query.toUpperCase()) ?? false) ||
            (item.quantity?.toString().contains(query.toUpperCase()) ??
                false) ||
            (item.dimension?.contains(query.toUpperCase()) ?? false) ||
            (item.length?.toString().contains(query.toUpperCase()) ?? false) ||
            (item.width?.toString().contains(query.toUpperCase()) ?? false) ||
            (item.location?.contains(query.toUpperCase()) ?? false) ||
            (item.laborCost?.toString().contains(query.toUpperCase()) ??
                false) ||
            (item.mrCost?.toString().contains(query.toUpperCase()) ?? false) ||
            (item.totalCost?.toString().contains(query.toUpperCase()) ??
                false) ||
            (item.estimateDate?.contains(query.toUpperCase()) ?? false) ||
            (item.payer?.contains(query.toUpperCase()) ?? false) ||
            (item.approveCode?.contains(query.toUpperCase()) ?? false))
        .toList();
  }

  @override
  DataRow? getRow(int index) {
    if (index >= data!.length) {
      return null;
    }
    final rowData = data![index];
    rowData.chargeType ??= '';
    rowData.component ??= '';
    rowData.category ??= '';
    rowData.damageCode ??= '';
    rowData.container ??= '';
    rowData.damageDetail ??= '';
    rowData.quantity ??= 0;
    rowData.dimension ??= '';
    rowData.length ??= 0;
    rowData.width ??= 0;
    rowData.location ??= '';
    rowData.laborCost ??= 0;
    rowData.mrCost ??= 0;
    rowData.totalCost ??= 0;
    rowData.payer ??= '';
    rowData.approveCode ??= '';
    rowData.estimateDate != null
        ? _dt1 = DateFormat("dd-MM-yyyy")
            .format(DateTime.parse(rowData.estimateDate!))
        : _dt1 = '';
    // rowData.ketQua == Accept ? _color = green : _color = red;

    return DataRow(cells: [
      DataCell(SizedBox(
        width: 40,
        child: Center(
          child: Text(
            (index + 1).toString(),
            // style: style_text_Table_small,
          ),
        ),
      )),
      DataCell(Text(
        rowData.chargeType!,
        // style: style_text_Table_small,
      )),
      DataCell(Text(
        rowData.component!,
        // style: style_text_Table_small,
      )),
      DataCell(Text(
        rowData.category!,
        // style: style_text_Table_small,
      )),
      DataCell(Text(
        rowData.damageCode!,
        // style: style_text_Table_small,
      )),
      DataCell(SelectableText(
        rowData.container!,
        // style: style_text_Table_small,
      )),
      DataCell(Container(
        constraints: BoxConstraints(maxWidth: 300),
        child: Text(
          rowData.damageDetail!,
          // style: style_text_Table_small,
        ),
      )),
      DataCell(Text(
        rowData.quantity!.toString(),
        // style: style_text_Table_small,
      )),
      DataCell(Text(
        rowData.dimension!,
        // style: style_text_Table_small,
      )),
      DataCell(Text(
        rowData.length!.toString(),
        // style: style_text_Table_small,
      )),
      DataCell(Text(
        rowData.width!.toString(),
        // style: style_text_Table_small,
      )),
      DataCell(Text(
        rowData.location!,
        // style: style_text_Table_small,
      )),
      DataCell(Text(
        rowData.laborCost!.toString(),
        // style: style_text_Table_small,
      )),
      DataCell(Text(
        rowData.mrCost!.toString(),
        // style: style_text_Table_small,
      )),
      DataCell(Text(
        rowData.totalCost!.toString(),
        // style: style_text_Table_small,
      )),
      DataCell(Text(
        _dt1!,
        // style: style_text_Table_small,
      )),
      DataCell(Text(
        rowData.payer!,
        // style: style_text_Table_small,
      )),
      DataCell(Text(
        rowData.approveCode!,
        // style: style_text_Table_small,
      )),
      DataCell(InkWell(
        onTap: () {
          downloadAndExtractZip(
              cntr: data![index].container!,
              esdate: data![index].estimateDate!);
        },
        child: Text(rowData.isImgUpload!, style: TextStyle(color: haian)),
      )),
      // DataCell(ElevatedButton(onPressed: (){}, child: Text('Edit'))),
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => data!.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;

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
              height: (fullSizeHeight ?? 500) * 0.8,
              width: (fullSizeWidth ?? 900) * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 5),
                    height: (fullSizeHeight ?? 500) * 0.8,
                    width: (fullSizeWidth ?? 900) * 0.25,
                    decoration: BoxDecoration(border: Border.all()),
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: files.length,
                        itemBuilder: (BuildContext context, index) {
                          return Row(
                            children: [
                              Container(
                                width: 60,
                                color: white,
                                child: Center(child: Text('${index + 1}.')),
                              ),
                              Container(
                                  margin: EdgeInsets.all(15),
                                  child: InkWell(
                                    onTap: () {
                                      quoteController.pathImg.value =
                                          files[index]['path'];
                                      print(quoteController.pathImg.value);
                                    },
                                    child: Text(removeBeforeSlash(
                                        files[index]['name'])),
                                  )),
                            ],
                          );
                        }),
                  ),
                  Obx(() => Container(
                        height: (fullSizeHeight ?? 500) * 0.8,
                        width: (fullSizeWidth ?? 900) * 0.5,
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
