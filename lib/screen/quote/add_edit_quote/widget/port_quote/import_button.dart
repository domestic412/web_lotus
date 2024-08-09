import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadsheet_decoder/spreadsheet_decoder.dart';
import 'package:web_lotus/assets/color.dart';
import 'package:web_lotus/assets/variable.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/model/model_input_quote_detail.dart';
import 'package:web_lotus/widgets/import_excel.dart';

class ImportButton extends StatefulWidget {
  const ImportButton({super.key});

  @override
  State<ImportButton> createState() => _ImportButtonState();
}

class _ImportButtonState extends State<ImportButton> {
  @override
  Widget build(BuildContext context) {
    String? chargeCode;
    String? componentCode;
    String? categoryCode;
    String? errorCode;
    String? container;
    String? inGateDate;
    String? damageDetail;
    int? quantity;
    String? dimension;
    double? length;
    double? width;
    String? location;
    double? laborCost;
    double? mrCost;
    double? totalCost;
    String? approveCode;
    int? payer;
    return ElevatedButton(
      onPressed: () async {
        int j = 0;
        await Import().ImportExcel();
        if (resultPickedFile != null) {
          var bytes = resultPickedFile?.files.single.bytes;
          // var excel = Excel.decodeBytes(bytes!);
          var decoder = SpreadsheetDecoder.decodeBytes(bytes!, update: true);
          // choose sheet1 in file excel
          String table = 'Upload BRV';
          for (var row in decoder.tables[table]!.rows) {
            int i = 0;
            for (var cell in row) {
              // print(row);
              if ((j > 0)) {
                // print(i);
                // var value = cell?.value ?? '0';
                // cell ?? '0';
                switch (i) {
                  case 0:
                    chargeCode = cell ?? '';
                  case 1:
                    container = cell ?? '';
                  case 2:
                    inGateDate = cell ?? '';
                  case 3:
                    componentCode = cell ?? '';
                  case 4:
                    damageDetail = cell ?? '';
                  case 5:
                    errorCode = cell ?? '';
                  case 6:
                    quantity = cell ?? 0;
                  case 7:
                    dimension =
                        cell.toString() == 'null' ? '' : cell.toString();
                  case 8:
                    length = cell ?? 0;
                  case 9:
                    width = cell ?? 0;
                  case 10:
                    location = cell ?? '';
                  case 11:
                    categoryCode = cell ?? '';
                  case 12:
                    laborCost = cell ?? 0;
                  case 13:
                    mrCost = cell ?? 0;
                  case 14:
                    totalCost = cell ?? 0;
                  case 15:
                    approveCode = cell ?? '';
                  case 16:
                    payer = cell ?? 0;
                }
                i = i + 1;
              } else {}
            }
            // if ((chargeCode == null &&
            //             container == null &&
            //             inGateDate == null &&
            //             componentCode == null &&
            //             damageDetail == null &&
            //             errorCode == null &&
            //             quantity == null &&
            //             dimension == null &&
            //             length == null &&
            //             width == null &&
            //             location == null &&
            //             categoryCode == null &&
            //             laborCost == null &&
            //             mrCost == null &&
            //             totalCost == null) ||
            //         (chargeCode == null &&
            //             container == null &&
            //             inGateDate == null &&
            //             componentCode == null &&
            //             damageDetail == null &&
            //             errorCode == null &&
            //             quantity == 0 &&
            //             dimension == null &&
            //             length == 0 &&
            //             width == 0 &&
            //             location == null &&
            //             categoryCode == null &&
            //             laborCost == 0 &&
            //             mrCost == 0 &&
            //             totalCost == 0)
            // || (chargeCode == 'Dịch vụ')
            // ) {} else {
            if (j > 0) {
              if (findChargeId(chargeCode: chargeCode!) == null) {
                Get.defaultDialog(
                  middleText: 'Not found $chargeCode in data Charge',
                );
                break;
              } else if (findComponentId(componentCode: componentCode!) ==
                  null) {
                Get.defaultDialog(
                  middleText: 'Not found $componentCode in data Component',
                );
                break;
              } else if (findCategoryId(categoryCode: categoryCode!) == null) {
                Get.defaultDialog(
                  middleText: 'Not found $categoryCode in data Repair Codes',
                );
                break;
              } else if (findErrorId(errorCode: errorCode!) == null) {
                Get.defaultDialog(
                  middleText: 'Not found $errorCode in data Damage Code',
                );
                break;
              } else if (inGateDate == null) {
                Get.defaultDialog(
                  middleText: 'Please input Ingate Date',
                );
                break;
              } else {
                InputQuoteDetail _listInputQuoteDetail = InputQuoteDetail(
                    eqcQuoteId: quoteController.eqcQuoteId.value,
                    chargeTypeId: findChargeId(chargeCode: chargeCode!),
                    componentId: findComponentId(componentCode: componentCode!),
                    categoryId: findCategoryId(categoryCode: categoryCode!),
                    errorId: findErrorId(errorCode: errorCode!),
                    container: container,
                    inGateDate:
                        changeDatetoSend(date: DateTime.parse(inGateDate!)),
                    damageDetail: damageDetail,
                    quantity: quantity,
                    dimension: dimension,
                    length: length,
                    width: width,
                    location: location,
                    laborCost: laborCost,
                    mrCost: mrCost,
                    totalCost: totalCost,
                    estimateDate: quoteController.currentDate_send.value,
                    edit: 'I');
                quoteController.listInputQuoteDetail.add(_listInputQuoteDetail);

                quoteController.countRow.value =
                    quoteController.countRow.value + 1;

                InputQuoteDetail _listInputQuoteDetail_show = InputQuoteDetail(
                  chargeTypeId: chargeCode,
                  componentId: componentCode,
                  categoryId: categoryCode,
                  errorId: errorCode,
                  container: container,
                  inGateDate:
                      changeDatetoShow(date: DateTime.parse(inGateDate!)),
                  damageDetail: damageDetail,
                  quantity: quantity,
                  dimension: dimension,
                  length: length,
                  width: width,
                  location: location,
                  laborCost: laborCost,
                  mrCost: mrCost,
                  totalCost: totalCost,
                );
                quoteController.listInputQuoteDetail_show
                    .add(_listInputQuoteDetail_show);
              }
              // }
            }
            j = ++j;
          }
          chargeCode = null;
          componentCode = null;
          categoryCode = null;
          errorCode = null;
          container = null;
          inGateDate = null;
          damageDetail = null;
          quantity = null;
          dimension = null;
          length = null;
          width = null;
          location = null;
          laborCost = null;
          mrCost = null;
          totalCost = null;
          approveCode = null;
          payer = null;
        } else {
          print('no data');
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(haian),
          minimumSize: MaterialStateProperty.all(Size(100, 50))),
      child: Text('Import'),
    );
  }
}

findChargeId({required String chargeCode}) {
  for (var charge in quoteController.listCharge) {
    if (charge.chargeTypeCode!.trim() == chargeCode.trim()) {
      return charge.chargeTypeId;
    }
  }
}

findComponentId({required String componentCode}) {
  for (var component in quoteController.listComponent) {
    if (component.componentCode!.trim() == componentCode.trim()) {
      return component.componentId;
    }
  }
}

findErrorId({required String errorCode}) {
  for (var error in quoteController.listError) {
    if (error.errorCode!.trim() == errorCode.trim()) {
      return error.errorId;
    }
  }
}

findCategoryId({required String categoryCode}) {
  for (var category in quoteController.listCategory) {
    if (category.categoryCode!.trim() == categoryCode.trim()) {
      return category.categoryId;
    }
  }
}
