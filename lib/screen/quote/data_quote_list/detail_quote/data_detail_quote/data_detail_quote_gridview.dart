import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_lotus/assets/style.dart';
import 'package:web_lotus/model/model_quote_detail.dart';

class DataQuoteDetailSource extends DataGridSource {
  DataQuoteDetailSource(this._quoteDetail) {
    _dataGridRows = _quoteDetail
        .map<DataGridRow>(
            (DataGridRow) => DataGridRow.getDataGridRow_QuoteDetail())
        .toList();
  }

  List<QuoteDetail> _quoteDetail = [];
  List<DataGridRow> _dataGridRows = [];

  @override
  List<DataGridRow> get rows => _dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row
            .getCells()
            .map<Widget>((dataGridCell) => Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(5.0),
                  child: dataGridCell.value == null
                      ? SizedBox()
                      : Text(dataGridCell.value.toString(),
                          style: style12_black,
                          overflow: TextOverflow.ellipsis),
                ))
            .toList());
  }
}
