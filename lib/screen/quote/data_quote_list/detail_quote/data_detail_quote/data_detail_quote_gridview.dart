import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_lotus/assets/style.dart';
import 'package:web_lotus/model/model_quote_detail.dart';

class DataQuoteDetailSource extends DataGridSource {
  DataQuoteDetailSource(this._quoteDetail) {
    _quoteDetail_original = _quoteDetail;
    buildDataGridRows();
  }

  List<QuoteDetail> _quoteDetail = [];
  List<QuoteDetail> _quoteDetail_original = [];
  List<DataGridRow> _dataGridRows = [];

  void buildDataGridRows() {
    _dataGridRows = _quoteDetail
        .map<DataGridRow>(
            (DataGridRow) => DataGridRow.getDataGridRow_QuoteDetail())
        .toList();
  }

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

  void applyFilter({
    required String cntr,
    required String chargeTypeCode,
    required String componentCode,
    required String categoryCode,
    required String damageCode,
    required String location,
  }) {
    _quoteDetail = _quoteDetail_original
        .where((element) =>
            element.container!.toUpperCase().contains(cntr.toUpperCase()) &&
            element.chargeType!
                .toUpperCase()
                .contains(chargeTypeCode.toUpperCase()) &&
            element.component!
                .toUpperCase()
                .contains(componentCode.toUpperCase()) &&
            element.category!
                .toUpperCase()
                .contains(categoryCode.toUpperCase()) &&
            element.damageCode!
                .toUpperCase()
                .contains(damageCode.toUpperCase()) &&
            element.location!.toUpperCase().contains(location.toUpperCase()))
        .toList();
    buildDataGridRows();
    notifyListeners();
  }

  void clear() {
    _quoteDetail = _quoteDetail_original;
    buildDataGridRows();
    notifyListeners();
  }
}
