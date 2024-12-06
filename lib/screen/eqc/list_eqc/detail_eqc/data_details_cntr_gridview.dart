import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_lotus/assets/style.dart';
import 'package:web_lotus/assets/variable.dart';
import 'package:web_lotus/model/model_listEQC.dart';
import 'package:web_lotus/screen/eqc/widget/img/download_image.dart';

class DataDetailsEQCSource extends DataGridSource {
  DataDetailsEQCSource(this._detailsEQC) {
    buildDataGridRows();
  }

  List<Details> _detailsEQC = [];
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
                : dataGridCell.columnName == 'Error Img' ||
                        dataGridCell.columnName == 'Repair Img'
                    ? InkWell(
                        onTap: () {
                          dataGridCell.columnName == 'Error Img'
                              ? errorImg = true
                              : errorImg = false;
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
}
