import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_lotus/assets/style.dart';

WidgetGridColumn({required String label, required bool visible}) {
  if (visible == true) {
    visible = true;
  } else {
    visible = false;
  }
  return GridColumn(
      visible: visible,
      columnName: label,
      width: label == 'Container'
          ? 110
          : label == 'Remarks'
              ? 200
              : label == 'Seq.'
                  ? 40
                  : label == 'R'
                      ? 40
                      : double.nan,
      label: Container(
          padding: const EdgeInsets.all(5.0),
          alignment: Alignment.centerLeft,
          child: Text(label,
              style: style11_black, overflow: TextOverflow.ellipsis)));
}
