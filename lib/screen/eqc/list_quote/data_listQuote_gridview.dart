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
import 'package:http/http.dart' as http;
import 'package:universal_html/html.dart' as html;
import 'package:web_lotus/model/model_quote_list.dart';
import 'package:web_lotus/widgets/removeBeforeSlash.dart';

class DataQuoteListSource extends DataGridSource {
  DataQuoteListSource(this._quoteList) {
    _quoteList_original = _quoteList;
    buildDataGridRows();
  }

  List<QuoteList> _quoteList = [];
  List<QuoteList> _quoteList_original = [];
  List<DataGridRow> dataGridRows = [];
  // String remarks = '';
  bool reject = false;

  void buildDataGridRows() {
    dataGridRows = _quoteList.map<DataGridRow>((DataGridRow) {
      return DataGridRow.getDataGridRow_QuoteList();
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
        // if (dataGridCell.columnName == 'Approval') {
        //   if (dataGridCell.value == null) {
        //     remarks = 'Waiting for approval';
        //   } else {
        //     remarks = '';
        //   }
        // }
        return Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(5.0),
          child: dataGridCell.value == null ||
                  dataGridCell.value.toString().toUpperCase() == 'CANCEL'
              ? SizedBox()
              : dataGridCell.columnName == 'Estimate Date' ||
                      dataGridCell.columnName == 'Approve Date'
                  ? Text(
                      changeStringDatetoShow(
                          date: dataGridCell.value.toString()),
                      style: style11_black,
                      overflow: TextOverflow.ellipsis)
                  // : dataGridCell.columnName == 'Remarks'
                  //     ? Text(remarks,
                  //         style: style11_black, overflow: TextOverflow.ellipsis)
                  : Text(dataGridCell.value.toString(),
                      style: style11_black, overflow: TextOverflow.ellipsis),
        );
      })
    ].toList());
  }

  void applyFilter({
    required String portDepot,
    required String quoteNo,
    required String quoteCcy,
    required String quoteStatus,
    // required String approveCode,
  }) {
    _quoteList = _quoteList_original
        .where((element) =>
            element.quoteNo!.toUpperCase().contains(quoteNo.toUpperCase()) &&
            element.portDepot!
                .toUpperCase()
                .contains(portDepot.toUpperCase()) &&
            element.quoteCcy!.toUpperCase().contains(quoteCcy.toUpperCase()) &&
            element.quoteStatus!
                .toUpperCase()
                .contains(quoteStatus.toUpperCase()))
        .toList();
    buildDataGridRows();
    notifyListeners();
  }

  void clear() {
    _quoteList = _quoteList_original;
    buildDataGridRows();
    notifyListeners();
  }
}
