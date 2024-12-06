import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_lotus/assets/color.dart';
import 'package:web_lotus/assets/style.dart';
import 'package:web_lotus/assets/variable.dart';
import 'package:web_lotus/model/model_listEQC.dart';
import 'package:web_lotus/screen/eqc/widget/img/select_img_upload.dart';

class DataRepairCompleteSource extends DataGridSource {
  DataRepairCompleteSource(this._listEQC) {
    _listEQC = _listEQC
        .where((element) =>
            element.approveDate != null && element.approveCode != 'Cancel')
        .toList();
    _listEQC_original = _listEQC;
    buildDataGridRows();
  }

  List<ListEQC> _listEQC = [];
  List<ListEQC> _listEQC_original = [];
  List<DataGridRow> dataGridRows = [];

  void buildDataGridRows() {
    dataGridRows = _listEQC.map<DataGridRow>((DataGridRow) {
      return DataGridRow.getDataGridRow_RepairComplete();
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
                ? InkWell(
                    child: Icon(
                      Icons.add_a_photo_outlined,
                      color: haian,
                      size: 14,
                    ),
                    onTap: () {
                      getImage(
                          cntr: row.getCells()[2].value,
                          inGateDate: changeStringDatetoSend(
                              date: row.getCells()[3].value));
                    },
                  )
                : dataGridCell.columnName == 'Request' ||
                        dataGridCell.columnName == 'Approval' ||
                        dataGridCell.columnName == 'Complete'
                    ? Text(
                        changeStringDatetoShow(
                            date: dataGridCell.value.toString()),
                        style: style11_black,
                        overflow: TextOverflow.ellipsis)
                    : Text(dataGridCell.value.toString(),
                        style: style11_black, overflow: TextOverflow.ellipsis),
          ))
    ].toList());
  }

  void applyFilter({
    required String depot,
    required String cntr,
    // required String size,
    required String quoteCcy,
    // required String approveCode,
    required String quoteNo,
  }) {
    _listEQC = _listEQC_original
        .where((element) =>
            element.depot!.toUpperCase().contains(depot.toUpperCase()) &&
            element.quoteNo!.toUpperCase().contains(quoteNo.toUpperCase()) &&
            element.container!.toUpperCase().contains(cntr.toUpperCase()) &&
            // element.size!.toUpperCase().contains(size.toUpperCase()) &&
            element.quoteCcy!.toUpperCase().contains(quoteCcy.toUpperCase()))
        .toList();
    buildDataGridRows();
    notifyListeners();
  }

  void clear() {
    _listEQC = _listEQC_original;
    buildDataGridRows();
    notifyListeners();
  }
}
