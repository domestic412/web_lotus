import 'package:archive/archive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_lotus/assets/color.dart';
import 'package:web_lotus/assets/style.dart';
import 'package:web_lotus/assets/variable.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/model/model_listEQC.dart';
import 'package:web_lotus/widgets/removeBeforeSlash.dart';
import 'package:http/http.dart' as http;
import 'package:universal_html/html.dart' as html;

class DataDetailsCntrRepairSource extends DataGridSource {
  DataDetailsCntrRepairSource(this._detailsEQC) {
    // _detailsEQC_original = _detailsEQC;
    buildDataGridRows();
  }

  List<Details> _detailsEQC = [];
  // List<Details> _detailsEQC_original = [];
  List<DataGridRow> dataGridRows = [];

  void buildDataGridRows() {
    dataGridRows = _detailsEQC.map<DataGridRow>((DataGridRow) {
      return DataGridRow.getDataGridRow_DetailsEQC();
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
            child: dataGridCell.value == null ||
                    dataGridCell.value.toString().toUpperCase() == 'CANCEL' ||
                    dataGridCell.value.toString().toUpperCase() == 'NOT YET'
                ? SizedBox()
                : dataGridCell.columnName == 'Image'
                    ? InkWell(
                        onTap: () {
                          downloadAndExtractZip(
                              cntr: row.getCells()[1].value,
                              esdate: changeDatetoSend(
                                  date: DateTime.parse(
                                      row.getCells()[2].value.toString())));
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

  // void applyFilter({
  //   required String chargeType,
  //   required String component,
  //   required String category,
  //   required String damageCode,
  //   required String location,
  //   required String payer,
  //   required String approveCode,
  // }) {
  //   _detailsEQC = _detailsEQC_original
  //       .where(
  //         (element) =>
  //             element.chargeType!
  //                 .toUpperCase()
  //                 .contains(chargeType.toUpperCase()) &&
  //             element.component!
  //                 .toUpperCase()
  //                 .contains(component.toUpperCase()) &&
  //             element.category!
  //                 .toUpperCase()
  //                 .contains(category.toUpperCase()) &&
  //             element.damageCode!
  //                 .toUpperCase()
  //                 .contains(damageCode.toUpperCase()) &&
  //             element.location!
  //                 .toUpperCase()
  //                 .contains(location.toUpperCase()) &&
  //             element.payer!.toUpperCase().contains(payer.toUpperCase()) &&
  //             element.approveCode!
  //                 .toUpperCase()
  //                 .contains(approveCode.toUpperCase()),
  //       )
  //       .toList();
  //   buildDataGridRows();
  //   notifyListeners();
  // }

  // void clear() {
  //   _detailsEQC = _detailsEQC_original;
  //   buildDataGridRows();
  //   notifyListeners();
  // }

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
