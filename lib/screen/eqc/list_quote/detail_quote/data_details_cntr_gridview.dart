import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_lotus/assets/style.dart';
import 'package:web_lotus/assets/variable.dart';
import 'package:web_lotus/model/model_quote_detail.dart';
import 'package:web_lotus/screen/eqc/widget/img/download_image.dart';

class DataQuoteDetailSource extends DataGridSource {
  DataQuoteDetailSource(this._quoteDetail) {
    buildDataGridRows();
  }

  List<QuoteDetail> _quoteDetail = [];
  List<DataGridRow> dataGridRows = [];

  void buildDataGridRows() {
    dataGridRows = _quoteDetail.map<DataGridRow>((DataGridRow) {
      return DataGridRow.getDataGridRow_QuoteDetail();
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
                              cntr: row.getCells()[4].value,
                              esdate: changeDatetoSend(
                                  date: DateTime.parse(
                                      row.getCells()[14].value.toString())));
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
