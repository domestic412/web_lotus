import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_lotus/assets/style.dart';
import 'package:web_lotus/assets/variable.dart';
import 'package:web_lotus/model/model_quote_list.dart';

class DataQuoteListSource extends DataGridSource {
  DataQuoteListSource(this._quoteList) {
    buildDataGridRows();
  }

  List<QuoteList> _quoteList = [];
  List<DataGridRow> dataGridRows = [];

  buildDataGridRows() {
    return dataGridRows = _quoteList.map<DataGridRow>((dataGridRow) {
      return dataGridRow.getDataGridRow_QuoteList();
    }).toList();
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override

  /// This method is called when the data grid needs to create a new row. If the row has no cells, it is assumed to be a header row and a single blank cell is returned. Otherwise, the cells of the row are mapped to widgets and returned as a DataGridRowAdapter.
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(5.0),
          child: Text(
            (dataGridRows.indexOf(row) + 1).toString(),
            style: style12_black,
          ),
        ),
        ...row.getCells().map<Widget>((dataGridCell) => Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(5.0),
              child: dataGridCell.value == null
                  ? SizedBox()
                  : Text(
                      dataGridCell.columnName == 'Date'
                          ? changeDatetoShow(
                              date:
                                  DateTime.parse(dataGridCell.value.toString()))
                          : dataGridCell.value.toString(),
                      style: style12_black,
                      overflow: TextOverflow.ellipsis),
            ))
      ].toList(),
    );
  }
}
