import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_lotus/assets/style.dart';
import 'package:web_lotus/model/model_input_quote_detail.dart';

class DataInputQuoteGridview extends DataGridSource {
  DataInputQuoteGridview(this._inputQuoteList) {
    buildDataGridRows();
  }

  List<InputQuoteDetail> _inputQuoteList = [];
  List<DataGridRow> dataGridRows = [];

  buildDataGridRows() {
    dataGridRows = _inputQuoteList.map<DataGridRow>((dataGridRow) {
      return dataGridRow.getDataGridRow_InputQuoteDetail();
    }).toList();
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: [
      Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(5.0),
        child: Text(
          (dataGridRows.indexOf(row) + 1).toString(),
          style: style12_black,
        ),
      ),
      ...row
          .getCells()
          .map<Widget>((cell) => Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(5.0),
                child: cell.value == null
                    ? SizedBox()
                    :
                    // cell.columnName == 'R'
                    //     ? InkWell(
                    //         onTap: () {
                    //           dataGridRows.removeAt(dataGridRows.indexOf(row));
                    //           notifyListeners();
                    //         },
                    //         child: Tooltip(
                    //             message: 'Delete', child: Icon(Icons.delete)),
                    //       )
                    //     :
                    cell.columnName == 'Image'
                        ? cell.value == true
                            ? Text('OK',
                                style: style12_black,
                                overflow: TextOverflow.ellipsis)
                            : SizedBox()
                        : Tooltip(
                            message: cell.value.toString(),
                            child: Text(cell.value.toString(),
                                style: style12_black,
                                overflow: TextOverflow.ellipsis),
                          ),
              ))
          .toList(),
    ]);
  }

  // void updateDataGridSource() {
  //   notifyListeners();
  // }
}
